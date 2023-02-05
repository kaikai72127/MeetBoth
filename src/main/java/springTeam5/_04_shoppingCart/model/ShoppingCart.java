package springTeam5._04_shoppingCart.model;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

public class ShoppingCart {

	private Map<Integer, OrderItemBean> cart = new LinkedHashMap<>();

	public ShoppingCart() {
	}

	//購物車內的所有明細Map
	public Map<Integer, OrderItemBean> getShoppingCart() { // ${ShoppingCart.getShoppingCart()}
		return cart;
	}

	//將商品加入購物車
	public void addToCart(int prodId, OrderItemBean orderItemBean) {
		
		if (orderItemBean.getQty() <= 0) {
			return;
		}
		
		// 如果客戶在伺服器端沒有此項商品的資料，則客戶第一次購買此項商品
		if (cart.get(prodId) == null) {
			cart.put(prodId, orderItemBean);
		} else {
			// 如果客戶在伺服器端已有此項商品的資料，則客戶『加購』此項商品
			OrderItemBean orderItemBeanAdd = cart.get(prodId);
			// 加購的數量：orderItemBean.getQty()
			// 原有的數量：orderItemBeanAdd.getQty()
			orderItemBeanAdd.setQty(orderItemBean.getQty() + orderItemBeanAdd.getQty());
		}
	}

	// 修改購物車商品的數量
	public boolean modifyQty(int prodId, int newQty) {
		if (cart.get(prodId) != null) {
			OrderItemBean orderItemBean = cart.get(prodId);
			orderItemBean.setQty(newQty);
			return true;
		} else {
			return false;
		}
	}

	// 刪除購物車某筆商品
	public int deleteProduct(int prodId) {
		if (cart.get(prodId) != null) {
			cart.remove(prodId); // Map介面的remove()方法
			return 1;
		} else {
			return 0;
		}
	}

	// 取得購物車內商品的總數量(用於顯示總數)
	public int getItemQty() {
		int qty = 0;
		for (Integer i : cart.keySet()) {
			OrderItemBean orderItemBean = cart.get(i);
			qty = qty + orderItemBean.getQty();
		}
		return qty;

	}
	
	// 取得購物車內商品的總數量(用於顯示商品數量)
	public int showShoppingCartItem() {
		int qty = 0;
		for (Integer i : cart.keySet()) {
			 qty+=1;
		}
		return qty;

	}

	// 計算購物車內所有商品的合計金額(每項商品的單價*數量的總和)
	public Integer getItemAmount() {
		Integer shoppingCartTotal = 0;
		Set<Integer> set = cart.keySet();
		for (int n : set) {
			OrderItemBean orderItemBean = cart.get(n);
			Integer price = orderItemBean.getProduct().getProdPrice();
			int qty = orderItemBean.getQty();
			shoppingCartTotal += price * qty;
		}
		
		return shoppingCartTotal;
	}
	
	

}
