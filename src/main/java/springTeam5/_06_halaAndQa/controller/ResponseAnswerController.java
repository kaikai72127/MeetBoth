package springTeam5._06_halaAndQa.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springTeam5._06_halaAndQa.model.AnswerHalaBean;
import springTeam5._06_halaAndQa.model.AnswerHalaService;
import springTeam5._06_halaAndQa.model.ResponseAnswerBean;
import springTeam5._06_halaAndQa.model.ResponseAnswerRepository;
import springTeam5._06_halaAndQa.model.ResponseAnswerService;

@Controller
public class ResponseAnswerController {

	@Autowired
	private ResponseAnswerService raService;
	@Autowired
	private ResponseAnswerRepository raRepo;
	@Autowired
	private AnswerHalaService ahService;
	
	public String getCurrentDate() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		return sdf.format(date);
	}
	
	//新增回復的留言
	@PostMapping("/_06_halaAndQa.addResponseAnswer.controller")
	public String addResponseAnswerAction(@RequestParam("answerId")Integer answerId,
			@RequestParam("responseAnswerContent") String responseAnswerContent) {
			
		AnswerHalaBean currentahBean= ahService.selectAnswerId(answerId);
		ResponseAnswerBean newRABean = new ResponseAnswerBean();
		
		newRABean.setMemberId(1003);
		newRABean.setResponseAnswerDate(getCurrentDate());
		newRABean.setResponseAnswerContent(responseAnswerContent);
		newRABean.setAnswerHalaBean(currentahBean);
		
		List<ResponseAnswerBean> rab = new ArrayList<ResponseAnswerBean>();
		rab.add(newRABean);
		currentahBean.setResponseAnswerBean(rab);
		ahService.insertAnswerHala(currentahBean);
		
		return null;
		
	}
	
	//刪除回覆留言
	@GetMapping("/_06_halaAndQa.deleteResponseAnswer.controller")
	public String deleteResponseAnswerById(@RequestParam("responseAnswerId") Integer responseAnswerId) {
		raService.deleteResponseAnswer(responseAnswerId);
		return"redirect:/_06_halaAndQa.goHalaPage.controller";
		
	}
}
