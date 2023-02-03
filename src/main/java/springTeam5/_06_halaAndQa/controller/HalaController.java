package springTeam5._06_halaAndQa.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import springTeam5._06_halaAndQa.model.HalaBean;
import springTeam5._06_halaAndQa.model.HalaRepository;
import springTeam5._06_halaAndQa.model.HalaService;

@Controller
public class HalaController {

	@Autowired
	private HalaRepository halaRepo;

	@Autowired
	private HalaService halaService;
	
	public String getCurrentDate() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		return sdf.format(date);
	}

	// 查詢全部'
	@RequestMapping(path = "/_06_halaAndQa.SelectAllHala.controller", method = RequestMethod.GET)
	public String processAction(@ModelAttribute("HalaBean") HalaBean hb, BindingResult result, Model haModel) {
		if (result.hasErrors()) {
			return "Error";
		}
		List<HalaBean> classList = halaRepo.findAllHala();
		haModel.addAttribute("classList", classList);

		return "_06_hala/hala";
	}
	

	// 前往新增畫面
	@RequestMapping(path = "/_06_halaAndQa.goAddHala.controller", method = RequestMethod.GET)
	public String processMainAction1() {
		return "_06_hala/addhala";
	}

	// 新增
	@PostMapping("/_06_halaAndQa.AddHala.controller")
	public String processMainAction2(@RequestParam("halaclassname") String halaclassname,
			@RequestParam("memberid") Integer memberid, @RequestParam("title") String title,
			@RequestParam("halacontent") String halacontent) throws IllegalStateException, IOException {

		HalaBean hb = new HalaBean();
		hb.setHalaclassname(halaclassname);
		hb.setMemberid(memberid);
		hb.setTitle(title);
		hb.setPostdate(getCurrentDate());
		hb.setHalacontent(halacontent);
		halaService.insertHala(hb);

		return "redirect:/_06_halaAndQa.SelectAllHala.controller";
	}
	
	//分類查詢
	@RequestMapping(path = "/_06_halaAndQa.SelectHalaClass.controller", method = RequestMethod.GET)
	public String processAction3(@RequestParam("halaclassname")String halaclassname, @ModelAttribute("HalaBean") HalaBean hb, BindingResult result, Model haModel) {
		if (result.hasErrors()) {
			return "Error";
		}
		List<HalaBean> classList = halaRepo.findByHalaclassname(halaclassname);
		haModel.addAttribute("classList", classList);
		
		return "_06_hala/hala";
	}
	
	//前往修改畫面
	@RequestMapping(path = "/_06_halaAndQa.GoHalaUpdate.controller", method = RequestMethod.GET)
	public String processAction4(@RequestParam("halaid")Integer halaid, Model haModel) {
		HalaBean Bean = halaRepo.findByHalaid(halaid);
		haModel.addAttribute("bean", Bean);
		
		return "_06_hala/updateHala";
	}
	
	//修改
	@PostMapping("/_06_halaAndQa.updateHala.controller")
	public String processAction5(@RequestParam("halaid")Integer halaid,@RequestParam("halaclassname") String halaclassname,
			@RequestParam("memberid") Integer memberid, @RequestParam("title") String title,
			@RequestParam("halacontent") String halacontent) {
		   
		   HalaBean hb=halaService.selectHalaId(halaid);
		    
		    hb.setHalaclassname(halaclassname);
		    hb.setMemberid(memberid);
		    hb.setTitle(title);
		    hb.setPostdate(getCurrentDate());
		    hb.setHalacontent(halacontent);
		    
		    halaService.updateHala(hb);
            		
		return "redirect:/_06_halaAndQa.SelectAllHala.controller";
	}
	
	//刪除
	@GetMapping("/_06_halaAndQa.deketeHala.controller")
	public String processAction6(@RequestParam("halaid")Integer halaid) {
		halaService.deleteHala(halaid);
		return "redirect:/_06_halaAndQa.SelectAllHala.controller";
		
	}
	
	

}
