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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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

	public String getCurrentDate() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		return sdf.format(date);
	}

	//新增貼文ㄉ留言
	@PostMapping("/_06_halaAndQa.addResponseHala.controller")
	public String addResponseHalaAction(@RequestParam("halaId") Integer halaId,
			@RequestParam("responseHalaContent") String responseHalaContent
			) throws IOException, SQLException {
		
		HalaBean currentHala = halaService.selectHalaId(halaId);
		ResponseHalaBean newRsBean = new ResponseHalaBean();

		newRsBean.setMemberId(1001);
		newRsBean.setResponseHalaPostDate(getCurrentDate());
		newRsBean.setResponseHalaContent(responseHalaContent);
		newRsBean.setTumb(0);
		newRsBean.setHala(currentHala);
		
		List<ResponseHalaBean> rhb = new ArrayList<ResponseHalaBean>();
		rhb.add(newRsBean);
		currentHala.setResponseHala(rhb);
		halaService.insertHala(currentHala);
		
		return null;
	}

	//刪除貼文留言
	@GetMapping("/_06_halaAndQa.deleteResponseHala.controller")
	public String deleteResponseHalaById(@RequestParam("responseHalaId")Integer responseHalaId) {
		rhService.deleteResponseHala(responseHalaId);
		return"redirect:/_06_halaAndQa.goHalaPage.controller";
	}
	

}
