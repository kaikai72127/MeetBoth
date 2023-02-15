package springTeam5._06_halaAndQa.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import springTeam5._01_member.model.MemberBean;
import springTeam5._01_member.model.MemberService;
import springTeam5._06_halaAndQa.model.AnswerHalaBean;
import springTeam5._06_halaAndQa.model.AnswerHalaRepository;
import springTeam5._06_halaAndQa.model.AnswerHalaService;
import springTeam5._06_halaAndQa.model.HalaBean;
import springTeam5._06_halaAndQa.model.HalaRepository;
import springTeam5._06_halaAndQa.model.HalaService;

@Controller
public class AnswerHalaController {
	
	@Autowired
	private AnswerHalaService ahService;
	@Autowired
	private AnswerHalaRepository ahRepo;
	@Autowired
	private HalaService halaService;
	@Autowired
	private HalaRepository halaRepo;
	@Autowired
	private MemberService memberService;

	public String getCurrentDate() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		return sdf.format(date);
	}
	
	//新增貼文ㄉ回復
	@PostMapping("/_06_halaAndQa.addAnswerHala.controller")
	public String addAnswerHalaAction(@RequestParam("hieId")Integer halaId,@RequestParam("memberid") Integer memberid,
			@RequestParam("answerHalaContent")String answerHalaContent, Model haModel) {
		
		HalaBean currentHala = halaService.selectHalaId(halaId);
		AnswerHalaBean newAhBean=new AnswerHalaBean();
		Optional<MemberBean> member = memberService.searchMemByID(memberid);
		
		newAhBean.setMemberBean(member.get());
		newAhBean.setAnswerDate(getCurrentDate());
		newAhBean.setAnswerContent(answerHalaContent);
		newAhBean.setHala(currentHala);
		
		ahService.insertAnswerHala(newAhBean);
		halaService.insertHala(currentHala);

		
		return "redirect:/_06_halaAndQa.goHalaPage.controller?halaid="+halaId ;
	}
	
	//刪除貼文回覆
	@GetMapping("/_06_halaAndQa.deleteAnswerHala.controller")
	public String deleteAnswerHalaById(@RequestParam("answerHalaId")Integer answerHalaId) {
		ahService.deleteAnswerHala(answerHalaId);
		return"redirect:/_06_halaAndQa.goHalaPage.controller";
	}
	
	//找貼文下的回答
	@RequestMapping(path = "/_06_halaAndQa.findAnswerIdByHalaId.controller", method = RequestMethod.GET)
	public String findAnswerIdByHalaId1(@RequestParam("halaId")Integer halaId, Model m) {
		
		List<AnswerHalaBean> classList = ahRepo.findAnswerByHalaId(halaId);
		m.addAttribute("classList", classList);
		
		
		
		return "_06_hala/halapostpage";
	}
}
