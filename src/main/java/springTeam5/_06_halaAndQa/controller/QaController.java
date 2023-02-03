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

import springTeam5._06_halaAndQa.model.QaBean;
import springTeam5._06_halaAndQa.model.QaRepository;
import springTeam5._06_halaAndQa.model.QaService;

@Controller
public class QaController {

	@Autowired
	private QaRepository qaRepo;
	
	@Autowired
	private QaService qaService;

	public String getCurrentDate() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		return sdf.format(date);
	}

	// 查詢全部
	@RequestMapping(path = "/_06_halaAndQa.SelectAllQa.controller", method = RequestMethod.GET)
	public String processAcction(@ModelAttribute("QaBean") QaBean qb, BindingResult result, Model qaModel) {
		if (result.hasErrors()) {
			return "Error";
		}
		List<QaBean> classList = qaRepo.findAllQa();
		qaModel.addAttribute("classList", classList);

		return "_06_hala/qa";
	}

	// 前往新增畫面
	@RequestMapping(path = "/_06_halaAndQa.goAddQa.controller", method = RequestMethod.GET)
	public String processMainAction() {
		return "_06_hala/addqa";
	}

	// 新增
	@PostMapping("/_06_halaAndQa.AddQa.controller")
	public String processMainAction2(@RequestParam("qaclassname") String qaclassname,
			@RequestParam("memberid") Integer memberid, @RequestParam("title") String title,
			@RequestParam("qacontent") String qacontent) throws IllegalStateException, IOException {

		QaBean qb = new QaBean();
		qb.setQaclassname(qaclassname);
		qb.setMemberid(memberid);
		qb.setTitle(title);
		qb.setPostdate(getCurrentDate());
		qb.setQacontent(qacontent);
		qaService.insertQa(qb);

		return "redirect:/_06_halaAndQa.SelectAllQa.controller";
	}
	
	//分類查詢
		@RequestMapping(path = "/_06_halaAndQa.SelectQaClass.controller", method = RequestMethod.GET)
		public String processAction3(@RequestParam("qaclassname")String qaclassname, @ModelAttribute("QaBean") QaBean qb, BindingResult result, Model haModel) {
			if (result.hasErrors()) {
				return "Error";
			}
			List<QaBean> classList = qaRepo.findByQaclassname(qaclassname);
			haModel.addAttribute("classList", classList);
			
			return "_06_hala/qa";
		}
		
		//前往修改畫面
		@RequestMapping(path = "/_06_halaAndQa.GoQaUpdate.controller", method = RequestMethod.GET)
		public String processAction4(@RequestParam("qaid")Integer qaid, Model haModel) {
			QaBean Bean = qaRepo.findByQaid(qaid);
			haModel.addAttribute("bean", Bean);
			
			return "_06_hala/updateqa";
		}
		
		//修改
		@PostMapping("/_06_halaAndQa.updateQa.controller")
		public String processAction5(@RequestParam("qaid")Integer qaid,@RequestParam("qaclassname") String qaclassname,
				@RequestParam("memberid") Integer memberid, @RequestParam("title") String title,
				@RequestParam("qacontent") String qacontent) {
			   
			   QaBean hb=qaService.selectQaId(qaid);
			    
			    hb.setQaclassname(qaclassname);
			    hb.setMemberid(memberid);
			    hb.setTitle(title);
			    hb.setPostdate(getCurrentDate());
			    hb.setQacontent(qacontent);
			    
			    qaService.updateQA(hb);
	            		
			return "redirect:/_06_halaAndQa.SelectAllQa.controller";
		}
		
		//刪除
		@GetMapping("/_06_halaAndQa.deketeQa.controller")
		public String processAction6(@RequestParam("qaid")Integer qaid) {
			qaService.deleteQa(qaid);
			return "redirect:/_06_halaAndQa.SelectAllQa.controller";
			
		}

}
