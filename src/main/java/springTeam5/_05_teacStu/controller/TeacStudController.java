package springTeam5._05_teacStu.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import springTeam5._05_teacStu.model.StudBean;
import springTeam5._05_teacStu.model.TeacBean;
import springTeam5._05_teacStu.service.GlobalService;
import springTeam5._05_teacStu.service.StudServiceInterface;
import springTeam5._05_teacStu.service.TeacServiceInterface;

@MultipartConfig()
@Controller
public class TeacStudController {
	
	@Autowired
	private TeacServiceInterface tService;
	
	@Autowired
	private StudServiceInterface sService;
	
//	搜尋全部教師貼文
	@GetMapping(path = "/_05_teacStu.searchAllTeac.controller")
	public String processsearchAllTeacAcction(@ModelAttribute("TeacBean") TeacBean tft, BindingResult result, Model m){
		
		if(result.hasErrors()) {
			return "membersError";
		}
		
		List<TeacBean> teac = tService.searchAllTeac();
		m.addAttribute("classList", teac);

		return "_05_teacStu/teacCRUD";
	}
	
//	搜尋全部學生貼文
	@GetMapping(path = "/_05_teacStu.searchAllStud.controller")
	public String processsearchAllStudAcction(@ModelAttribute("StudBean") StudBean tfs, BindingResult result, Model m){
		
		if(result.hasErrors()) {
			return "membersError";
		}
		
		List<StudBean> stud = sService.searchAllStud();
		m.addAttribute("classList", stud);

		return "_05_teacStu/studCRUD";
	}
	
//	搜尋教師貼文用價格區間篩選
	@PostMapping(path = "/_05_teacStu.searchAllByPrice.controller")
	public String processsearchAllByPriceAcction(@RequestParam("low") String lowstr, @RequestParam("high") String highstr, Model m){
		
		if (lowstr.equals("最低時薪") || lowstr.equals("")) {
			lowstr = "0";
		}
		if (highstr.equals("最高時薪") || highstr.equals("")) {
			highstr = "999999999";
		}
		
		Double low = Double.valueOf(lowstr);
		Double high = Double.valueOf(highstr);
		
		List<TeacBean> teac = tService.searchTeacByPrice(low, high);
		m.addAttribute("classList", teac);

		return "_05_teacStu/teacCRUD";
	}
	
//	搜尋學生貼文用價格區間篩選
	@PostMapping(path = "/_05_teacStu.searchAllStudByPrice.controller")
	public String processsearchAllStudByPriceAcction(@RequestParam("low") String lowstr, @RequestParam("high") String highstr, Model m){
		
		if (lowstr.equals("最低時薪") || lowstr.equals("")) {
			lowstr = "0";
		}
		if (highstr.equals("最高時薪") || highstr.equals("")) {
			highstr = "999999999";
		}
		
		Double low = Double.valueOf(lowstr);
		Double high = Double.valueOf(highstr);
		
		List<StudBean> stud = sService.searchStudByPrice(low, high);
		m.addAttribute("classList", stud);

		return "_05_teacStu/studCRUD";
	}
	
//	模糊搜尋教師貼文
	@PostMapping(path = "/_05_teacStu.searchAllLike.controller")
	public String processsearchAllLikeAcction(@RequestParam("search") String search, Model m){
		
		List<TeacBean> teac = tService.searchAllLike(search);
		m.addAttribute("classList", teac);

		return "_05_teacStu/teacCRUD";
	}
	
//	模糊搜尋學生貼文
	@PostMapping(path = "/_05_teacStu.searchAllLikeStud.controller")
	public String processsearchAllLikeStudAcction(@RequestParam("search") String search, Model m){
		
		List<StudBean> stud = sService.searchAllLikeStud(search);
		m.addAttribute("classList", stud);

		return "_05_teacStu/studCRUD";
	}
	
//	條件篩選搜尋教師貼文
	@PostMapping(path = "/_05_teacStu.switchsequence.controller")
	public String processswitchsequenceAcction(@RequestParam("case") String choose, Model m){

		List<TeacBean> classlist = new ArrayList<>();
		switch (choose) {
		case "1":
			classlist = tService.searchAllTeacOBmId();
			break;
		case "2":
			classlist = tService.searchAllTeacOBpDate();
			break;
		case "3":
			classlist = tService.searchAllTeacOBprice();
			break;
		default:
			classlist = tService.searchAllTeac();
			break;
		}
		m.addAttribute("classList", classlist);

		return "_05_teacStu/teacCRUD";
	}
	
//	條件篩選搜尋學生貼文
	@PostMapping(path = "/_05_teacStu.switchsequenceStud.controller")
	public String processswitchsequenceStudAcction(@RequestParam("case") String choose, Model m){
		
		List<StudBean> classlist = new ArrayList<>();
		switch (choose) {
		case "1":
			classlist = sService.searchAllStudOBmId();
			break;
		case "2":
			classlist = sService.searchAllStudOBpDate();
			break;
		case "3":
			classlist = sService.searchAllStudOBprice();
			break;
		default:
			classlist = sService.searchAllStud();
			break;
		}
		m.addAttribute("classList", classlist);

		return "_05_teacStu/studCRUD";
	}
	
//	轉跳教師修改頁面
	@PostMapping("/_05_teacStu.updatedataMain.controller")
	public String processUpdateMainAction(@RequestParam("teacno") Integer teacno, 
			@ModelAttribute("TeacBean") TeacBean tft, BindingResult result, Model m) {
		if(result.hasErrors()) {
			return "membersError";
		}
		TeacBean teac = tService.searchTeacFromTeacno(teacno);
		m.addAttribute("bean", teac);
		return "_05_teacStu/updateteac";
	}
	
//	轉跳學生修改頁面
	@PostMapping("/_05_teacStu.updatedataStudMain.controller")
	public String processUpdateStudMainAction(@RequestParam("studno") Integer studno, 
			@ModelAttribute("StudBean") StudBean tfs, BindingResult result, Model m) {
		if(result.hasErrors()) {
			return "membersError";
		}
		StudBean stud = sService.searchStudFromStudno(studno);
		m.addAttribute("bean", stud);
		return "_05_teacStu/updatestud";
	}
	
//	修改教師貼文
	@PostMapping("/_05_teacStu.updatedata.controller")
	public String processupdatedataAction(@RequestParam("teacno") Integer teacno, @RequestParam("memberId") Integer memberId, @RequestParam("title") String title,
			@RequestParam("detail") String detail, @RequestParam("price") Double price, @RequestParam("subjectItem") String subjectItem, 
			@RequestParam("images") MultipartFile mf) throws IOException, SQLException {
		InputStream in = mf.getInputStream();
		long size = mf.getSize();
		Blob b = GlobalService.fileToBlob(in, size);
		Date date = new Date();
		TeacBean teac = tService.searchTeacFromTeacno(teacno);
		teac.setMemberid(memberId);
		teac.setTitle(title);
		teac.setPostdate(date);
		teac.setDetail(detail);
		teac.setPrice(price);
		teac.setSubjectitem(subjectItem);
		if(size != 0) {
			teac.setClasspicture(b);
			tService.updateTeacFromTeacno(teac);
		}else {
			tService.updateTeacFromTeacno(teac);
		}
		return "redirect:_05_teacStu.searchAllTeac.controller";
	}
	
//	修改學生貼文
	@PostMapping("/_05_teacStu.updatedataStud.controller")
	public String processupdatedataStudAction(@RequestParam("studno") Integer studno, @RequestParam("memberId") Integer memberId, @RequestParam("title") String title,
			@RequestParam("detail") String detail, @RequestParam("price") Double price, @RequestParam("subjectItem") String subjectItem, 
			@RequestParam("learnLoc") String learnLoc, @RequestParam("images") MultipartFile mf) throws IOException, SQLException {
		InputStream in = mf.getInputStream();
		long size = mf.getSize();
		Blob b = GlobalService.fileToBlob(in, size);
		Date date = new Date();
		StudBean stud = sService.searchStudFromStudno(studno);
		stud.setMemberid(memberId);
		stud.setTitle(title);
		stud.setPostdate(date);
		stud.setDetail(detail);
		stud.setPrice(price);
		stud.setSubjectitem(subjectItem);
		stud.setLearnloc(learnLoc);
		if (size != 0) {
			stud.setClasspicture(b);
			sService.updateStudFromStudno(stud);
		}else {
			sService.updateStudFromStudno(stud);
		}
		return "redirect:_05_teacStu.searchAllStud.controller";
	}
	
//	轉跳教師新增頁面
	@GetMapping("/_05_teacStu.insertdataMain.controller")
	public String processinsertdataMainAction() {
		return "_05_teacStu/insertpage";
	}
	
//	轉跳學生新增頁面
	@GetMapping("/_05_teacStu.insertdataStudMain.controller")
	public String processinsertdataStudMainAction() {
		return "_05_teacStu/insertpagestud";
	}
	
//	新增教師貼文
	@PostMapping("/_05_teacStu.insertdata.controller")
	public String processinsertdataAction(@RequestParam("memberId") Integer memberId, @RequestParam("title") String title, @RequestParam("detail") String detail,
								@RequestParam("price") Double price, @RequestParam("subjectItem") String subjectItem, @RequestParam("images") MultipartFile mf) throws IllegalStateException, IOException, SQLException, ServletException {
		InputStream in = mf.getInputStream();
		long size = mf.getSize();
		Blob b = GlobalService.fileToBlob(in, size);
		Date date = new Date();
		TeacBean t = new TeacBean();
		t.setMemberid(memberId);
		t.setTitle(title);
		t.setPostdate(date);
		t.setDetail(detail);
		t.setPrice(price);
		t.setSubjectitem(subjectItem);
		t.setClasspicture(b);
		tService.addTeac(t);
		return "redirect:_05_teacStu.searchAllTeac.controller";
	}
	
//	新增學生貼文
	@PostMapping("/_05_teacStu.insertdataStud.controller")
	public String processinsertdataStudAction(@RequestParam("memberId") Integer memberId, @RequestParam("title") String title, @RequestParam("detail") String detail,
								@RequestParam("price") Double price, @RequestParam("subjectItem") String subjectItem, 
								@RequestParam("learnLoc") String learnLoc, @RequestParam("images") MultipartFile mf) throws IllegalStateException, IOException, SQLException {
		InputStream in = mf.getInputStream();
		long size = mf.getSize();
		Blob b = GlobalService.fileToBlob(in, size);
		Date date = new Date();
		StudBean t = new StudBean();
		t.setMemberid(memberId);
		t.setTitle(title);
		t.setPostdate(date);
		t.setDetail(detail);
		t.setPrice(price);
		t.setSubjectitem(subjectItem);
		t.setLearnloc(learnLoc);
		t.setClasspicture(b);
		sService.addStud(t);
		return "redirect:_05_teacStu.searchAllStud.controller";
	}
	
//	刪除教師貼文
	@GetMapping("/_05_teacStu.deletedata.controller") 
	public String processdeletedataAction(@RequestParam("teacno") Integer teacno) {
		tService.deleteTeacfromTeacno(teacno);
		return "redirect:_05_teacStu.searchAllTeac.controller";
	}
	
//	刪除學生貼文
	@GetMapping("/_05_teacStu.deletedataStud.controller") 
	public String processdeletedataStudAction(@RequestParam("studno") Integer studno) {
		sService.deleteStudfromStudno(studno);
		return "redirect:_05_teacStu.searchAllStud.controller";
	}
	
//	儲存教師貼文圖片
	@GetMapping(path = "/_05_teacStu.picsave.controller", produces = "text/plain;charset=UTF-8")
	public void processByteArrayImageAction(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		OutputStream os = null;
		InputStream is = null;
		Blob blob = null;
		String id = request.getParameter("id");
		Integer nId = 0;
		nId = Integer.parseInt(id);
		TeacBean bean = tService.searchTeacFromTeacno(nId);
		if (bean != null) {
			blob = bean.getClasspicture();
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
		if (is != null)
			is.close();
		if (os != null)
			os.close();
	}
	
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
			blob = bean.getClasspicture();
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
	}
}
