package springTeam5._04_shoppingCart.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

import springTeam5._01_member.model.MemberBean;
import springTeam5._01_member.model.MemberService;
import springTeam5._03_product.model.Product;
import springTeam5._03_product.service.ProductService;
import springTeam5._04_shoppingCart.model.OrderItemBean;
import springTeam5._04_shoppingCart.model.ShoppingCart;

@Controller
@SessionAttributes(names = { "ShoppingCart" })
public class ShoppingCartController {

	private static Logger log = LoggerFactory.getLogger(ShoppingCartController.class);

	@Autowired
	private ProductService productService;
	@Autowired
	private MemberService memberService;

	// Product加入購物車
	@PostMapping("/addToshoppingCart.controller")
	public String processAction(@RequestParam("prodID") int prodID, @RequestParam("qty") @Nullable Integer qty, Model m,
			HttpServletRequest request) throws IOException, SQLException {

		// 查看是否存在session 並建立一個新的session
		HttpSession session = request.getSession(false);
		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");

		if (cart == null) {
			// 就新建ShoppingCart購物車物件
			// shoppingCart內就有建立HashMap
			cart = new ShoppingCart();
			// 並將此新建ShoppingCart的物件放到ShoppingCart session物件內，成為它的屬性物件
		}

		Product product = productService.searchSingleProductFromProdID(prodID);
		OrderItemBean ordetItemBean = new OrderItemBean();
		ordetItemBean.setProdItem(product);
		ordetItemBean.setQty(qty);
		ordetItemBean.setItemTotal(qty * product.getProdPrice());

		// 產品編號對應細項
		cart.addToCart(prodID, ordetItemBean);

		System.out.println("確認將產品細項加入了購物車" + cart.getShoppingCart());
		m.addAttribute("bean", product);
		return "redirect:/_03_product.PathToProductDetail.controller?id=" + prodID;

	}

	// 點加入購物車使用
	@GetMapping("/shoppingCartAddOnly.controller/{prodId}")
	public String processAction2(@PathVariable("prodId") int prodID, Integer qty, Model m, HttpServletRequest request)
			throws IOException, SQLException {
		HttpSession session = request.getSession(false);
		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
		MemberBean member = (MemberBean) session.getAttribute("Member");

		if (cart == null) {
			// 就新建ShoppingCart物件
			cart = new ShoppingCart();
			log.info("加入購物車之Controller: 新建ShoppingCart物件");
			// 並將此新建ShoppingCart的物件放到session物件內，成為它的屬性物件
			session.setAttribute("ShoppingCart", cart); // ${ShoppingCart.subtotal}
			// 測試用
			member = memberService.searchMemberById(1);

			System.out.println("-------------Session------購物車----------member");

			session.setAttribute("ShoppingCart", cart);
			session.setAttribute("Member", member);

		}
		// 將明細資料(價格，數量，與BookBean)封裝到OrderItemBean物件內
		Product product = productService.searchSingleProductFromProdID(prodID);

		OrderItemBean ordetItemBean = new OrderItemBean(null, null, null, product, qty, qty * product.getProdPrice());
		// 將OrderItem物件內加入ShoppingCart的物件內
		cart.addToCart(prodID, ordetItemBean);

		System.out.println("我有加到購物車" + cart.getShoppingCart());
		System.out.println(cart.getItemNumber() + "-----------------");
		session.setAttribute("CartSize", cart.getItemNumber());
		return "redirect:/_03_product.PathToProductDetail.controller?id=" + prodID;
	}

	// 查看我的購物車頁面
	@GetMapping("/shoppingcart.controller")
	public String processMainAction(HttpServletRequest request) {
		HttpSession session = request.getSession(false);

		ShoppingCart sc = (ShoppingCart) session.getAttribute("ShoppingCart");
		if (sc == null) {
			// 跳轉回空的購物車頁面
			return "_04_shoppingCart/shoppingCart";
		}
		// 跳轉到有購物車的頁面
		return "_04_shoppingCart/shoppingCart";
	}

	// 確認訂單購物車頁面
	@GetMapping("/shoppingcartCheck.controller")
	public String processCheckMainAction(HttpServletRequest request) {
		HttpSession session = request.getSession(false);

		ShoppingCart sc = (ShoppingCart) session.getAttribute("ShoppingCart");
		if (sc == null) {
			// 跳轉回空的購物車頁面
			return "_04_shoppingCart/shoppingCart";
		}
		// 跳轉到有購物車的頁面
		return "_04_shoppingCart/shoppingCartCheck";
	}

	// 移除一個item
	@GetMapping("/removeShoppingCartItem.controlle/{prodId}")
//	@GetMapping("/removeShoppingCartItem.controlle")
	public String deleleshoppingitem(@PathVariable("prodId") int prodId, HttpServletRequest request, SessionStatus sessionStatus) {
		HttpSession session = null;
		session = request.getSession(false);
		ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("ShoppingCart");

		System.out.println("執行刪除--------------------");

		// 如果購物車內沒有東西 跳轉回搜尋全部商品的頁面
		if (shoppingCart == null) {
			return "redirect:/_03_product.searchAllProduct.controller";
		}
		// 刪除購物車內的商品 跳轉回查看我的購物車Controller
		System.out.println("執行刪除購物車");
		shoppingCart.deleteProduct(prodId);
		//更新購物車顯示的數量
		session.setAttribute("CartSize", shoppingCart.getItemNumber());
		return "redirect:/shoppingcart.controller";
	}

	// 放棄購買任何產品 清空購物車 abandonShopping
	@GetMapping("/abandonshopping.controller")
	public String abandonShopping(HttpServletRequest request, SessionStatus sessionStatus) {
		HttpSession session = request.getSession(false);
		ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("ShoppingCart");
		if (shoppingCart != null) {
			// 由session物件中移除ShoppingCart物件
			log.info("放棄購物之Controller: 清空位於Session物件內的購物車物件");
			session.removeAttribute("ShoppingCart");
			session.removeAttribute("CartSize");
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
			return "redirect:/shoppingcart.controller";
		}

		shoppingCart.modifyQty(prodId, updateQty);
		return "redirect:/shoppingcart.controller";

	}

}
