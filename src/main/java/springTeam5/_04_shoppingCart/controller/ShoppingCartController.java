package springTeam5._04_shoppingCart.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import springTeam5._03_product.model.Product;
import springTeam5._03_product.service.ProductService;
import springTeam5._04_shoppingCart.model.OrderItemBean;
import springTeam5._04_shoppingCart.model.ShoppingCart;

@Controller
@SessionAttributes(names = { "ShoppingCart" })
public class ShoppingCartController {

	@Autowired
	private ProductService productService;

	// Product加入購物車
	@PostMapping("/shoppingCartAdd.controller")
	public String processAction(@RequestParam("prodId") int prodId, @RequestParam("qty") @Nullable Integer qty, Model m,
			HttpServletRequest request) throws IOException, SQLException {
		HttpSession session = request.getSession(false);
		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
		if (cart == null) {
			// 就新建ShoppingCart物件
			cart = new ShoppingCart();
			// 並將此新建ShoppingCart的物件放到session物件內，成為它的屬性物件
			session.setAttribute("ShoppingCart", cart); // ${ShoppingCart.subtotal}
		}

		Product product = productService.searchSingleProductFromProdID(prodId);
		OrderItemBean ordetItemBean = new OrderItemBean();
		ordetItemBean.setProdId(prodId);
		ordetItemBean.setQty(qty);
		ordetItemBean.setItemTotal(qty*product.getProdPrice());

		//產品編號對應細項
		cart.addToCart(prodId, ordetItemBean);

		System.out.println(cart.getShoppingCart());
		m.addAttribute("bean", product);
		return "\"redirect:_03_product.PathToProductDetail.controller?id=" + prodId;

	}

	// 課程列表的加入購物車
	@GetMapping("/shoppingCartAddOnly.controller/{prodId}")
	public void processAction2(@PathVariable("prodId") int prodId, Integer qty, Model m, HttpServletRequest request)
			throws IOException, SQLException {
		HttpSession session = request.getSession(false);
		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
		if (cart == null) {
			// 就新建ShoppingCart物件
			cart = new ShoppingCart();
//				log.info("加入購物車之Controller: 新建ShoppingCart物件");
			// 並將此新建ShoppingCart的物件放到session物件內，成為它的屬性物件
			session.setAttribute("ShoppingCart", cart); // ${ShoppingCart.subtotal}
		}

		qty = 1;
		Product product = productService.searchSingleProductFromProdID(prodId);
		OrderItemBean ordetItemBean = new OrderItemBean();

		cart.addToCart(prodId, ordetItemBean);

		System.out.println(cart.getShoppingCart());
	}

	@GetMapping("/shoppingcart.controller")
	public String processMainAction(HttpServletRequest request) {
		HttpSession session = request.getSession(false);

		ShoppingCart sc = (ShoppingCart) session.getAttribute("ShoppingCart");
		if (sc == null) {
			// 跳轉回空的購物車頁面
			return "";
		}
		// 跳轉購物車頁面
		return "_04_shoppingCart/shoopingCart";
	}

	@GetMapping("/deleteshoppingitem.controller/{prodId}")
	public String deleleshoppingitem(@PathVariable("prodId") int prodId, HttpServletRequest request) {
		HttpSession session = null;
		session = request.getSession(false);
		ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("ShoppingCart");

		// 如果購物車內沒有東西 跳轉回搜尋全部商品的頁面
		if (shoppingCart == null) {
			return "redirect:/_03_product.searchAllProduct.controller";
		}
		// 刪除購物車內的商品 跳轉回
		shoppingCart.deleteProduct(prodId);
		return "redirect:/shoppingcart.controller";
	}

	// 放棄購買任何產品 清空購物車
	@GetMapping("/abandonshopping.controller")
	public String abandonShopping(HttpServletRequest request, SessionStatus sessionStatus) {
		HttpSession session = request.getSession(false);
		ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("ShoppingCart");
		if (shoppingCart != null) {
			session.removeAttribute("ShoppingCart");
			sessionStatus.setComplete();
		}

		// 放棄購物會跳轉回找所有商品的頁面
		return "redirect:/_03_product.searchAllProduct.controller";
	}

	// 更新購物車內的Item
	@PostMapping("/updateshoppingqty.controller/{prodId}")
	public String updateShoppingCartItem(@PathVariable("prodId") int prodId, @RequestParam("updateQty") int updateQty,
			HttpServletRequest request) {
		HttpSession session = null;
		session = request.getSession(false);
		ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("ShoppingCart");
		if (shoppingCart == null) {
			return "redirect:/";
		}

		shoppingCart.modifyQty(prodId, updateQty);
		return "redirect:/shoppingcart.controller";

	}

}
