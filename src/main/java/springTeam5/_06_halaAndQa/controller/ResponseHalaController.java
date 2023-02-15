package springTeam5._06_halaAndQa.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import springTeam5._01_member.model.MemberBean;
import springTeam5._01_member.model.MemberService;
import springTeam5._06_halaAndQa.model.HalaBean;
import springTeam5._06_halaAndQa.model.HalaService;
import springTeam5._06_halaAndQa.model.PictureService;
import springTeam5._06_halaAndQa.model.ResponseHalaBean;
import springTeam5._06_halaAndQa.model.ResponseHalaRepository;
import springTeam5._06_halaAndQa.model.ResponseHalaService;

@Controller
public class ResponseHalaController {

	@Autowired
	private ResponseHalaRepository rhRepo;
	@Autowired
	private ResponseHalaService rhService;
	@Autowired
	private HalaService halaService;
	@Autowired
	private MemberService memberService;

	public String getCurrentDate() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		return sdf.format(date);
	}

	//新增貼文ㄉ留言
	@PostMapping("/_06_halaAndQa.addResponseHala.controller")
	public String addResponseHalaAction(@RequestParam("halaId") Integer halaId,@RequestParam("memberid") Integer memberid,
			@RequestParam("responseHalaContent") String responseHalaContent,HttpServletRequest request
			) throws IOException, SQLException {
		
		HalaBean currentHala = halaService.selectHalaId(halaId);
		ResponseHalaBean newRsBean = new ResponseHalaBean();
		
//		把session 找出來 但不知道找出來幹嘛
		HttpSession session = request.getSession(false);
		
		//查看是否有登入 如果沒有登入則轉跳登入頁面
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
//		用Securityˊ找到目前的登入者的資料 mem (是一個LIST)
		List<MemberBean> mem = memberService.searchMemByAccount(account);
//		假如LIST沒有東西 就請他去登入
		if (mem.size() == 0) {
			return "login";
		}else {
//		假如LIST有東西 代表他有登入 這時候就讓它新增留言
			
//			把LIST 第一筆的MEMBER資料拿出來 是一個memberBean
			mem.get(0);
			
			newRsBean.setResponseHalaPostDate(getCurrentDate());
			newRsBean.setResponseHalaContent(responseHalaContent);
			newRsBean.setMemberBean(mem.get(0));
			newRsBean.setTumb(0);
			newRsBean.setHala(currentHala);
			
			rhService.insertResponseHala(newRsBean);
			
//		List<ResponseHalaBean> rhb = new ArrayList<ResponseHalaBean>();
//		rhb.add(newRsBean);
//		currentHala.setResponseHala(rhb);
//		
//		halaService.insertHala(currentHala);
			
			return null;
		}
	}

	//刪除貼文留言
	@GetMapping("/_06_halaAndQa.deleteResponseHala.controller")
	public String deleteResponseHalaById(@RequestParam("responseHalaId")Integer responseHalaId) {
		rhService.deleteResponseHala(responseHalaId);
		return"redirect:/_06_halaAndQa.goHalaPage.controller";
	}
	

}
