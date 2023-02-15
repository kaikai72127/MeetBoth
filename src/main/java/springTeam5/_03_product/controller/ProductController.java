package springTeam5._03_product.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Optional;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import springTeam5._01_member.model.MemberBean;
import springTeam5._01_member.model.MemberService;
import springTeam5._03_product.model.ProdType;
import springTeam5._03_product.model.Product;
import springTeam5._03_product.model.ProductComment;
import springTeam5._03_product.service.ProdTypeService;
import springTeam5._03_product.service.ProductCommentService;
import springTeam5._03_product.service.ProductService;

@MultipartConfig()
@Controller
public class ProductController {

	@Autowired
	private ProductService pService;

	@Autowired
	private ProdTypeService ptService;

	@Autowired
	private ProductCommentService pcService;

	@Autowired
	private MemberService memberService;

//	-----------------------------測試-----------------------
	@GetMapping("/_03_product.productFontPage.controller")
	public String processproductFontPageAction(Model m, Model pm, HttpServletRequest request,
			@RequestParam("id") Integer memID) {

		Optional<MemberBean> mem = memberService.searchMemByID(memID);
		m.addAttribute("member", mem.get());

		List<Product> prodBean = pService.findByMemidAndOnlyOnSales(memID);
		m.addAttribute("prodBean", prodBean);

		return "_03_product/productFontPage";
	}

//	-----------------------------測試-----------------------
//	-----------------------------後台-----------------------
//	導到後台
	@GetMapping("/_03_product.index.controller")
	public String processpathToYTplayerAction(Model mProd) {
		return "_03_product/MBCMS";
	}

//	導到後台insert
	@GetMapping("/_03_product.MBinsertProd.controller")
	public String processpathToMBinsertPordAction() {
		return "_03_product/MBinsertProd";
	}

	@PostMapping("/_03_product.MBinsertProdAction.controller")
	public String processMBinsertPordAction(@RequestParam("pst") String prodState, @RequestParam("pna") String prodName,
			@RequestParam("pty") Integer prodType, @RequestParam("ppr") Integer prodPrice,
			@RequestParam("pmid") Integer memID, @RequestParam("pinvt") Integer prodInvt,
			@RequestParam("pps") Integer prodSales, @RequestParam("pch") Integer prodCheck,
			@RequestParam("pPic") MultipartFile file, @RequestParam("pdr") String prodDir)
			throws IOException, SQLException {

		ProdType currentProdType = ptService.findByProdclass(prodType);
		Product newProd = new Product();

		Optional<MemberBean> mem = memberService.searchMemByID(memID);

		Blob image = null;
		if (file.getSize() != 0) {
			InputStream in = file.getInputStream();
			long size = file.getSize();
			image = fileToBlob(in, size);
			newProd.setProdImg(image);
		} else {
			File filenoimg = new File(
					"C:\\Hibernate\\WorkSpace\\MeetBoth\\src\\main\\webapp\\WEB-INF\\resources\\assets\\images\\shop\\noimage.jpg");
			FileInputStream f = new FileInputStream(filenoimg);
			InputStream in = f;
			long size = filenoimg.length();
			image = fileToBlob(in, size);
			newProd.setProdImg(image);
		}

		newProd.setProdState(prodState);
		newProd.setProdName(prodName);
		newProd.setProdtype(currentProdType);
		newProd.setProdPrice(prodPrice);
		newProd.setMemberBean(mem.get());
		newProd.setInventory(prodInvt);
		newProd.setProdPost(getCurrentDate());
		newProd.setProdUpdate(getCurrentDate());
		newProd.setProdSales(prodSales);
		newProd.setProdCheck(prodCheck);
		newProd.setDirections(prodDir);

		LinkedHashSet<Product> prods = new LinkedHashSet<Product>();
		prods.add(newProd);
		currentProdType.setProduct(prods);

		ptService.insertProduct(currentProdType);

		return "redirect:_03_product.productindex.controller/1";
	}
	
//	導到後台修改
	@GetMapping("/_03_product.pathToMBinsertProd.controller")
	public String processpathToMBinsertProdAction(Model m, @RequestParam("id") Integer prodid) throws SQLException {
		Product p = pService.searchSingleProductFromProdID(prodid);
		m.addAttribute("prod", p);
		return "_03_product/MBupdateProd";
	}

	@PostMapping("/_03_product.MBupdateProdAction.controller")
	public String processMBupdatePordAction(@RequestParam("pst") String prodState, @RequestParam("pna") String prodName,
			@RequestParam("pid") Integer prodID, @RequestParam("pty") Integer prodType,
			@RequestParam("ppr") Integer prodPrice, @RequestParam("pmid") Integer memID,
			@RequestParam("pinvt") Integer prodInvt, @RequestParam("pps") Integer prodSales,
			@RequestParam("pch") Integer prodCheck, @RequestParam("pPic") MultipartFile file,
			@RequestParam("pdr") String prodDir) throws IOException, SQLException {
		Blob image = null;

		InputStream in = file.getInputStream();
		long size = file.getSize();
		image = fileToBlob(in, size);

		ProdType pType = ptService.findByProdclass(prodType);
		Product prod = pService.searchSingleProductFromProdID(prodID);
		Optional<MemberBean> mem = memberService.searchMemByID(memID);

		prod.setProdState(prodState);
		prod.setProdName(prodName);
		prod.setProdPrice(prodPrice);
		prod.setMemberBean(mem.get());
		prod.setInventory(prodInvt);
		prod.setDirections(prodDir);
		prod.setProdSales(prodSales);
		prod.setProdCheck(prodCheck);
		prod.setProdUpdate(getCurrentDate());
		prod.setProdtype(pType);
		if (size != 0) {
			prod.setProdImg(image);
			pService.updateProd(prod);
		} else {
			pService.updateProd(prod);
		}

		return "redirect:_03_product.productindex.controller/1";
	}

//	---------------------------小工具們-----------------------
//	fileToBlob
	public Blob fileToBlob(InputStream is, long size) throws IOException, SQLException {
		byte[] b = new byte[(int) size];
		SerialBlob sb = null;
		is.read(b);
		sb = new SerialBlob(b);
		return sb;
	}

//	取得系統時間
	public String getCurrentDate() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		return sdf.format(date);
	}

//	顯示照片
	@GetMapping("/_03_product.showPicture.controller")
	public void processShowPictureAction(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("id") Integer id) throws IOException {
		OutputStream os = null;
		InputStream is = null;
		Blob blob = null;
		Product prod = null;

		try {
			prod = pService.searchSingleProductFromProdID(id);
			if (prod != null) {
				blob = prod.getProdImg();
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
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (is != null) {
				is.close();
			}
			;
			if (os != null) {
				os.close();
			}
			;
		}
	}

//	---------------------------小工具們 ending-----------------------
//	跳轉到管理者商品後台
	@GetMapping("/_03_product.productindex.controller/{page}")
	public String processproductIndexAction(Model m, @PathVariable("page") String page) throws SQLException {
		List<Product> result = pService.searchAllProduct();
		int page2 = 1;
		try {
			page2 = Integer.parseInt(page);
		} catch (NumberFormatException e) {
			page2 = 1;
		}
		// 每頁顯示的貼文數量，可以自行修改
		int pageSize = 5;
		int totalPages = (int) Math.ceil((double) result.size() / pageSize);
		int startIndex = (page2 - 1) * pageSize;
		int endIndex = startIndex + pageSize;
		if (endIndex > result.size()) {
			endIndex = result.size();
		}
		if (startIndex >= result.size()) {
			startIndex = result.size() - pageSize;
		}
		if (result.size() <= pageSize) {
			startIndex = 0;
		} else if (startIndex >= result.size()) {
			startIndex = result.size() - pageSize;
		}
		List<Product> pageProd = result.subList(startIndex, endIndex);

		m.addAttribute("prodList", pageProd);
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("currentPage", page2);

		return "_03_product/productindex";
	}

//	調轉到單一的管理者商品後台
	@GetMapping("/_03_product.singleProductIndex.controller")
	public String processSingleProductIndexAction(@RequestParam("id") Integer prodID, Model mProd) throws SQLException {

		Product result = pService.searchSingleProductFromProdID(prodID);
		mProd.addAttribute("prod", result);
		return "_03_product/singleProdIndex";
	}

//	跳轉到商品明細
	@GetMapping("/_03_product.PathToProductDetail.controller")
	public String processPathToProductDetail2(@RequestParam("id") Integer id, Model mProd, Model mComm, Model mProdLike,
			HttpServletRequest request) throws SQLException {
		HttpSession session = request.getSession(false);

		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> mem = memberService.searchMemByAccount(account);

		Product prod = pService.searchSingleProductFromProdID(id);

		if (prod.getProdState().equals("下架")) {
			if (prod.getMemberBean().getMemberID() == mem.get(0).getMemberID()) {
				List<ProductComment> list = prod.getProductComment();
				ArrayList<ProductComment> comms = new ArrayList<ProductComment>();
				ProductComment comm = new ProductComment();

				mComm.addAttribute("commBean", list);

				if (prod.getDirections() == null) {
					prod.setDirections("--此商品沒有詳細內容說明--");
				}

				int prodClass = prod.getProdtype().getProdClass();
				int prodid = prod.getProdID();
				List<Product> prodLikeTop4 = pService.findTop4ProductLikeByProductLike(prodClass, prodid);
				mProdLike.addAttribute("prodLikeBean", prodLikeTop4);

				ArrayList<Product> prods = new ArrayList<Product>();
				prods.add(prod);
				mProd.addAttribute("bean", prods);
				return "_03_product/singleProduct";
			} else {
				return "_03_product/like403";
			}
		} else {
			List<ProductComment> list = prod.getProductComment();
			ArrayList<ProductComment> comms = new ArrayList<ProductComment>();
			ProductComment comm = new ProductComment();

			mComm.addAttribute("commBean", list);

			if (prod.getDirections() == null) {
				prod.setDirections("--此商品沒有詳細內容說明--");
			}

			int prodClass = prod.getProdtype().getProdClass();
			int prodid = prod.getProdID();
			List<Product> prodLikeTop4 = pService.findTop4ProductLikeByProductLike(prodClass, prodid);
			mProdLike.addAttribute("prodLikeBean", prodLikeTop4);

			ArrayList<Product> prods = new ArrayList<Product>();
			prods.add(prod);
			mProd.addAttribute("bean", prods);
			return "_03_product/singleProduct";
		}

	}

//	隨機搜尋
	@GetMapping("/_03_product.searchRandomProduct.controller/{page}")
	public String processsearchRandomProductAction(Model m,@PathVariable("page") String page) {
		List<Product> result = pService.findRandomProductsAndOnlyOnSales();
		int page2 = 1;
		try {
			page2 = Integer.parseInt(page);
		} catch (NumberFormatException e) {
			page2 = 1;
		}
		// 每頁顯示的貼文數量，可以自行修改
		int pageSize = 5;
		int totalPages = (int) Math.ceil((double) result.size() / pageSize);
		int startIndex = (page2 - 1) * pageSize;
		int endIndex = startIndex + pageSize;
		if (endIndex > result.size()) {
			endIndex = result.size();
		}
		if (startIndex >= result.size()) {
			startIndex = result.size() - pageSize;
		}
		if (result.size() <= pageSize) {
			startIndex = 0;
		} else if (startIndex >= result.size()) {
			startIndex = result.size() - pageSize;
		}
		List<Product> pageProd = result.subList(startIndex, endIndex);

		m.addAttribute("allprodlist", pageProd);
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("currentPage", page2);
		
		return "_03_product/typeShop";
	}

//	類別搜尋 回傳prodList
	@GetMapping("/_03_product.searchProductByType.controller/{page}/{type}")
	public String processsearchProductByTypeAction(Model m, @PathVariable("type") Integer type,@PathVariable("page") String page) {
		List<Product> result = pService.findByProdClassAndOnlyOnSales(type);
		int page2 = 1;
		try {
			page2 = Integer.parseInt(page);
		} catch (NumberFormatException e) {
			page2 = 1;
		}
		// 每頁顯示的貼文數量，可以自行修改
		int pageSize = 5;
		int totalPages = (int) Math.ceil((double) result.size() / pageSize);
		int startIndex = (page2 - 1) * pageSize;
		int endIndex = startIndex + pageSize;
		if (endIndex > result.size()) {
			endIndex = result.size();
		}
		if (startIndex >= result.size()) {
			startIndex = result.size() - pageSize;
		}
		if (result.size() <= pageSize) {
			startIndex = 0;
		} else if (startIndex >= result.size()) {
			startIndex = result.size() - pageSize;
		}
		List<Product> pageProd = result.subList(startIndex, endIndex);

		m.addAttribute("allprodlist", pageProd);
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("currentPage", page2);
		return "_03_product/typeShop";
	}

//	增加瀏覽次數
	@GetMapping("/product.productCheck.controller")
	public String processProductCheckAction(@RequestParam("id") Integer id) {
		try {
			Product p = pService.searchSingleProductFromProdID(id);
			Integer prodCheck = p.getProdCheck();
			prodCheck += 1;
			p.setProdCheck(prodCheck);
			pService.updateProd(p);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

//	更新商品狀態 (上架中/下架)
	@PostMapping("/_03_product.updateProductState.controller")
	public String processUpdateProductStateAction(@RequestParam("selectForUpdateState") List<String> productID)
			throws SQLException {

		Product p;

		for (int i = 0; i < productID.size(); i++) {
			int id = Integer.parseInt(productID.get(i));
			p = pService.searchSingleProductFromProdID(id);

			if (p.getProdState().equals("下架")) {
				p.setProdState("上架中");
			} else {
				p.setProdState("下架");
			}

			pService.updateProd(p);
		}

		return "redirect:_03_product/pathToMyPDP.controller";
	}
//	---------------------------ProductPart-----------------------

//	搜全部
	@GetMapping("/_03_product.searchAllProduct.controller/{page}")
	public String processSearchAllAction( Model m,@PathVariable("page") String page) {
		List<Product> result = pService.findAllAndOnlyOnSales();
		List<Product> HotResult = pService.findHotestProductsAndOnlyOnSales();
		m.addAttribute("Hotprodlist", HotResult);
		
		int page2 = 1;
		try {
			page2 = Integer.parseInt(page);
		} catch (NumberFormatException e) {
			page2 = 1;
		}
		// 每頁顯示的貼文數量，可以自行修改
		int pageSize = 5;
		int totalPages = (int) Math.ceil((double) result.size() / pageSize);
		int startIndex = (page2 - 1) * pageSize;
		int endIndex = startIndex + pageSize;
		if (endIndex > result.size()) {
			endIndex = result.size();
		}
		if (startIndex >= result.size()) {
			startIndex = result.size() - pageSize;
		}
		if (result.size() <= pageSize) {
			startIndex = 0;
		} else if (startIndex >= result.size()) {
			startIndex = result.size() - pageSize;
		}
		List<Product> pageProd = result.subList(startIndex, endIndex);

		m.addAttribute("allprodlist", pageProd);
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("currentPage", page2);
		return "_03_product/newShop";
	}

//	導到insert.jsp
	@GetMapping("/_03_product.pathToInsertProduct.controller")
	public String processPathToInsertProductAction(HttpServletRequest request, Model m) {
		HttpSession session = request.getSession(false);

		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> mem = memberService.searchMemByAccount(account);

		if (mem.size() == 0) {
			return "login";
		} else {
			m.addAttribute("memberBean", mem.get(0));
			return "/_03_product/InsertProduct";
		}
	}

//	insert
	@PostMapping("/_03_product.insertProduct.controller")
	public String processInsertProductAction(@RequestParam("pClass") Integer pClass,
			@RequestParam("pName") String pName, @RequestParam("pPrice") Integer pPrice,
			@RequestParam("memID") Integer memID, @RequestParam("invt") Integer invt, HttpServletRequest request,
			@RequestParam("directions") String directions, @RequestParam("pPic") MultipartFile file)
			throws IOException, SQLException {
		HttpSession session = request.getSession(false);

		Optional<MemberBean> currentMemberList = memberService.searchMemByID(memID);
		MemberBean currentMember = currentMemberList.get();

		ProdType currentProdType = ptService.findByProdclass(pClass);
		Product newProd = new Product();

		Blob image = null;

		if (file.getSize() != 0) {
			InputStream in = file.getInputStream();
			long size = file.getSize();
			image = fileToBlob(in, size);
			newProd.setProdImg(image);
		} else {
			File filenoimg = new File(
					"C:\\Hibernate\\WorkSpace\\MeetBoth\\src\\main\\webapp\\WEB-INF\\resources\\assets\\images\\shop\\noimage.jpg");
			FileInputStream f = new FileInputStream(filenoimg);
			InputStream in = f;
			long size = filenoimg.length();
			image = fileToBlob(in, size);
			newProd.setProdImg(image);
		}
		newProd.setProdName(pName);
		newProd.setProdPrice(pPrice);
		newProd.setInventory(invt);
		newProd.setProdPost(getCurrentDate());
		newProd.setProdUpdate(getCurrentDate());
		newProd.setDirections(directions);
		newProd.setProdSales(0);
		newProd.setProdCheck(0);
		newProd.setProdState("下架");
		newProd.setProdtype(currentProdType);
		newProd.setMemberBean(currentMember);

		pService.insertProduct(newProd);

		return "redirect:_03_product.searchAllProduct.controller/1";
	}

//	搜單一並導到update.jsp
	@GetMapping("/_03_product.catchSingleProductDate.controller")
	public String processCatchSingleProductDateAction(@RequestParam("id") Integer id, HttpServletRequest request,
			Model mProd) {
		Product prod;
		try {
			HttpSession session = request.getSession(false);

			String account = SecurityContextHolder.getContext().getAuthentication().getName();
			List<MemberBean> mem = memberService.searchMemByAccount(account);
			int memID1 = mem.get(0).getMemberID();

			prod = pService.searchSingleProductFromProdID(id);
			int memID2 = prod.getMemberBean().getMemberID();

			if (memID1 != memID2) {
				return "_03_product/like403";
			} else {
				ArrayList<Product> prods = new ArrayList<Product>();
				prods.add(prod);
				mProd.addAttribute("bean", prods);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "_03_product/UpdateProduct";
	}

//	update
	@PostMapping("/_03_product.updateProductDate.controller")
	public String processUpdateProductAction(@RequestParam("prodClass") Integer pClass,
			@RequestParam("prodName") String pName, @RequestParam("prodID") Integer prodID,
			@RequestParam("prodPrice") Integer pPrice, @RequestParam("inventory") Integer invt,
			@RequestParam("directions") String directions, @RequestParam("images") MultipartFile file) {
		Blob image = null;

		try {
			InputStream in = file.getInputStream();
			long size = file.getSize();
			image = fileToBlob(in, size);

			ProdType pType = ptService.findByProdclass(pClass);
			Product prod = pService.searchSingleProductFromProdID(prodID);
			prod.setProdName(pName);
			prod.setProdPrice(pPrice);
			prod.setInventory(invt);
			prod.setDirections(directions);
			prod.setProdUpdate(getCurrentDate());
			prod.setProdtype(pType);
			if (size != 0) {
				prod.setProdImg(image);
				pService.updateProd(prod);
			} else {
				pService.updateProd(prod);
			}
		} catch (IOException | SQLException e) {
			e.printStackTrace();
		}
		return "redirect:_03_product.searchAllProduct.controller/1";
	}

//	前台delete
	@PostMapping("/_03_product.deleteProductById.controller")
	public String processDeleteProductByIdAction(@RequestParam("id") Integer id) {
		pService.deleteProdFromProdID(id);
		return "redirect:_03_product.searchAllProduct.controller/1";
	}

//	後台delete
	@PostMapping("/_03_product.MBdeleteProductById.controller")
	public String processMBDeleteProductByIdAction(@RequestParam("id") Integer id) {
		pService.deleteProdFromProdID(id);
		return "redirect:_03_product.productindex.controller/1";
	}

//	模糊搜尋(前台)
	@PostMapping("/_03_product.searchProductWithCondition.controller/{page}")
	public String processSearchProductWithCondi(@RequestParam("case") int order, @RequestParam("typecase") Integer type,
			@RequestParam("lowprice") int low, @RequestParam("highprice") int high,@PathVariable("page") String page,
			@RequestParam("searchName") String name, Model m, Model mProd) throws SQLException {
		String orderBy = "";
		String hasDESC = null;
		List<Product> result = null;
		if (name == null) {
			name = "";
		}

		List<Product> HotResult = pService.findHotestProductsAndOnlyOnSales();
		mProd.addAttribute("Hotprodlist", HotResult);

		if (order == 1) {
			result = pService.findAllByOrderByProdIDAndOnlyOnSales(type, low, high, name);
		} else if (order == 2) {
			result = pService.findAllByOrderByProdPriceDescAndOnlyOnSales(type, low, high, name);
		} else if (order == 3) {
			result = pService.findAllByOrderByProdPriceAndOnlyOnSales(type, low, high, name);
		} else if (order == 4) {
			result = pService.findAllByOrderByProdPostDescAndOnlyOnSales(type, low, high, name);
		} else if (order == 5) {
			result = pService.findAllByOrderByProdUpdateDescAndOnlyOnSales(type, low, high, name);
		} else if (order == 6) {
			result = pService.findAllByOrderByProdCheckDescAndOnlyOnSales(type, low, high, name);
		}
		
		int page2 = 1;
		try {
			page2 = Integer.parseInt(page);
		} catch (NumberFormatException e) {
			page2 = 1;
		}
		// 每頁顯示的貼文數量，可以自行修改
		int pageSize = 5;
		int totalPages = (int) Math.ceil((double) result.size() / pageSize);
		int startIndex = (page2 - 1) * pageSize;
		int endIndex = startIndex + pageSize;
		if (endIndex > result.size()) {
			endIndex = result.size();
		}
		if (startIndex >= result.size()) {
			startIndex = result.size() - pageSize;
		}
		if (result.size() <= pageSize) {
			startIndex = 0;
		} else if (startIndex >= result.size()) {
			startIndex = result.size() - pageSize;
		}
		List<Product> pageProd = result.subList(startIndex, endIndex);

		m.addAttribute("allprodlist", pageProd);
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("currentPage", page2);
		
		return "_03_product/newShop";
	}

//	模糊搜尋(後台)
	@PostMapping("/_03_product.searchProductWithCondition2.controller/{page}")
	public String processSearchProductWithCondi2(@RequestParam("case") int order,
			@RequestParam("typecase") Integer type, @RequestParam("lowprice") int low,
			@RequestParam("highprice") int high, @RequestParam("searchName") String name, Model m,
			@PathVariable("page") String page) throws SQLException {
		String orderBy = "";
		String hasDESC = null;
		List<Product> result = null;
		if (name == null) {
			name = "";
		}

		if (order == 1) {
			result = pService.searchWithCondiOrderByProdID(type, low, high, name);
		} else if (order == 2) {
			result = pService.searchWithCondiOrderByProdPriceDesc(type, low, high, name);
		} else if (order == 3) {
			result = pService.searchWithCondiOrderByProdPrice(type, low, high, name);
		} else if (order == 4) {
			result = pService.searchWithCondiOrderByProdPost(type, low, high, name);
		} else if (order == 5) {
			result = pService.searchWithCondiOrderByProdUpdate(type, low, high, name);
		} else if (order == 6) {
			result = pService.findAllByOrderByProdCheckDesc(type, low, high, name);
		}

		int page2 = 1;
		try {
			page2 = Integer.parseInt(page);
		} catch (NumberFormatException e) {
			page2 = 1;
		}
		// 每頁顯示的貼文數量，可以自行修改
		int pageSize = 5;
		int totalPages = (int) Math.ceil((double) result.size() / pageSize);
		int startIndex = (page2 - 1) * pageSize;
		int endIndex = startIndex + pageSize;
		if (endIndex > result.size()) {
			endIndex = result.size();
		}
		if (startIndex >= result.size()) {
			startIndex = result.size() - pageSize;
		}
		if (result.size() <= pageSize) {
			startIndex = 0;
		} else if (startIndex >= result.size()) {
			startIndex = result.size() - pageSize;
		}
		List<Product> pageProd = result.subList(startIndex, endIndex);

		m.addAttribute("prodList", pageProd);
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("currentPage", page2);

		return "_03_product/productindex";
	}

//	-----------------------------------------------------CommentPart-------------------------------------------------
//	新增商品評論
	@PostMapping("/_03_product.InsertProdComment.controller")
	public String processInsertProdCommentAction(@RequestParam(value = "id", required = false) Integer prodID,
			@RequestParam("comm") String comment, @RequestParam("score") Integer score, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession(false);

			String account = SecurityContextHolder.getContext().getAuthentication().getName();
			List<MemberBean> mem = memberService.searchMemByAccount(account);

			if (mem.size() == 0) {
				return "login";
			} else {
				MemberBean member = mem.get(0);

				Product product = pService.searchSingleProductFromProdID(prodID);
				ProductComment comm = new ProductComment();

				comm.setMemberBean(member);
				comm.setProdScore(score);
				comm.setComment(comment);
				comm.setCommentDate(getCurrentDate());
				comm.setProduct(product);

				pcService.insertPorductComment(comm);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:_03_product.PathToProductDetail.controller?id=" + prodID;
	}

//	Comment + CommentByOrderBy
	@GetMapping("/_03_product.PathToProductDetailWithCommentOrerBy.controller")
	public String processPathToProductDetailWithCommentOrerBy(@RequestParam("id") Integer id,
			@RequestParam("commentOrderBy") Integer order, Model mProd, Model mComm) throws SQLException {
		Product prod = pService.searchSingleProductFromProdID(id);
		List<ProductComment> list = prod.getProductComment();
		ArrayList<ProductComment> comms = new ArrayList<ProductComment>();
		ProductComment comm = new ProductComment();
		List<ProductComment> commentOrderList = null;

		if (list.isEmpty()) {
			comm.setProdScore(0);
			comm.setCustomID(404);
			comm.setComment("no comment");
			comms.add(comm);
			mComm.addAttribute("commBean", comms);
		} else {
			switch (order) {
			case 1:
				commentOrderList = pcService.findAllByOrderBycommentDateDESC();
				mComm.addAttribute("commBean", commentOrderList);
				break;
			case 2:
				commentOrderList = pcService.findAllByOrderBycommentDate();
				mComm.addAttribute("commBean", commentOrderList);
				break;
			case 3:
				commentOrderList = pcService.findAllByOrderByProdScoreDESC();
				mComm.addAttribute("commBean", commentOrderList);
				break;
			case 4:
				commentOrderList = pcService.findAllByOrderByProdScore();
				mComm.addAttribute("commBean", commentOrderList);
				break;
			default:
				mComm.addAttribute("commBean", list);
				break;
			}
		}

		if (prod.getDirections() == null) {
			prod.setDirections("--此商品沒有詳細內容說明--");
		}

		ArrayList<Product> prods = new ArrayList<Product>();
		prods.add(prod);
		mProd.addAttribute("bean", prods);
		return null;
	}

//	個人賣場part----------------------------------
	@GetMapping("/_03_product/pathToMyPDP.controller")
	public String processpathToMyPDPAction(Model mProd, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		MemberBean member = (MemberBean) session.getAttribute("Member");

		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> mem = memberService.searchMemByAccount(account);

		if (mem.size() == 0) {
			return "login";
		} else {
			mProd.addAttribute("memberBean", mem.get(0));
			return "/_03_product/myPDP";
		}

	}

//	模糊搜尋(個人賣場)
	@PostMapping("/_03_product.searchProductWithCondition3.controller")
	public String processSearchProductWithCondi3(@RequestParam("case") int order,
			@RequestParam("typecase") Integer type, @RequestParam("lowprice") int low,
			@RequestParam("highprice") int high, @RequestParam("searchName") String name, Model pm, Model mProd)
			throws SQLException {
		String orderBy = "";
		String hasDESC = null;
		List<Product> result = null;
		if (name == null) {
			name = "";
		}

		List<Product> HotResult = pService.findHotestProducts();
		mProd.addAttribute("Hotprodlist", HotResult);

		if (order == 1) {
			result = pService.searchWithCondiOrderByProdID(type, low, high, name);
		} else if (order == 3) {
			result = pService.searchWithCondiOrderByProdPriceDesc(type, low, high, name);
		} else if (order == 2) {
			result = pService.searchWithCondiOrderByProdPrice(type, low, high, name);
		} else if (order == 4) {
			result = pService.searchWithCondiOrderByProdPost(type, low, high, name);
		} else if (order == 5) {
			result = pService.searchWithCondiOrderByProdUpdate(type, low, high, name);
		} else if (order == 6) {
			result = pService.findAllByOrderByProdCheckDesc(type, low, high, name);
		}

		pm.addAttribute("prodList", result);

		return "redirect:_03_product/pathToMyPDP.controller";
	}

}
