package springTeam5._05_teacStu.controller;

<<<<<<< HEAD
import java.security.Principal;
=======
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.Principal;
import java.sql.Blob;
import java.sql.SQLException;
>>>>>>> origin/_01_Seal
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.annotation.MultipartConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
<<<<<<< HEAD
=======
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
>>>>>>> origin/_01_Seal

import springTeam5._01_member.model.MemberBean;
import springTeam5._01_member.model.MemberService;
import springTeam5._05_teacStu.model.ReplyTeac;
import springTeam5._05_teacStu.model.StudBean;
import springTeam5._05_teacStu.model.TeacBean;
<<<<<<< HEAD
=======
import springTeam5._05_teacStu.service.GlobalService;
>>>>>>> origin/_01_Seal
import springTeam5._05_teacStu.service.ReplyTeacServiceInterface;
import springTeam5._05_teacStu.service.StudServiceInterface;
import springTeam5._05_teacStu.service.TeacServiceInterface;

@MultipartConfig()
@Controller
public class TeacStudController {
	
	@Autowired
	private TeacServiceInterface tService;
	
	@Autowired
	private StudServiceInterface sService;
	
	@Autowired
	private ReplyTeacServiceInterface rtService;
	
	@Autowired
	private MemberService mService;
	
	public String getCurrentDate() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		return sdf.format(date);
	}
	
	
//	搜尋全部教師貼文
	@GetMapping(path = "/_05_teacStu.searchAllTeac.controller/{page}")
	public String processsearchAllTeacAction(@ModelAttribute("TeacBean") TeacBean tb, BindingResult result, Model m, @PathVariable("page") String page) {
		if(result.hasErrors()) {
			return "membersError";
		}
		List<TeacBean> teac = tService.searchAllTeacOBpDate();
<<<<<<< HEAD
		int page2 = 1;
		try {
		    page2 = Integer.parseInt(page);
		} catch (NumberFormatException e) {
		    page2 = 1;
		}
=======
		int page2 = Integer.parseInt(page);
>>>>>>> origin/_01_Seal
		// 每頁顯示的貼文數量，可以自行修改
		int pageSize = 5;
		int totalPages = (int) Math.ceil((double) teac.size() / pageSize);
		int startIndex = (page2 - 1) * pageSize;
		int endIndex = startIndex + pageSize;
		if (endIndex > teac.size()) {
		endIndex = teac.size();
		}
		if (startIndex >= teac.size()) {
			startIndex = teac.size() - pageSize;
		}
<<<<<<< HEAD
		if (teac.size() <= pageSize) {
			startIndex = 0;
		} else if (startIndex >= teac.size()) {
			startIndex = teac.size() - pageSize;
		}
=======
>>>>>>> origin/_01_Seal
		List<TeacBean> pageTeac = teac.subList(startIndex, endIndex);

		m.addAttribute("pageTeac", pageTeac);
		m.addAttribute("totalPages", totalPages);
<<<<<<< HEAD
		m.addAttribute("currentPage", page2);
=======
		m.addAttribute("currentPage", page);
>>>>>>> origin/_01_Seal

		return "_05_teacStu/teacCRUD";
	}
	
//	搜尋全部學生貼文
	@GetMapping(path = "/_05_teacStu.searchAllStud.controller/{page}")
	public String processsearchAllStudAcction(@ModelAttribute("StudBean") StudBean tfs, BindingResult result, Model m, @PathVariable("page") String page){
		if(result.hasErrors()) {
			return "membersError";
		}
		List<StudBean> stud = sService.searchAllStudOBpDate();
		int page2 = 1;
		try {
		    page2 = Integer.parseInt(page);
		} catch (NumberFormatException e) {
		    page2 = 1;
		}
		// 每頁顯示的貼文數量，可以自行修改
		int pageSize = 5;
		int totalPages = (int) Math.ceil((double) stud.size() / pageSize);
		int startIndex = (page2 - 1) * pageSize;
		int endIndex = startIndex + pageSize;
		if (endIndex > stud.size()) {
			endIndex = stud.size();
		}
		if (startIndex >= stud.size()) {
			startIndex = stud.size() - pageSize;
		}
		if (stud.size() <= pageSize) {
			startIndex = 0;
		} else if (startIndex >= stud.size()) {
			startIndex = stud.size() - pageSize;
		}
		List<StudBean> pageStud = stud.subList(startIndex, endIndex);
		
		m.addAttribute("pageStud", pageStud);
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("currentPage", page2);
		
		return "_05_teacStu/studCRUD";
	}
	
//	搜尋教師貼文用價格區間篩選
	@PostMapping(path = "/_05_teacStu.searchAllByPrice.controller/{page}")
	public String processsearchAllByPriceAcction(@RequestParam("low") String lowstr, @RequestParam("high") String highstr, Model m, @PathVariable("page") String page){
		
		if (lowstr.equals("最低時薪") || lowstr.equals("")) {
			lowstr = "0";
		}
		if (highstr.equals("最高時薪") || highstr.equals("")) {
			highstr = "999999999";
		}
		
		Double low = Double.valueOf(lowstr);
		Double high = Double.valueOf(highstr);
		
		List<TeacBean> teac = tService.searchTeacByPrice(low, high);
<<<<<<< HEAD
		int page2 = 1;
		try {
		    page2 = Integer.parseInt(page);
		} catch (NumberFormatException e) {
		    page2 = 1;
		}
=======
		int page2 = Integer.parseInt(page);
>>>>>>> origin/_01_Seal
		// 每頁顯示的貼文數量，可以自行修改
		int pageSize = 5;
		int totalPages = (int) Math.ceil((double) teac.size() / pageSize);
		int startIndex = (page2 - 1) * pageSize;
		int endIndex = startIndex + pageSize;
		if (endIndex > teac.size()) {
		endIndex = teac.size();
		}
		if (startIndex >= teac.size()) {
			startIndex = teac.size() - pageSize;
		}
<<<<<<< HEAD
		if (teac.size() <= pageSize) {
			startIndex = 0;
		} else if (startIndex >= teac.size()) {
			startIndex = teac.size() - pageSize;
		}
=======
>>>>>>> origin/_01_Seal
		List<TeacBean> pageTeac = teac.subList(startIndex, endIndex);

		m.addAttribute("pageTeac", pageTeac);
		m.addAttribute("totalPages", totalPages);
<<<<<<< HEAD
		m.addAttribute("currentPage", page2);
=======
		m.addAttribute("currentPage", page);
>>>>>>> origin/_01_Seal

		return "_05_teacStu/teacCRUD";
	}
	
//	搜尋學生貼文用價格區間篩選
	@PostMapping(path = "/_05_teacStu.searchAllStudByPrice.controller/{page}")
	public String processsearchAllStudByPriceAcction(@RequestParam("low") String lowstr, @RequestParam("high") String highstr, Model m, @PathVariable("page") String page){
		
		if (lowstr.equals("最低時薪") || lowstr.equals("")) {
			lowstr = "0";
		}
		if (highstr.equals("最高時薪") || highstr.equals("")) {
			highstr = "999999999";
		}
		
		Double low = Double.valueOf(lowstr);
		Double high = Double.valueOf(highstr);
		
		List<StudBean> stud = sService.searchStudByPrice(low, high);
		int page2 = 1;
		try {
		    page2 = Integer.parseInt(page);
		} catch (NumberFormatException e) {
		    page2 = 1;
		}
		// 每頁顯示的貼文數量，可以自行修改
		int pageSize = 5;
		int totalPages = (int) Math.ceil((double) stud.size() / pageSize);
		int startIndex = (page2 - 1) * pageSize;
		int endIndex = startIndex + pageSize;
		if (endIndex > stud.size()) {
			endIndex = stud.size();
		}
		if (startIndex >= stud.size()) {
			startIndex = stud.size() - pageSize;
		}
		if (stud.size() <= pageSize) {
			startIndex = 0;
		} else if (startIndex >= stud.size()) {
			startIndex = stud.size() - pageSize;
		}
		List<StudBean> pageStud = stud.subList(startIndex, endIndex);
		
		m.addAttribute("pageStud", pageStud);
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("currentPage", page2);

		return "_05_teacStu/studCRUD";
	}
	
//	模糊搜尋教師貼文
	@PostMapping(path = "/_05_teacStu.searchAllLike.controller/{page}")
	public String processsearchAllLikeAcction(@RequestParam("search") String search, Model m, @PathVariable("page") String page){
		
		List<TeacBean> teac = tService.searchAllLike(search);
<<<<<<< HEAD
		int page2 = 1;
		try {
		    page2 = Integer.parseInt(page);
		} catch (NumberFormatException e) {
		    page2 = 1;
		}
=======
		int page2 = Integer.parseInt(page);
>>>>>>> origin/_01_Seal
		// 每頁顯示的貼文數量，可以自行修改
		int pageSize = 5;
		int totalPages = (int) Math.ceil((double) teac.size() / pageSize);
		int startIndex = (page2 - 1) * pageSize;
		int endIndex = startIndex + pageSize;
		if (endIndex > teac.size()) {
		endIndex = teac.size();
		}
		if (startIndex >= teac.size()) {
			startIndex = teac.size() - pageSize;
		}
<<<<<<< HEAD
		if (teac.size() <= pageSize) {
			startIndex = 0;
		} else if (startIndex >= teac.size()) {
			startIndex = teac.size() - pageSize;
		}
=======
>>>>>>> origin/_01_Seal
		List<TeacBean> pageTeac = teac.subList(startIndex, endIndex);

		m.addAttribute("pageTeac", pageTeac);
		m.addAttribute("totalPages", totalPages);
<<<<<<< HEAD
		m.addAttribute("currentPage", page2);
=======
		m.addAttribute("currentPage", page);
>>>>>>> origin/_01_Seal

		return "_05_teacStu/teacCRUD";
	}
	
//	模糊搜尋學生貼文
	@PostMapping(path = "/_05_teacStu.searchAllLikeStud.controller/{page}")
	public String processsearchAllLikeStudAcction(@RequestParam("search") String search, Model m, @PathVariable("page") String page){
		
		List<StudBean> stud = sService.searchAllLikeStud(search);
		int page2 = 1;
		try {
		    page2 = Integer.parseInt(page);
		} catch (NumberFormatException e) {
		    page2 = 1;
		}
		// 每頁顯示的貼文數量，可以自行修改
		int pageSize = 5;
		int totalPages = (int) Math.ceil((double) stud.size() / pageSize);
		int startIndex = (page2 - 1) * pageSize;
		int endIndex = startIndex + pageSize;
		if (endIndex > stud.size()) {
			endIndex = stud.size();
		}
		if (startIndex >= stud.size()) {
			startIndex = stud.size() - pageSize;
		}
		if (stud.size() <= pageSize) {
			startIndex = 0;
		} else if (startIndex >= stud.size()) {
			startIndex = stud.size() - pageSize;
		}
		List<StudBean> pageStud = stud.subList(startIndex, endIndex);
		
		m.addAttribute("pageStud", pageStud);
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("currentPage", page2);

		return "_05_teacStu/studCRUD";
	}
	
//	條件篩選搜尋教師貼文
	@PostMapping(path = "/_05_teacStu.switchsequence.controller/{page}")
	public String processswitchsequenceAcction(@RequestParam("case") String choose, Model m, @PathVariable("page") String page){

		List<TeacBean> teac = new ArrayList<>();
		switch (choose) {
		case "1":
			teac = tService.findAllByOrderByViews();
			break;
		case "2":
			teac = tService.searchAllTeacOBpDate();
			break;
		case "3":
			teac = tService.searchAllTeacOBprice();
			break;
		default:
			teac = tService.searchAllTeac();
			break;
		}
<<<<<<< HEAD
		int page2 = 1;
		try {
		    page2 = Integer.parseInt(page);
		} catch (NumberFormatException e) {
		    page2 = 1;
		}
=======
		int page2 = Integer.parseInt(page);
>>>>>>> origin/_01_Seal
		// 每頁顯示的貼文數量，可以自行修改
		int pageSize = 5;
		int totalPages = (int) Math.ceil((double) teac.size() / pageSize);
		int startIndex = (page2 - 1) * pageSize;
		int endIndex = startIndex + pageSize;
		if (endIndex > teac.size()) {
		endIndex = teac.size();
		}
		if (startIndex >= teac.size()) {
			startIndex = teac.size() - pageSize;
		}
<<<<<<< HEAD
		if (teac.size() <= pageSize) {
			startIndex = 0;
		} else if (startIndex >= teac.size()) {
			startIndex = teac.size() - pageSize;
		}
=======
>>>>>>> origin/_01_Seal
		List<TeacBean> pageTeac = teac.subList(startIndex, endIndex);

		m.addAttribute("pageTeac", pageTeac);
		m.addAttribute("totalPages", totalPages);
<<<<<<< HEAD
		m.addAttribute("currentPage", page2);
=======
		m.addAttribute("currentPage", page);
>>>>>>> origin/_01_Seal

		return "_05_teacStu/teacCRUD";
	}
	
//	條件篩選搜尋學生貼文
	@PostMapping(path = "/_05_teacStu.switchsequenceStud.controller/{page}")
	public String processswitchsequenceStudAcction(@RequestParam("case") String choose, Model m, @PathVariable("page") String page){
		
		List<StudBean> stud = new ArrayList<>();
		switch (choose) {
		case "1":
			stud = sService.findAllByOrderByViews();
			break;
		case "2":
			stud = sService.searchAllStudOBpDate();
			break;
		case "3":
			stud = sService.searchAllStudOBprice();
			break;
		default:
			stud = sService.searchAllStud();
			break;
		}
		int page2 = 1;
		try {
		    page2 = Integer.parseInt(page);
		} catch (NumberFormatException e) {
		    page2 = 1;
		}
		// 每頁顯示的貼文數量，可以自行修改
		int pageSize = 5;
		int totalPages = (int) Math.ceil((double) stud.size() / pageSize);
		int startIndex = (page2 - 1) * pageSize;
		int endIndex = startIndex + pageSize;
		if (endIndex > stud.size()) {
			endIndex = stud.size();
		}
		if (startIndex >= stud.size()) {
			startIndex = stud.size() - pageSize;
		}
		if (stud.size() <= pageSize) {
			startIndex = 0;
		} else if (startIndex >= stud.size()) {
			startIndex = stud.size() - pageSize;
		}
		List<StudBean> pageStud = stud.subList(startIndex, endIndex);
		
		m.addAttribute("pageStud", pageStud);
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("currentPage", page2);

		return "_05_teacStu/studCRUD";
	}
	
//	轉跳教師修改頁面
	@GetMapping("/_05_teacStu.updatedataMain.controller")
	public String processUpdateMainAction(@RequestParam("teacno") Integer teacno, 
			@ModelAttribute("TeacBean") TeacBean tft, BindingResult result, Model m) {
		if(result.hasErrors()) {
			return "membersError";
		}
		TeacBean teac = tService.searchTeacFromTeacno(teacno);
		m.addAttribute("bean", teac);
		return "_05_teacStu/updateteac";
	}
	
//	轉跳教師貼文頁面
	@GetMapping("/_05_teacStu.teacpostpageMain.controller")
	public String processTeacPostPageMainAction(@RequestParam("teacno") Integer teacno, 
			@ModelAttribute("TeacBean") TeacBean tft, BindingResult result, Model m) {
		if(result.hasErrors()) {
			return "membersError";
		}
		TeacBean teac = tService.searchTeacFromTeacno(teacno);
		List<ReplyTeac> reply = rtService.findByTeacherTeacno(teacno);
		m.addAttribute("bean", teac);
		m.addAttribute("reply", reply);
		return "_05_teacStu/teacresumepage";
	}
	
//	轉跳學生修改頁面
	@GetMapping("/_05_teacStu.updatedataStudMain.controller")
	public String processUpdateStudMainAction(@RequestParam("studno") Integer studno, 
			@ModelAttribute("StudBean") StudBean tfs, BindingResult result, Model m) {
		if(result.hasErrors()) {
			return "membersError";
		}
		StudBean stud = sService.searchStudFromStudno(studno);
		m.addAttribute("bean", stud);
		return "_05_teacStu/updatestud";
	}
	
//	轉跳學生貼文頁面
	@GetMapping("/_05_teacStu.studpostpageMain.controller")
	public String processStudPostPageMainAction(@RequestParam("studno") Integer studno, 
			@ModelAttribute("StudBean") StudBean tfs, BindingResult result, Model m) {
		if(result.hasErrors()) {
			return "membersError";
		}
		StudBean stud = sService.searchStudFromStudno(studno);
<<<<<<< HEAD
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> list = mService.searchMemByAccount(account);
		if (list != null && list.size() > 0) {
			  MemberBean member = list.get(0);
			  m.addAttribute("m", member);
			} else {
			  m.addAttribute("m", null);
			}
=======
>>>>>>> origin/_01_Seal
		m.addAttribute("bean", stud);
		return "_05_teacStu/studpostpage";
	}
	
//	修改教師貼文
	@PostMapping("/_05_teacStu.updatedata.controller")
	public String processupdatedataAction(@RequestParam("highEdu") String highEdu, @RequestParam("studExp") String studExp,
			@RequestParam("tutorExp") String tutorExp,@RequestParam("lanAbility") String lanAbility,
			@RequestParam("skills") String skills,@RequestParam("subjectItem") String subjectItem,
			@RequestParam("teacLoc") String teacLoc,@RequestParam("teacObject") String teacObject,
			@RequestParam("teacTime") String teacTime,@RequestParam("classMode") String classMode,
			@RequestParam("willTeac") String willTeac,@RequestParam("conMethod") String conMethod,
<<<<<<< HEAD
			@RequestParam("conTime") String conTime,@RequestParam("price") Double price,@RequestParam("teacno") Integer teacno){
		TeacBean t = new TeacBean();
		t.setTeacno(teacno);
=======
			@RequestParam("conTime") String conTime,@RequestParam("price") Double price){
		TeacBean t = new TeacBean();
		Optional<MemberBean> m = mService.searchMemByID(4);
		MemberBean memberBean = m.get();
		t.setMember(memberBean);
>>>>>>> origin/_01_Seal
		t.setUpdateDate(getCurrentDate());
		t.setHighEdu(highEdu);
		t.setStudExp(studExp);
		t.setTutorExp(tutorExp);
		t.setLanAbility(lanAbility);
		t.setSkills(skills);
		t.setSubjectItem(subjectItem);
		t.setTeacLoc(teacLoc);
		t.setTeacObject(teacObject);
		t.setTeacTime(teacTime);
		t.setClassMode(classMode);
		t.setWillTeac(willTeac);
		t.setConMethod(conMethod);
		t.setConTime(conTime);
		t.setPrice(price);
		tService.updateTeacFromTeacno(t);
		return "redirect:_05_teacStu.searchAllTeac.controller/1";
	}
	
//	修改學生貼文
	@PostMapping("/_05_teacStu.updatedataStud.controller")
<<<<<<< HEAD
	public String processupdatedataStudAction(@RequestParam("educaLimit") String educaLimit,@RequestParam("studLoc") String studLoc,
			@RequestParam("object") String object,@RequestParam("classMode") String classMode,@RequestParam("testTeacMode") String testTeacMode,
			@RequestParam("studTime") String studTime,@RequestParam("conMethod") String conMethod,@RequestParam("conTime") String conTime,
			@RequestParam("price") Double price,@RequestParam("subjectItem") String subjectItem,@RequestParam("textBook") String textBook,
			@RequestParam("startDate") String startDate,@RequestParam("period") String period,@RequestParam("studno") Integer studno) {
		StudBean s = new StudBean();
		s.setStudno(studno);
		s.setUpdateDate(getCurrentDate());
		s.setEducaLimit(educaLimit);
		s.setStudLoc(studLoc);
		s.setObject(object);
		s.setClassMode(classMode);
		s.setTestTeacMode(testTeacMode);
		s.setStudTime(studTime);
		s.setConMethod(conMethod);
		s.setConTime(conTime);
		s.setPrice(price);
		s.setSubjectItem(subjectItem);
		s.setTextBook(textBook);
		s.setStartDate(startDate);
		s.setPeriod(period);
		sService.updateStudFromStudno(s);
		return "redirect:_05_teacStu.searchAllStud.controller/1";
=======
	public String processupdatedataStudAction(@RequestParam("studno") Integer studno, @RequestParam("memberId") Integer memberId, @RequestParam("title") String title,
			@RequestParam("detail") String detail, @RequestParam("price") Double price, @RequestParam("subjectItem") String subjectItem, 
			@RequestParam("learnLoc") String learnLoc, @RequestParam("images") MultipartFile mf) throws IOException, SQLException {
		InputStream in = mf.getInputStream();
		long size = mf.getSize();
		Blob b = GlobalService.fileToBlob(in, size);
		Date date = new Date();
		StudBean stud = sService.searchStudFromStudno(studno);
		stud.setmemberId(memberId);
		stud.setTitle(title);
		stud.setpostDate(date);
		stud.setDetail(detail);
		stud.setPrice(price);
		stud.setsubjectItem(subjectItem);
		stud.setlearnLoc(learnLoc);
		if (size != 0) {
			stud.setclassPicture(b);
			sService.updateStudFromStudno(stud);
		}else {
			sService.updateStudFromStudno(stud);
		}
		return "redirect:_05_teacStu.searchAllStud.controller";
>>>>>>> origin/_01_Seal
	}
	
//	轉跳教師新增頁面
	@GetMapping("/_05_teacStu.insertdataMain.controller")
	public String processinsertdataMainAction(Model m) {
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> list = mService.searchMemByAccount(account);
		MemberBean member = list.get(0);
		m.addAttribute("bean", member);
		return "_05_teacStu/insertpage";
	}
	
//	轉跳學生新增頁面
	@GetMapping("/_05_teacStu.insertdataStudMain.controller")
	public String processinsertdataStudMainAction(Model m) {
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> list = mService.searchMemByAccount(account);
		MemberBean member = list.get(0);
		m.addAttribute("bean", member);
		return "_05_teacStu/insertpagestud";
	}
	
//	測試principle
	@GetMapping("/_05_teacStu.getxx.controller")
	public MemberBean getxx(Principal p) {
		List<MemberBean> userList = mService.searchMemByAccount(p.getName());
		MemberBean user = userList.get(0);
		return user;
	}
	
//	新增教師貼文
	@PostMapping("/_05_teacStu.insertdata.controller")
	public String processinsertdataAction(@RequestParam("highEdu") String highEdu, @RequestParam("studExp") String studExp,
			@RequestParam("tutorExp") String tutorExp,@RequestParam("lanAbility") String lanAbility,
			@RequestParam("skills") String skills,@RequestParam("subjectItem") String subjectItem,
			@RequestParam("teacLoc") String teacLoc,@RequestParam("teacObject") String teacObject,
			@RequestParam("teacTime") String teacTime,@RequestParam("classMode") String classMode,
			@RequestParam("willTeac") String willTeac,@RequestParam("conMethod") String conMethod,
			@RequestParam("conTime") String conTime,@RequestParam("price") Double price){
		TeacBean t = new TeacBean();
<<<<<<< HEAD
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> list = mService.searchMemByAccount(account);
		MemberBean member = list.get(0);
		t.setMember(member);
=======
		Optional<MemberBean> m = mService.searchMemByID(4);
		MemberBean memberBean = m.get();
		t.setMember(memberBean);
>>>>>>> origin/_01_Seal
		t.setUpdateDate(getCurrentDate());
		t.setHighEdu(highEdu);
		t.setStudExp(studExp);
		t.setTutorExp(tutorExp);
		t.setLanAbility(lanAbility);
		t.setSkills(skills);
		t.setSubjectItem(subjectItem);
		t.setTeacLoc(teacLoc);
		t.setTeacObject(teacObject);
		t.setTeacTime(teacTime);
		t.setClassMode(classMode);
		t.setWillTeac(willTeac);
		t.setConMethod(conMethod);
		t.setConTime(conTime);
		t.setPrice(price);
<<<<<<< HEAD
		t.setViews(0);
=======
>>>>>>> origin/_01_Seal
	    tService.addTeac(t);
		return "redirect:_05_teacStu.searchAllTeac.controller/1";
	}
	
//	新增教師貼文回覆
	@GetMapping("/_05_teacStu.insertreply.controller")
	public String processinsertreplyAction(@RequestParam("teacno") Integer teacno, @RequestParam Integer score, @RequestParam String reply, Model m) {
		TeacBean t = tService.searchTeacFromTeacno(teacno);
		ReplyTeac rt = new ReplyTeac();
		rt.setReplyDate(getCurrentDate());
		rt.setTeacher(t);
		rt.setScore(score);
		rt.setReply(reply);
		rtService.addReplyTeac(rt);
		TeacBean teac = tService.searchTeacFromTeacno(teacno);
		List<ReplyTeac> replys = rtService.findByTeacherTeacno(teacno);
		m.addAttribute("bean", teac);
		m.addAttribute("reply", replys);
		return "_05_teacStu/teacresumepage";
	}
	
//	新增學生貼文
	@PostMapping("/_05_teacStu.insertdataStud.controller")
<<<<<<< HEAD
	public String processinsertdataStudAction(@RequestParam("educaLimit") String educaLimit,@RequestParam("studLoc") String studLoc,
			@RequestParam("object") String object,@RequestParam("classMode") String classMode,@RequestParam("testTeacMode") String testTeacMode,
			@RequestParam("studTime") String studTime,@RequestParam("conMethod") String conMethod,@RequestParam("conTime") String conTime,
			@RequestParam("price") Double price,@RequestParam("subjectItem") String subjectItem,@RequestParam("textBook") String textBook,
			@RequestParam("startDate") String startDate,@RequestParam("period") String period) {
		StudBean s = new StudBean();
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> list = mService.searchMemByAccount(account);
		MemberBean member = list.get(0);
		s.setMember(member);
		s.setUpdateDate(getCurrentDate());
		s.setEducaLimit(educaLimit);
		s.setStudLoc(studLoc);
		s.setObject(object);
		s.setClassMode(classMode);
		s.setTestTeacMode(testTeacMode);
		s.setStudTime(studTime);
		s.setConMethod(conMethod);
		s.setConTime(conTime);
		s.setPrice(price);
		s.setSubjectItem(subjectItem);
		s.setTextBook(textBook);
		s.setStartDate(startDate);
		s.setPeriod(period);
		s.setViews(0);
		sService.addStud(s);
		return "redirect:_05_teacStu.searchAllStud.controller/1";
=======
	public String processinsertdataStudAction(@RequestParam("memberId") Integer memberId, @RequestParam("title") String title, @RequestParam("detail") String detail,
								@RequestParam("price") Double price, @RequestParam("subjectItem") String subjectItem, 
								@RequestParam("learnLoc") String learnLoc, @RequestParam("images") MultipartFile mf) throws IllegalStateException, IOException, SQLException {
		InputStream in = mf.getInputStream();
		long size = mf.getSize();
		Blob b = GlobalService.fileToBlob(in, size);
		Date date = new Date();
		StudBean t = new StudBean();
		t.setmemberId(memberId);
		t.setTitle(title);
		t.setpostDate(date);
		t.setDetail(detail);
		t.setPrice(price);
		t.setsubjectItem(subjectItem);
		t.setlearnLoc(learnLoc);
		t.setclassPicture(b);
		sService.addStud(t);
		return "redirect:_05_teacStu.searchAllStud.controller";
>>>>>>> origin/_01_Seal
	}
	
//	刪除教師貼文
	@GetMapping("/_05_teacStu.deletedata.controller") 
	public String processdeletedataAction(@RequestParam("teacno") Integer teacno) {
		rtService.deleteByTeacherTeacno(teacno);
		tService.deleteTeacfromTeacno(teacno);
		return "redirect:_05_teacStu.searchAllTeac.controller/1";
	}
	
//	刪除學生貼文
	@GetMapping("/_05_teacStu.deletedataStud.controller") 
	public String processdeletedataStudAction(@RequestParam("studno") Integer studno) {
		sService.deleteStudfromStudno(studno);
		return "redirect:_05_teacStu.searchAllStud.controller/1";
	}
	
<<<<<<< HEAD
//	匹配度測試1
	public double calculateSimilarity(String s1, String s2) {
	    int m = s1.length();
	    int n = s2.length();

	    if (m == 0 || n == 0) {
	        return 0.0;
	    }

	    int p = 0;
	    int t = 0;
	    for (int i = 0; i < m; i++) {
	        int j = Math.max(0, Math.max(i - (n - m), i) - t);
	        while (j < n && !(s1.charAt(i) == s2.charAt(j))) {
	            j++;
	        }
	        if (j < n) {
	            p++;
	            t = j - i;
	        }
	    }

	    if (p == 0) {
	        return 0.0;
	    }

	    int s = 0;
	    int k = 0;
	    while (k < p && s1.charAt(k + s) == s2.charAt(k)) {
	        k++;
	    }
	    s = k;

	    return (p / (double) m + p / (double) n + (p - s) / (double) p) / 3.0;
	}
	
//	匹配度測試2
	@GetMapping("/_05_teacStu.compare.controller")
	public double compareTeacBeanAndStudBean(@RequestParam("teacno") Integer teacno, @RequestParam("studno") Integer studno) {
	    double similarity = 0.0;
	    TeacBean t = tService.searchTeacFromTeacno(teacno);
	    StudBean s = sService.searchStudFromStudno(studno);
	    similarity += calculateSimilarity(t.getHighEdu(), s.getEducaLimit());
	    similarity += calculateSimilarity(t.getTeacLoc(), s.getStudLoc());
	    similarity += calculateSimilarity(t.getClassMode(), s.getClassMode());
	    similarity += calculateSimilarity(t.getSubjectItem(), s.getSubjectItem());

	    return similarity;
=======
	
//	儲存學生貼文圖片
	@GetMapping(path = "/_05_teacStu.picsaveStud.controller", produces = "text/plain;charset=UTF-8")
	public void processByteArrayImageStudAction(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		OutputStream os = null;
		InputStream is = null;
		Blob blob = null;
		String id = request.getParameter("id");
		Integer nId = Integer.parseInt(id);
		StudBean bean = sService.searchStudFromStudno(nId);
		if (bean != null) {
			blob = bean.getclassPicture();
			if (blob != null) {
				is = blob.getBinaryStream();
			}
		}
		response.setContentType("jpg/png");
		os = response.getOutputStream();
		int len = 0;
		byte[] bytes = new byte[8192];
		while ((len = is.read(bytes)) != -1) {
			os.write(bytes, 0, len);
		}
		os.close();
>>>>>>> origin/_01_Seal
	}
}
