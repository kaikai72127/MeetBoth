package springTeam5._02_subLocation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springTeam5._02_subLocation.model.LocationBean;
import springTeam5._02_subLocation.model.SubjectBean;
import springTeam5._02_subLocation.service.LocationService;
import springTeam5._02_subLocation.service.SubjectService;

@MultipartConfig()
@Controller
public class SubLocController {

	@Autowired
	private SubjectService subjectService;

	@Autowired
	private LocationService locationService;

//	搜尋全部科目
	@GetMapping(path = "/_02_subLocation.SelectAllSub.controller")
	public String processSelectAllSubAcction(@ModelAttribute("SubjectBean") SubjectBean sb, BindingResult result,
			Model sbModel) {

		if (result.hasErrors()) {
			return "subjectsError";
		}
		
		List<SubjectBean> classList = subjectService.searchAllSub();
		sbModel.addAttribute("classList", classList);

		return "_02_subLocation/subject/subsCRUD";
	}

//  搜尋全部地區
	@GetMapping(path = "/_02_subLocation.SelectAllLoc.controller")
	public String processSelectAllLocAcction(@ModelAttribute("LocationBean") LocationBean lc, BindingResult result, Model lcModel) {
		
		if (result.hasErrors()) {
			return "locationsError";
		}
		
		List<LocationBean> classList = locationService.searchAllLoc();
		lcModel.addAttribute("classList", classList);

		return "_02_subLocation/location/locCRUD";
	}

//  轉跳新增科目	
	@GetMapping("/_02_subLocation.InsertSubMain.controller")
	public String processInsertSubMainAcction() {
		return "_02_subLocation/subject/subCreate";
	}
	
//  轉跳新增地區	
	@GetMapping("/_02_subLocation.InsertLocMain.controller")
	public String processInsertLocMainAcction() {
		return "_02_subLocation/location/locCreate";
	}

//  新增科目	
	@PostMapping("/_02_subLocation.InsertSub.controller")
	public String processInsertSubAcction(@RequestParam("subjectId") Integer setSubjectId,
			@RequestParam("subjectName") String setSubjectName, @RequestParam("subjectClass") String subjectClass)
			throws IOException {

		SubjectBean subjectBean = new SubjectBean();
		subjectBean.setSubjectId(setSubjectId);
		subjectBean.setSubjectName(setSubjectName);
		subjectBean.setSubjectClass(subjectClass);
		subjectService.add(subjectBean);

		return "redirect:_02_subLocation.SelectAllSub.controller";
	}

//  新增地區
	@PostMapping("/_02_subLocation.InsertLoc.controller")
	public String processInsertLocAcction(@RequestParam("locno") Integer locno,
			@RequestParam("locname") String locname,
			@RequestParam("locclass") String locclass)throws IOException {
		
		LocationBean locationBean = new LocationBean();
		locationBean.setLocNo(locno);
		locationBean.setLocName(locname);
		locationBean.setLocClass(locclass);
		locationService.add(locationBean);
	
		return "redirect:_02_subLocation.SelectAllLoc.controller";
	}

//  轉跳修改科目
	@PostMapping("/_02_subLocation.UpdateSubMain.controller")
	public String processUpdateSubMainAcction(@RequestParam("subjectId") Integer subjectId,
			@ModelAttribute("SubjectBean") SubjectBean od, BindingResult result, Model sbModel) {
		
		if (result.hasErrors()) {
			return "subjectsError";
		}
		
		SubjectBean subjectBean = subjectService.findById(subjectId);
		sbModel.addAttribute("bean", subjectBean);

		return "_02_subLocation/subject/subUpdate";
	}

//  轉跳修改地區
	@PostMapping("/_02_subLocation.UpdateLocMain.controller")
	public String processUpdateMainAction(@RequestParam("locno") Integer locno,
			@ModelAttribute("LocationBean") LocationBean od,BindingResult result,Model lcModel) {
		
		if(result.hasErrors()) {
			return "locationsError";
		}
		
		LocationBean locationBean = locationService.findById(locno);
		lcModel.addAttribute("bean",locationBean);
	
		return "_02_subLocation/location/locUpdate";
	}
	

//  修改科目
	@PostMapping("/_02_subLocation.UpdateSub.controller")
	public String processUpdateSubAcction(@RequestParam("subjectId") Integer subjectId,
			@RequestParam("subjectName") String subjectName, @RequestParam("subjectClass") String subjectClass) {

		SubjectBean subjectBean = subjectService.findById(subjectId);
		subjectBean.setSubjectId(subjectId);
		subjectBean.setSubjectName(subjectName);
		subjectBean.setSubjectClass(subjectClass);

		subjectService.updateSubFromSubno(subjectBean);

		return "redirect:_02_subLocation.SelectAllSub.controller";

	}

//  修改地區
	@PostMapping("/_02_subLocation.UpdateLoc.controller")
	public String processUpdateAcction(@RequestParam("locno") Integer locno,
			@RequestParam("locname") String locname,
			@RequestParam("locclass") String locclass){
		
		LocationBean locationBean = locationService.findById(locno);
		locationBean.setLocNo(locno);
		locationBean.setLocName(locname);
		locationBean.setLocClass(locclass);
		
		locationService.updateLocFromLocno(locationBean);
	
		return "redirect:_02_subLocation.SelectAllLoc.controller";
	
	}

//  刪除科目
	@GetMapping("/_02_subLocation.DeleteSub.controller")
	public String processDeleteSubAcction(@RequestParam("subjectId") String subjectId) {

		subjectService.deleteSubFromSubno(Integer.parseInt(subjectId));

		return "redirect:_02_subLocation.SelectAllSub.controller";
	}

//  刪除地區
	@GetMapping("/_02_subLocation.DeleteLoc.controller")
	public String processDeleteAcction(@RequestParam("locno") String locno) {

		locationService.deleteLocFromLocno(Integer.parseInt(locno));
		
		return "redirect:_02_subLocation.SelectAllLoc.controller";
	}

//  模糊查詢科目
	@PostMapping(path = "/_02_subLocation.SearchSub.controller")
	public String processSearchSubAcction(@RequestParam("subClass") String subClass, Model m) {

		List<SubjectBean> classList = subjectService.findByClass(subClass);
		m.addAttribute("classList", classList);

		return "_02_subLocation/subject/subsCRUD";
	}
//  模糊查詢地區
	@PostMapping(path = "/_02_subLocation.SearchLoc.controller")
	public String processSearchAcction(@RequestParam("locClass") String locClass,Model m){
		List<LocationBean> classList = locationService.findByClass(locClass);
		m.addAttribute("classList",classList);
		return "_02_subLocation/location/locCRUD";
	}

}
