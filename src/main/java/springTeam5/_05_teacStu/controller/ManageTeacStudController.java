package springTeam5._05_teacStu.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;

import springTeam5._01_member.model.MemberBean;
import springTeam5._01_member.model.MemberService;
import springTeam5._05_teacStu.model.ReplyTeac;
import springTeam5._05_teacStu.model.StudBean;
import springTeam5._05_teacStu.model.TeacBean;
import springTeam5._05_teacStu.service.ReplyTeacServiceInterface;
import springTeam5._05_teacStu.service.StudServiceInterface;
import springTeam5._05_teacStu.service.TeacServiceInterface;

@MultipartConfig()
@Controller
public class ManageTeacStudController {
	
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
	@GetMapping(path = "/admin/_05_teacStu.searchAllTeac.controller/{page}")
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

		return "_05_teacStu/manageteac";
	}
	
//	搜尋全部學生貼文
	@GetMapping(path = "/admin/_05_teacStu.searchAllStud.controller/{page}")
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
		
		return "_05_teacStu/managestud";
	}
	
//	搜尋教師貼文用價格區間篩選
	@PostMapping(path = "/admin/_05_teacStu.searchAllByPrice.controller/{page}")
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

		return "_05_teacStu/manageteac";
	}
	
//	搜尋學生貼文用價格區間篩選
	@PostMapping(path = "/admin/_05_teacStu.searchAllStudByPrice.controller/{page}")
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

		return "_05_teacStu/managestud";
	}
	
//	模糊搜尋教師貼文
	@PostMapping(path = "/admin/_05_teacStu.searchAllLike.controller/{page}")
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

		return "_05_teacStu/manageteac";
	}
	
//	模糊搜尋學生貼文
	@PostMapping(path = "/admin/_05_teacStu.searchAllLikeStud.controller/{page}")
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

		return "_05_teacStu/managestud";
	}
	
//	條件篩選搜尋教師貼文
	@PostMapping(path = "/admin/_05_teacStu.switchsequence.controller/{page}")
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

		return "_05_teacStu/manageteac";
	}
	
//	條件篩選搜尋學生貼文
	@PostMapping(path = "/admin/_05_teacStu.switchsequenceStud.controller/{page}")
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

		return "_05_teacStu/managestud";
	}
	
//	轉跳教師修改頁面
	@GetMapping("/admin/_05_teacStu.updatedataMain.controller")
	public String processUpdateMainAction(@RequestParam("teacno") Integer teacno, 
			@ModelAttribute("TeacBean") TeacBean tft, BindingResult result, Model m) {
		if(result.hasErrors()) {
			return "membersError";
		}
		TeacBean teac = tService.searchTeacFromTeacno(teacno);
		m.addAttribute("bean", teac);
		return "_05_teacStu/manageupdateteac";
	}
	
//	轉跳教師貼文頁面
	@GetMapping("/admin/_05_teacStu.teacpostpageMain.controller")
	public String processTeacPostPageMainAction(@RequestParam("teacno") Integer teacno, 
			@ModelAttribute("TeacBean") TeacBean tft, BindingResult result, Model m) {
		if(result.hasErrors()) {
			return "membersError";
		}
		TeacBean teac = tService.searchTeacFromTeacno(teacno);
		List<ReplyTeac> reply = rtService.findByTeacherTeacno(teacno);
		m.addAttribute("bean", teac);
		m.addAttribute("reply", reply);
		return "_05_teacStu/manageteacresumepage";
	}
	
//	轉跳學生修改頁面
	@GetMapping("/admin/_05_teacStu.updatedataStudMain.controller")
	public String processUpdateStudMainAction(@RequestParam("studno") Integer studno, 
			@ModelAttribute("StudBean") StudBean tfs, BindingResult result, Model m) {
		if(result.hasErrors()) {
			return "membersError";
		}
		StudBean stud = sService.searchStudFromStudno(studno);
		m.addAttribute("bean", stud);
		return "_05_teacStu/manageupdatestud";
	}
	
//	轉跳學生貼文頁面
	@GetMapping("/admin/_05_teacStu.studpostpageMain.controller")
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
			  m.addAttribute("m", member);
			} else {
			  m.addAttribute("m", null);
			}
		m.addAttribute("bean", stud);
		return "_05_teacStu/managestudpostpage";
	}
	
//	修改教師貼文
	@PostMapping("/admin/_05_teacStu.updatedata.controller")
	public String processupdatedataAction(@RequestParam("highEdu") String highEdu, @RequestParam("studExp") String studExp,
			@RequestParam("tutorExp") String tutorExp,@RequestParam("lanAbility") String lanAbility,
			@RequestParam("skills") String skills,@RequestParam("subjectItem") String subjectItem,
			@RequestParam("teacLoc") String teacLoc,@RequestParam("teacObject") String teacObject,
			@RequestParam("teacTime") String teacTime,@RequestParam("classMode") String classMode,
			@RequestParam("willTeac") String willTeac,@RequestParam("conMethod") String conMethod,
			@RequestParam("conTime") String conTime,@RequestParam("price") Double price,@RequestParam("teacno") Integer teacno){
		TeacBean t = new TeacBean();
		t.setTeacno(teacno);
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
		return "redirect:/admin/_05_teacStu.searchAllTeac.controller/1";
	}
	
//	修改學生貼文
	@PostMapping("/admin/_05_teacStu.updatedataStud.controller")
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
		return "redirect:/admin/_05_teacStu.searchAllStud.controller/1";
	}
	
//	轉跳教師新增頁面
	@GetMapping("/admin/_05_teacStu.insertdataMain.controller")
	public String processinsertdataMainAction(Model m) {
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> list = mService.searchMemByAccount(account);
		MemberBean member = list.get(0);
		m.addAttribute("bean", member);
		return "_05_teacStu/manageinsertpage";
	}
	
//	轉跳學生新增頁面
	@GetMapping("/admin/_05_teacStu.insertdataStudMain.controller")
	public String processinsertdataStudMainAction(Model m) {
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> list = mService.searchMemByAccount(account);
		MemberBean member = list.get(0);
		m.addAttribute("bean", member);
		return "_05_teacStu/manageinsertpagestud";
	}
	
//	新增教師貼文
	@PostMapping("/admin/_05_teacStu.insertdata.controller")
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
		return "redirect:/admin/_05_teacStu.searchAllTeac.controller/1";
	}
	
//	新增教師貼文回覆
	@GetMapping("/admin/_05_teacStu.insertreply.controller")
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
		return "_05_teacStu/manageteacresumepage";
	}
	
//	新增學生貼文
	@PostMapping("/admin/_05_teacStu.insertdataStud.controller")
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
		return "redirect:/admin/_05_teacStu.searchAllStud.controller/1";
	}
	
//	刪除教師貼文
	@GetMapping("/admin/_05_teacStu.deletedata.controller") 
	public String processdeletedataAction(@RequestParam("teacno") Integer teacno) {
		rtService.deleteByTeacherTeacno(teacno);
		tService.deleteTeacfromTeacno(teacno);
		return "redirect:/admin/_05_teacStu.searchAllTeac.controller/1";
	}
	
//	刪除學生貼文
	@GetMapping("/admin/_05_teacStu.deletedataStud.controller") 
	public String processdeletedataStudAction(@RequestParam("studno") Integer studno) {
		sService.deleteStudfromStudno(studno);
		return "redirect:/admin/_05_teacStu.searchAllStud.controller/1";
	}
}
