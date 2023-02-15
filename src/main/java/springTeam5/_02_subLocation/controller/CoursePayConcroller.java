package springTeam5._02_subLocation.controller;

import java.sql.SQLException;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import springTeam5._01_member.model.MemberBean;
import springTeam5._01_member.model.MemberService;
import springTeam5._02_subLocation.model.Course;
import springTeam5._02_subLocation.model.CourseOrderBean;
import springTeam5._02_subLocation.service.CourseOrderService;
import springTeam5._02_subLocation.service.CourseService;

@Controller
public class CoursePayConcroller {

	@Autowired
	private MemberService memberService;
	@Autowired
	private CourseOrderService cOrderService;
	@Autowired
	private CourseService courseService;

	// 綠界使用
	AllInOne all = new AllInOne("");
	AioCheckOutALL obj = new AioCheckOutALL();

	// 先到確認要訂購的頁面
	@PostMapping("/courseOrderCheck.controller")
	public String processCheckMainAction(@RequestParam(value = "courseID") Integer courseID, Model model)
			throws SQLException {
		// 查看是否有登入 如果沒有登入則轉跳登入頁面
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> mem = memberService.searchMemByAccount(account);

		if (mem.size() == 0) {
			return "login";
		}

		Course course = courseService.searchSingleCourseFromCourseID(courseID);

		MemberBean member = mem.get(0);

		model.addAttribute("Member", member);
		model.addAttribute("Course", course);

		return "_02_subLocation/courseOrderCheck";

	}

	// 按下確認後到綠界
	@PostMapping("/courseAioPay.controller")
	@ResponseBody
	public String processConfirmAllAction(@RequestParam(value = "courseID") Integer courseID,
			@RequestParam(value = "email") String email, Model model) throws SQLException {

		// 取得會員資料
		String user = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> memberList = memberService.searchMemByAccount(user);
		MemberBean memberBean = memberList.get(0);

		System.out.println("---------------------------------------開始確認訂單");
		// 取得課程資料
		Course course = courseService.searchSingleCourseFromCourseID(courseID);
		// 取得金額
		int coursePrice = course.getCoursePrice();
		CourseOrderBean courseOrder = new CourseOrderBean(null, cOrderService.generateOrderNumber(), memberBean, course,
				cOrderService.getCurrentDate(), coursePrice);
		// 新增一筆訂單
		cOrderService.createCourseOrder(courseOrder);
		// 更新一對多 會員與課程
		Set<CourseOrderBean> items = new LinkedHashSet<>();
		items.add(courseOrder);
		memberBean.setCoureOrder(items);
		memberService.update(memberBean);
		course.setCourseOrder(items);
		courseService.updateCourse(course);

		System.out.println("--------------以下開始綠界");

		Integer courseOId = courseOrder.getCourseOId();
		// ----------------綠借使用
		String meetBothCNo = "MeetBothCTTT";
		meetBothCNo = meetBothCNo + String.valueOf(courseOId); // 訂單流水號

		// 綠界
		// 參考的網站https://hackmd.io/@leonsnoopy/rJVzy9JuN#java%E4%B8%B2%E6%8E%A5%E6%B5%81%E7%A8%8B
		obj.setMerchantTradeNo(meetBothCNo); // 綠界顯示的訂單編號-存一個String
		obj.setMerchantTradeDate("2017/01/01 08:05:23"); // 時間
		obj.setTotalAmount(String.valueOf(coursePrice)); // 綠界結帳的金額 ---轉成String
		obj.setTradeDesc("這是測試-------------------");
		obj.setItemName("MeetBoth 購物商城"); // 要放item的名稱 但我們沒有到他後台那些 所以先隨便放
		// 錯誤return跳轉的網址
		obj.setReturnURL("http://localhost:8080/MeetBoth/index.controller");
		obj.setChooseSubPayment("Credit"); // 預設選信用卡
		// 跳轉的Controller網址
		obj.setOrderResultURL("http://localhost:8080/MeetBoth/courseOrderConfirm.controller"); // 綠界交易成功後要轉跳的網址
		obj.setNeedExtraPaidInfo("N");
		String form = all.aioCheckOut(obj, null);

		return form;

	}

	// 轉跳到訂購成功的頁面
	@PostMapping("/courseOrderConfirm.controller")
	public String processConfirmAction(Model model) {
		// 取得會員資料

		String id = obj.getMerchantTradeNo();
		id = id.replace("MeetBothCTTT", "");
		int cOrderNo = Integer.parseInt(id);
		System.out.println(cOrderNo);
		
		CourseOrderBean courseOrder = cOrderService.findByID(cOrderNo);
		model.addAttribute("CourseOrder", courseOrder);
		return "_02_subLocation/courseOrderSuccess";
	}

}
