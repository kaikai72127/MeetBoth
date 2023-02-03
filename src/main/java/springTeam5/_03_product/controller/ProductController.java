package springTeam5._03_product.controller;

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
import java.util.Set;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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

//	跳轉到商品明細
	@GetMapping("/_03_product.PathToProductDetail.controller")
	public String processPathToProductDetail2(@RequestParam("id") Integer id,
			 Model mProd, Model mComm,Model mProdLike) throws SQLException {
		Product prod = pService.searchSingleProductFromProdID(id);
		List<ProductComment> list = prod.getProductComment();
		ArrayList<ProductComment> comms = new ArrayList<ProductComment>();
		ProductComment comm = new ProductComment();

		if (list.isEmpty()) {
			comm.setProdScore(0);
			comm.setCustomID(404);
			comm.setComment("no comment");
			comms.add(comm);
			mComm.addAttribute("commBean", comms);
		} else {
			mComm.addAttribute("commBean", list);
		}

		if (prod.getDirections() == null) {
			prod.setDirections("--此商品沒有詳細內容說明--");
		}
		
		int prodClass = prod.getProdtype().getProdClass();
		int prodid = prod.getProdID();
		List<Product> prodLikeTop4 = pService.findTop4ProductLikeByProductLike(prodClass,prodid);
		mProdLike.addAttribute("prodLikeBean",prodLikeTop4);
		
		ArrayList<Product> prods = new ArrayList<Product>();
		prods.add(prod);
		mProd.addAttribute("bean", prods);
		return "_03_product/singleProduct";
	}
	//搜相似產品(4)
	@GetMapping("/_03_product.searchProductLikeTop4.controller")
	public String processsearchProductLikeTop4(Model mProd) {
		List<Product> result;
		try {
			result = pService.searchAllProduct();
			mProd.addAttribute("allprodlist", result);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "_03_product/newShop";
	}
//	---------------------------ProductPart-----------------------

//	搜全部
	@GetMapping("/_03_product.searchAllProduct.controller")
	public String processSearchAllAction(Model mProd) {
		List<Product> result;
		try {
			result = pService.searchAllProduct();
			mProd.addAttribute("allprodlist", result);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "_03_product/newShop";
	}

//	搜單一並導到update.jsp
	@GetMapping("/_03_product.catchSingleProductDate.controller")
	public String processCatchSingleProductDateAction(@RequestParam("id") Integer id, Model mProd) {
		Product prod;
		try {
			prod = pService.searchSingleProductFromProdID(id);
			ArrayList<Product> prods = new ArrayList<Product>();
			prods.add(prod);
			mProd.addAttribute("bean", prods);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "_03_product/UpdateProduct";
	}

//	導到insert.jsp
	@GetMapping("/_03_product.pathToInsertProduct.controller")
	public String processPathToInsertProductAction() {
		return "/_03_product/InsertProduct";
	}

//	insert
	@PostMapping("/_03_product.insertProduct.controller")
	public String processInsertProductAction(@RequestParam("pClass") Integer pClass,
			@RequestParam("pName") String pName, @RequestParam("pPrice") Integer pPrice,
			@RequestParam("memID") Integer memID, @RequestParam("invt") Integer invt,
			@RequestParam("directions") String directions, @RequestParam("pPic") MultipartFile file)
			throws IOException, SQLException {
		Blob image = null;
		InputStream in = file.getInputStream();
		long size = file.getSize();
		image = fileToBlob(in, size);

		ProdType currentProdType = ptService.findByProdclass(pClass);
		Product newProd = new Product();

		newProd.setProdName(pName);
		newProd.setProdPrice(pPrice);
		newProd.setMemberID(memID);
		newProd.setInventory(invt);
		newProd.setProdPost(getCurrentDate());
		newProd.setProdUpdate(getCurrentDate());
		newProd.setProdImg(image);
		newProd.setDirections(directions);
		newProd.setProdtype(currentProdType);

		LinkedHashSet<Product> prods = new LinkedHashSet<Product>();
		prods.add(newProd);
		currentProdType.setProduct(prods);

		ptService.insertProduct(currentProdType);

		return "redirect:_03_product.searchAllProduct.controller";
	}

//	update
	@PostMapping("/_03_product.updateProductDate.controller")
	public String processUpdateProductAction(@RequestParam("prodClass") Integer pClass,
			@RequestParam("prodName") String pName, @RequestParam("prodID") Integer prodID,
			@RequestParam("prodPrice") Integer pPrice, @RequestParam("memberID") Integer memID,
			@RequestParam("inventory") Integer invt, @RequestParam("directions") String directions,
			@RequestParam("images") MultipartFile file) {
		Blob image = null;

		try {
			InputStream in = file.getInputStream();
			long size = file.getSize();
			image = fileToBlob(in, size);

			ProdType pType = ptService.findByProdclass(pClass);
			Product prod = pService.searchSingleProductFromProdID(prodID);
			prod.setProdName(pName);
			prod.setProdPrice(pPrice);
			prod.setMemberID(memID);
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
		return "redirect:_03_product.searchAllProduct.controller";
	}

//	delete
	@PostMapping("/_03_product.deleteProductById.controller")
	public String processDeleteProductByIdAction(@RequestParam("id") Integer id) {
		pService.deleteProdFromProdID(id);
		return "redirect:_03_product.searchAllProduct.controller";
	}

//	模糊搜尋
	@PostMapping("/_03_product.searchProductWithCondition.controller")
	public String processSearchProductWithCondi(@RequestParam("case") int order, @RequestParam("typecase") Integer type,
			@RequestParam("lowprice") int low, @RequestParam("highprice") int high,
			@RequestParam("searchName") String name, Model pm) throws SQLException {
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
		}

		pm.addAttribute("allprodlist", result);

		return "_03_product/newShop";
	}


//	-----------------------------------------------------CommentPart-------------------------------------------------
//	新增商品評論
	@PostMapping("/_03_product.InsertProdComment.controller")
	public String processInsertProdCommentAction(@RequestParam(value="id",required = false) Integer prodID,
			@RequestParam("comm") String comment, @RequestParam("score") Integer score) {
		try {
			Product product = pService.searchSingleProductFromProdID(prodID);
			ProductComment comm = new ProductComment();

			comm.setCustomID(1001);
			comm.setProdScore(score);
			comm.setComment(comment);
			comm.setCommentDate(getCurrentDate());
			comm.setProduct(product);

			List<ProductComment> prodCommment = new ArrayList<ProductComment>();
			prodCommment.add(comm);
			product.setProductComment(prodCommment);

			pService.insertComment(product);
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
		return "_03_product/prodDetail";
	}
}
