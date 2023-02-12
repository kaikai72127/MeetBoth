package springTeam5._06_halaAndQa.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import springTeam5._06_halaAndQa.model.AnswerHalaBean;
import springTeam5._06_halaAndQa.model.HalaBean;
import springTeam5._06_halaAndQa.model.HalaRepository;
import springTeam5._06_halaAndQa.model.HalaService;
import springTeam5._06_halaAndQa.model.PictureService;

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

	// 查詢全部' BindingResult result,@ModelAttribute("HalaBean") HalaBean hb
	@RequestMapping(path = "/_06_halaAndQa.SelectAllHala.controller", method = RequestMethod.GET)
<<<<<<< HEAD
	public String processAction(Model haModel,Model topModel) {
=======
	public String processAction( Model haModel) {
>>>>>>> origin/_01_Seal
//		if (result.hasErrors()) {
//			return "Error";
//		}
		List<HalaBean> classList = halaRepo.findAllHala();
		haModel.addAttribute("classList", classList);
		List<HalaBean>topList = halaService.findTopHot();
		topModel.addAttribute("topList",topList);

		return "_06_hala/hala";
	}
	
	


	// 熱門
//	
//	@RequestMapping(path = "/_06_halaAndQa.findTopHot.controller", method = RequestMethod.GET)
//	public String findTopHot(Model haModel,Model topModel) {
//		List<HalaBean>topList = halaService.findTopHot();
//		topModel.addAttribute("topList",topList);
//		List<HalaBean> findHalaAll = halaService.findHalaAll();
//		
//		return "_06_hala/hala";
//	}
	
	
	

	// 前往新增畫面
	@RequestMapping(path = "/_06_halaAndQa.goAddHala.controller", method = RequestMethod.GET)
	public String processMainAction1() {
		return "_06_hala/addhala";
	}
<<<<<<< HEAD

=======
	
>>>>>>> origin/_01_Seal
//	//前往貼文畫面
//	@RequestMapping(path = "/_06_halaAndQa.goHalaPage.controller",method = RequestMethod.GET)
//	public String proccessMainAction7() {
//		 return"_06_hala/halapostpage";
//	}
<<<<<<< HEAD

=======
	
	
	
	
>>>>>>> origin/_01_Seal
	// 新增
	@PostMapping("/_06_halaAndQa.AddHala.controller")
	public String processMainAction2(@RequestParam("halaclassname") String halaclassname,
			@RequestParam("memberid") Integer memberid, @RequestParam("title") String title,
<<<<<<< HEAD
			@RequestParam("halacontent") String halacontent, @RequestParam("images") MultipartFile mf)
			throws IllegalStateException, IOException, SQLException {
=======
			@RequestParam("halacontent") String halacontent, @RequestParam("images") MultipartFile mf) throws IllegalStateException, IOException, SQLException {
>>>>>>> origin/_01_Seal

		InputStream in = mf.getInputStream();
		long size = mf.getSize();
		Blob b = PictureService.fileToBlob(in, size);
		HalaBean hb = new HalaBean();
		hb.setHalaclassname(halaclassname);
		hb.setMemberid(memberid);
		hb.setTitle(title);
		hb.setPostdate(getCurrentDate());
		hb.setHalacontent(halacontent);
		hb.setPicture(b);
		hb.setTumb(0);
		hb.setWatch(0);
		halaService.insertHala(hb);

		return "redirect:/_06_halaAndQa.SelectAllHala.controller";
	}

	// 分類查詢
	@RequestMapping(path = "/_06_halaAndQa.SelectHalaClass.controller", method = RequestMethod.GET)
	public String processAction3(@RequestParam("halaclassname") String halaclassname,
			@ModelAttribute("HalaBean") HalaBean hb, BindingResult result, Model haModel) {
		if (result.hasErrors()) {
			return "Error";
		}
		List<HalaBean> classList = halaRepo.findByHalaclassname(halaclassname);
		haModel.addAttribute("classList", classList);

		return "_06_hala/hala";
	}


	// 前往貼文頁面
	@RequestMapping(path = "/_06_halaAndQa.goHalaPage.controller", method = RequestMethod.GET)
	public String processAction11(@RequestParam("halaid") Integer halaid, Model haModel, Model resModel) {
		HalaBean Bean = halaRepo.findByHalaId(halaid);
		haModel.addAttribute("bean", Bean);

		for (AnswerHalaBean a : Bean.getAnswerHala()) {
			System.out.println("媽的給我跑出來出來" + a.getAnswerContent());
		}

		return "_06_hala/halapostpage";
	}

	// 修改
	@PostMapping("/_06_halaAndQa.updateHala.controller")
	public String processAction5(@RequestParam("halaId") Integer halaId,
			@RequestParam("halaclassname") String halaclassname, @RequestParam("title") String title,
			@RequestParam("images") MultipartFile mf, @RequestParam("halacontent") String halacontent, Model haModel)
			throws IOException, SQLException {

		HalaBean hb = halaService.selectHalaId(halaId);
		InputStream in = mf.getInputStream();
		long size = mf.getSize();
		Blob b = PictureService.fileToBlob(in, size);

		hb.setHalaclassname(halaclassname);
		hb.setPicture(b);
		hb.setTitle(title);
		hb.setPostdate(getCurrentDate());
		hb.setHalacontent(halacontent);

		halaService.updateHala(hb);
		HalaBean Bean = halaRepo.findByHalaId(halaId);
		haModel.addAttribute("bean", Bean);

		return "_06_hala/halapostpage";
	}

	// 刪除
	@GetMapping("/_06_halaAndQa.deleteHala.controller")
	public String processAction6(@RequestParam("halaid") Integer halaid) {
		halaService.deleteHala(halaid);
		return "redirect:/_06_halaAndQa.SelectAllHala.controller";

	}


//	儲存貼文圖片
	@GetMapping(path = "/_06_halaAndQa.picsave.controller", produces = "text/plain;charset=UTF-8")
	public void processAction9(HttpServletRequest request, HttpServletResponse response)
			throws IOException, SQLException {
		OutputStream os = null;
		InputStream is = null;
		Blob blob = null;
		String id = request.getParameter("id");
		Integer nId = 0;
		nId = Integer.parseInt(id);
		HalaBean bean = halaService.selectHalaId(nId);
		if (bean != null) {
			blob = bean.getPicture();
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

	@PostMapping("/tumbhere.controller/{tumbhere}/{id}")
	public String tumbhere(@PathVariable Integer tumbhere, @PathVariable Integer id) {
		HalaBean bean = halaService.selectHalaId(id);
		bean.setTumb(tumbhere);
		halaService.updatetumb(bean);
		return null;
	}

//  增加瀏覽次數
	@GetMapping("/_06_halaAndQa.watch.controller")
	public String processProductCheckAction(@RequestParam("halaIdForWatch") Integer id) throws SQLException {
		HalaBean hb = halaService.selectHalaId(id);
		Integer watch = hb.getWatch();
		watch += 1;
		hb.setWatch(watch);
		halaService.updateHala(hb);
		return null;
	}
	
//	模糊搜尋貼文
	@PostMapping(path = "/_06_halaAndQa.searchAllLike.controller")
	public String processAction8(@RequestParam("search") String search, Model m) {
		
		List<HalaBean> hb = halaService.searchAllLike(search);
		m.addAttribute("classList", hb);
		
		return "_06_hala/hala";
	}
	// 前往修改畫面
	@RequestMapping(path = "/_06_halaAndQa.GoHalaUpdate.controller", method = RequestMethod.GET)
<<<<<<< HEAD
	public String processAction4(@RequestParam("halaId") Integer halaid, Model haModel) {
=======
	public String processAction4(@RequestParam("halaId")Integer halaid, Model haModel) {
>>>>>>> origin/_01_Seal
		HalaBean Bean = halaRepo.findByHalaId(halaid);
		haModel.addAttribute("bean", Bean);
		
		return "_06_hala/updatehala";
<<<<<<< HEAD
	}
//	---------------------------------------後台區-----------------------------------
	
	// 前往後台修改畫面
	@RequestMapping(path = "/_06_halaAndQa.GoHalaUpdateIndex.controller", method = RequestMethod.GET)
	public String processAction23(@RequestParam("halaId") Integer halaid, Model haModel) {
		HalaBean Bean = halaRepo.findByHalaId(halaid);
		haModel.addAttribute("bean", Bean);
		
		return "_06_hala/halaupdateindex";
	}
	
	// 後台查詢全部' BindingResult result,@ModelAttribute("HalaBean") HalaBean hb
	@RequestMapping(path = "/_06_halaAndQa.SelectAllHalaIndex.controller", method = RequestMethod.GET)
	public String processAction20(Model haModel,Model topModel) {
//		if (result.hasErrors()) {
//			return "Error";
//		}
		List<HalaBean> classList = halaRepo.findAllHala();
		haModel.addAttribute("classList", classList);
		
		
		List<HalaBean>topList = halaService.findTopHot();
		topModel.addAttribute("topList",topList);

		return "_06_hala/halaindex";
	}
	
	
	
	// 後台分類查詢
	@RequestMapping(path = "/_06_halaAndQa.SelectHalaClassIndex.controller", method = RequestMethod.GET)
	public String processAction21(@RequestParam("halaclassname") String halaclassname,
			@ModelAttribute("HalaBean") HalaBean hb, BindingResult result, Model haModel ) {
	
		List<HalaBean> classList = halaRepo.findByHalaclassname(halaclassname);
		haModel.addAttribute("classList", classList);
		
		return "_06_hala/halaindex";
		
	}
	
//	後台模糊搜尋貼文
	@PostMapping(path = "/_06_halaAndQa.searchAllLike.controller1")
	public String processAction22(@RequestParam("search1") String search1, Model mm) {
		
		List<HalaBean> hab = halaService.searchAllLike(search1);
		mm.addAttribute("classList", hab);
		
		return "_06_hala/halaindex";
	}
	
	
	// 後台修改
		@PostMapping("/_06_halaAndQa.updateHalaIndex.controller")
		public String processAction24(@RequestParam("halaId") Integer halaId,
				@RequestParam("halaclassname") String halaclassname, @RequestParam("title") String title,
				@RequestParam("images") MultipartFile mf, @RequestParam("halacontent") String halacontent, Model haModel)
				throws IOException, SQLException {

			HalaBean hb = halaService.selectHalaId(halaId);
			InputStream in = mf.getInputStream();
			long size = mf.getSize();
			Blob b = PictureService.fileToBlob(in, size);

			hb.setHalaclassname(halaclassname);
			hb.setPicture(b);
			hb.setTitle(title);
			hb.setPostdate(getCurrentDate());
			hb.setHalacontent(halacontent);

			halaService.updateHala(hb);
			HalaBean Bean = halaRepo.findByHalaId(halaId);
			haModel.addAttribute("bean", Bean);

			return "redirect:/_06_halaAndQa.SelectAllHalaIndex.controller";
		}
	
		
		// 後台刪除
		@GetMapping("/_06_halaAndQa.deleteHalaIndex.controller")
		public String processAction25(@RequestParam("halaId") Integer halaId) {
			halaService.deleteHala(halaId);
			return "redirect:/_06_halaAndQa.SelectAllHalaIndex.controller";

		}
		
		// 前往後台新增畫面
		@RequestMapping(path = "/_06_halaAndQa.goAddHalaIndex.controller", method = RequestMethod.GET)
		public String processMainActio26() {
			return "_06_hala/addhalaindex";
		}
		
		// 新增
		@PostMapping("/_06_halaAndQa.AddHalaIndex.controller")
		public String processMainAction27(@RequestParam("halaclassname") String halaclassname,
				@RequestParam("memberid") Integer memberid, @RequestParam("title") String title,
				@RequestParam("halacontent") String halacontent, @RequestParam("images") MultipartFile mf)
				throws IllegalStateException, IOException, SQLException {

			InputStream in = mf.getInputStream();
			long size = mf.getSize();
			Blob b = PictureService.fileToBlob(in, size);
			HalaBean hb = new HalaBean();
			hb.setHalaclassname(halaclassname);
			hb.setMemberid(memberid);
			hb.setTitle(title);
			hb.setPostdate(getCurrentDate());
			hb.setHalacontent(halacontent);
			hb.setPicture(b);
			hb.setTumb(0);
			hb.setWatch(0);
			halaService.insertHala(hb);

			return "redirect:/_06_halaAndQa.SelectAllHalaIndex.controller";
		}

=======
	}
	
	//前往貼文頁面
	@RequestMapping(path = "/_06_halaAndQa.goHalaPage.controller",method = RequestMethod.GET)
	public String processAction11(@RequestParam("halaid")Integer halaid, Model haModel,Model resModel) {
		HalaBean Bean = halaRepo.findByHalaId(halaid);
		haModel.addAttribute("bean", Bean);
		
		for(AnswerHalaBean a : Bean.getAnswerHala()) {
			System.out.println("媽的給我跑出來出來"+a.getAnswerContent());
		}
		
		 return"_06_hala/halapostpage";
	}
	
	
	//修改
	@PostMapping("/_06_halaAndQa.updateHala.controller")
	public String processAction5(@RequestParam("halaId")Integer halaId,@RequestParam("halaclassname") String halaclassname,
			 @RequestParam("title") String title, @RequestParam("images") MultipartFile mf,
			@RequestParam("halacontent") String halacontent, Model haModel) throws IOException, SQLException {
		   
		   HalaBean hb=halaService.selectHalaId(halaId);
		   InputStream in = mf.getInputStream();
			long size = mf.getSize();
			Blob b = PictureService.fileToBlob(in, size);
		   
		    hb.setHalaclassname(halaclassname);
		    hb.setPicture(b);
		    hb.setTitle(title);
		    hb.setPostdate(getCurrentDate());
		    hb.setHalacontent(halacontent);
		    
		    halaService.updateHala(hb);
		    HalaBean Bean = halaRepo.findByHalaId(halaId);
			haModel.addAttribute("bean", Bean);
            		
		return "_06_hala/halapostpage";
	}
	
	//刪除
	@GetMapping("/_06_halaAndQa.deleteHala.controller")
	public String processAction6(@RequestParam("halaid")Integer halaid) {
		halaService.deleteHala(halaid);
		return "redirect:/_06_halaAndQa.SelectAllHala.controller";
		
	}
	
//	模糊搜尋貼文
	@PostMapping(path = "/_06_halaAndQa.searchAllLike.controller")
	public String processAction8(@RequestParam("search") String search, Model m){
		
		List<HalaBean> hb = halaService.searchAllLike(search);
		m.addAttribute("classList", hb);

		return "_06_hala/hala";
	}
	
//	儲存貼文圖片
	@GetMapping(path = "/_06_halaAndQa.picsave.controller", produces = "text/plain;charset=UTF-8")
	public void processAction9(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		OutputStream os = null;
		InputStream is = null;
		Blob blob = null;
		String id = request.getParameter("id");
		Integer nId = 0;
		nId = Integer.parseInt(id);
		HalaBean bean = halaService.selectHalaId(nId);
		if (bean != null) {
			blob = bean.getPicture();
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
	
	@PostMapping("/tumbhere.controller/{tumbhere}/{id}")
	public String tumbhere(@PathVariable Integer tumbhere, @PathVariable Integer id) {
	    HalaBean bean = halaService.selectHalaId(id);
	    bean.setTumb(tumbhere);
	    halaService.updatetumb(bean);
	    return null;
	}
	
	
//  增加瀏覽次數
  @GetMapping("/_06_halaAndQa.watch.controller")
  public String processProductCheckAction(@RequestParam("halaIdForWatch") Integer id ) throws SQLException {
      HalaBean hb = halaService.selectHalaId(id);
	  Integer watch =hb.getWatch();
	  watch += 1;
	  hb.setWatch(watch);
	  halaService.updateHala(hb);
      return null;
  }
>>>>>>> origin/_01_Seal

}
