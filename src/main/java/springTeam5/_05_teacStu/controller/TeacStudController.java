package springTeam5._05_teacStu.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

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
import org.springframework.web.bind.annotation.ResponseBody;

import springTeam5._01_member.model.MemberBean;
import springTeam5._01_member.model.MemberService;
import springTeam5._05_teacStu.model.MatchOption;
import springTeam5._05_teacStu.model.ReplyTeac;
import springTeam5._05_teacStu.model.StudBean;
import springTeam5._05_teacStu.model.TeacBean;
import springTeam5._05_teacStu.service.ReplyTeacServiceInterface;
import springTeam5._05_teacStu.service.StudServiceInterface;
import springTeam5._05_teacStu.service.TeacServiceInterface;
import springTeam5._05_teacStu.service.TeacStudMailService;

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
	
	@Autowired
	private TeacStudMailService mailService;
	
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
		int page2 = 1;
		try {
		    page2 = Integer.parseInt(page);
		} catch (NumberFormatException e) {
		    page2 = 1;
		}
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
		if (teac.size() <= pageSize) {
			startIndex = 0;
		} else if (startIndex >= teac.size()) {
			startIndex = teac.size() - pageSize;
		}
		List<TeacBean> pageTeac = teac.subList(startIndex, endIndex);

		m.addAttribute("pageTeac", pageTeac);
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("currentPage", page2);

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
		int page2 = 1;
		try {
		    page2 = Integer.parseInt(page);
		} catch (NumberFormatException e) {
		    page2 = 1;
		}
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
		if (teac.size() <= pageSize) {
			startIndex = 0;
		} else if (startIndex >= teac.size()) {
			startIndex = teac.size() - pageSize;
		}
		List<TeacBean> pageTeac = teac.subList(startIndex, endIndex);

		m.addAttribute("pageTeac", pageTeac);
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("currentPage", page2);

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
		int page2 = 1;
		try {
		    page2 = Integer.parseInt(page);
		} catch (NumberFormatException e) {
		    page2 = 1;
		}
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
		if (teac.size() <= pageSize) {
			startIndex = 0;
		} else if (startIndex >= teac.size()) {
			startIndex = teac.size() - pageSize;
		}
		List<TeacBean> pageTeac = teac.subList(startIndex, endIndex);

		m.addAttribute("pageTeac", pageTeac);
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("currentPage", page2);

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
		int page2 = 1;
		try {
		    page2 = Integer.parseInt(page);
		} catch (NumberFormatException e) {
		    page2 = 1;
		}
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
		if (teac.size() <= pageSize) {
			startIndex = 0;
		} else if (startIndex >= teac.size()) {
			startIndex = teac.size() - pageSize;
		}
		List<TeacBean> pageTeac = teac.subList(startIndex, endIndex);

		m.addAttribute("pageTeac", pageTeac);
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("currentPage", page2);

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
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> list = mService.searchMemByAccount(account);
		if (list != null && list.size() > 0) {
			  MemberBean member = list.get(0);
			  List<TeacBean> teacBean = member.getTeacBean();
			  if (teacBean != null && !teacBean.isEmpty()) {
				  m.addAttribute("m", teacBean);
			}
			} else {
			  m.addAttribute("m", null);
			}
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
			@RequestParam("conTime") String conTime,@RequestParam("price") Double price,@RequestParam("views") Integer views,
			@RequestParam("teacno") Integer teacno){
		TeacBean t = new TeacBean();
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> list = mService.searchMemByAccount(account);
		MemberBean member = list.get(0);
		t.setTeacno(teacno);
		t.setMember(member);
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
		t.setViews(views);
		tService.updateTeacFromTeacno(t);
		return "redirect:_05_teacStu.searchAllTeac.controller/1";
	}
	
//	修改學生貼文
	@PostMapping("/_05_teacStu.updatedataStud.controller")
	public String processupdatedataStudAction(@RequestParam("educaLimit") String educaLimit,@RequestParam("studLoc") String studLoc,
			@RequestParam("object") String object,@RequestParam("classMode") String classMode,@RequestParam("testTeacMode") String testTeacMode,
			@RequestParam("studTime") String studTime,@RequestParam("conMethod") String conMethod,@RequestParam("conTime") String conTime,
			@RequestParam("price") Double price,@RequestParam("subjectItem") String subjectItem,@RequestParam("textBook") String textBook,
			@RequestParam("startDate") String startDate,@RequestParam("period") String period,@RequestParam("views") Integer views,
			@RequestParam("studno") Integer studno) {
		StudBean s = new StudBean();
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> list = mService.searchMemByAccount(account);
		MemberBean member = list.get(0);
		s.setStudno(studno);
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
		s.setViews(views);
		sService.updateStudFromStudno(s);
		return "redirect:_05_teacStu.searchAllStud.controller/1";
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
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> list = mService.searchMemByAccount(account);
		MemberBean member = list.get(0);
		t.setMember(member);
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
		t.setViews(0);
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
	
//	匹配度功能
	@PostMapping("/_05_teacStu.match.controller")
	@ResponseBody
	public List<TeacBean> processMatchAction(@RequestBody MatchOption options) {
		Integer goal = 0;
		List<String> north = Arrays.asList("台北市","臺北市","新北市","基隆市","宜蘭縣","桃園市","新竹縣","新竹市");
		List<String> middle = Arrays.asList("台中市","臺中市","苗栗縣","彰化縣","南投縣","雲林縣");
		List<String> south = Arrays.asList("台南市","臺南市","高雄市","嘉義市","嘉義縣","屏東縣","澎湖縣");
		List<String> east = Arrays.asList("花蓮縣","台東縣","臺東縣");
		List<String> weekday = Arrays.asList("平日早上","平日下午","平日晚上");
		List<String> holiday = Arrays.asList("假日早上","假日下午","假日晚上");
		List<String> chinese = Arrays.asList("國文","中文");
		List<String> english = Arrays.asList("英文","美語");
		List<TeacBean> query1 = new ArrayList<>();
		String location = options.getLocation();
		String object = options.getObject();
		String time = options.getTime();
		switch (location) {
		case "北部":
			query1 = tService.findByTeacLocIn(north);
			break;
		case "中部":
			query1 = tService.findByTeacLocIn(middle);
			break;
		case "南部":
			query1 = tService.findByTeacLocIn(south);
			break;
		case "東部":
			query1 = tService.findByTeacLocIn(east);
			break;
		}
		
		if (query1.size() > 0) {
			goal = goal + 33;
		}
		
		List<TeacBean> query2 = new ArrayList<>();
		switch (object) {
		case "國小":
			query2 = tService.findByTeacObjectContaining("國小");
			break;
		case "國中":
			query2 = tService.findByTeacObjectContaining("國中");
			break;
		case "高中":
			query2 = tService.findByTeacObjectContaining("高中");
			break;
		case "大學":
			query2 = tService.findByTeacObjectContaining("大學");
			break;
		}
		
		if (query2.size() > 0) {
			goal = goal + 33;
		}
		
		List<TeacBean> query3 = new ArrayList<>();
		switch (time) {
		case "平日":
			query3 = tService.findByTeacTimeIn(weekday);
			break;
		case "假日":
			query3 = tService.findByTeacTimeIn(holiday);
			break;
		case "皆可":
			query3 = tService.searchAllTeac();
			break;
		}
		
		if (query3.size() > 0) {
			goal = goal + 33;
		}
		
//		以下功能測試中
		/*
		List<TeacBean> query4 = new ArrayList<>();
		switch (sub) {
		case "國文":
			query4 = tService.findBySubjectItemIn(chinese);
			break;
		case "英文":
			query4 = tService.findBySubjectItemIn(english);
			break;
		}
		*/
		
		List<TeacBean> allData = new ArrayList<>();
		allData.addAll(query1);
		allData.addAll(query2);
		allData.addAll(query3);

		// 刪除重複資料
		allData = allData.stream().distinct().collect(Collectors.toList());
		// 根據條件符合最多的資料從最前面開始排列
		allData.sort((o1, o2) -> {
		int count1 = 0, count2 = 0;
		if (north.contains(o1.getTeacLoc())) {
		count1++;
		}
		if (north.contains(o2.getTeacLoc())) {
		count2++;
		}
		if (o1.getTeacObject().contains(object)) {
		count1++;
		}
		if (o2.getTeacObject().contains(object)) {
		count2++;
		}
		if (weekday.contains(o1.getTeacTime()) || holiday.contains(o1.getTeacTime())) {
		count1++;
		}
		if (weekday.contains(o2.getTeacTime()) || holiday.contains(o2.getTeacTime())) {
		count2++;
		}
		return count2 - count1;
		});
		
		return allData;
	}
	
//  增加教師履歷瀏覽次數
	@GetMapping("/_05_teacStu.teacview.controller")
	public String processteacviewAction(@RequestParam("teacno") Integer teacno) {
		TeacBean t = tService.searchTeacFromTeacno(teacno);
		Integer views = t.getViews();
		views += 1;
		t.setViews(views);
		tService.updateTeacFromTeacno(t);
		return null;
 }
	
//  增加學生貼文瀏覽次數
	@GetMapping("/_05_teacStu.studview.controller")
	public String processstudviewAction(@RequestParam("studno") Integer studno) {
		StudBean s = sService.searchStudFromStudno(studno);
		Integer views = s.getViews();
		views += 1;
		s.setViews(views);
		sService.updateStudFromStudno(s);
		return null;
 }
	
//	寄送信件給教師
	@GetMapping("/_05_teacStu.teacmail.controller")
	public String processteacmailAction(@RequestParam("teacno") Integer teacno) {
		TeacBean t = tService.searchTeacFromTeacno(teacno);
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> list = mService.searchMemByAccount(account);
		MemberBean member = list.get(0);
		String memberEmailTeac = t.getMember().geteMail();
		String memberNameTeac = t.getMember().getMemName();
		String memberEmail = member.geteMail();
		String memberName = member.getMemName();
		mailService.prepareAndSendForTeac(memberEmailTeac, memberEmail, memberName, memberNameTeac);
		
		return "redirect:_05_teacStu.searchAllTeac.controller/1";
	}
	
//	寄送信件給學生
	@GetMapping("/_05_teacStu.studmail.controller")
	public String processstudmailAction(@RequestParam("studno") Integer studno) {
		StudBean s = sService.searchStudFromStudno(studno);
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> list = mService.searchMemByAccount(account);
		MemberBean member = list.get(0);
		String memberEmailStud = s.getMember().geteMail();
		String memberNameStud = s.getMember().getMemName();
		String memberEmail = member.geteMail();
		String memberName = member.getMemName();
		mailService.prepareAndSendForTeac(memberEmailStud, memberEmail, memberName, memberNameStud);
		
		return "redirect:_05_teacStu.searchAllStud.controller/1";
	}
}
