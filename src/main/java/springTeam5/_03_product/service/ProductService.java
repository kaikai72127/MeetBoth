package springTeam5._03_product.service;

import java.sql.SQLException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import springTeam5._03_product.model.ProductRepository;
import springTeam5._03_product.model.ProdType;
import springTeam5._03_product.model.Product;

@Service
@Transactional
public class ProductService {

	@Autowired
	private ProductRepository pRepo;
	
//	新增商品
	public void insertProduct(Product p) {
		pRepo.save(p);
	}

//	搜尋全部商品
//	@Override
	public List<Product> searchAllProduct() throws SQLException {
		return pRepo.findAll();
	}

//	透過商品編號(prodID)來做單一個商品資訊搜尋 會回傳一個 Product
	public Product searchSingleProductFromProdID(Integer prodID) throws SQLException {
		return pRepo.findByProdID(prodID);
	}

//	透過prodID刪除整筆資料
	public void deleteProdFromProdID(Integer prodID) {
		pRepo.deleteByProdID(prodID);
	}

//	透過產品類別搜尋
	public List<Product> findByProdClass(Integer prodClass) {
		return pRepo.findByProdClass(prodClass);
	}

//	透過prodID修改product的資料
	public void updateProd(Product p) {
		pRepo.save(p);
	}

//	新增評論
	public void insertComment(Product p) {
		pRepo.save(p);
	}

//	模糊搜尋
	public List<Product> searchWithCondiOrderByProdID(Integer type, Integer low, Integer high, String name)
			throws SQLException {
		return pRepo.findAllByOrderByProdID(type, low, high, name);
	}

	public List<Product> searchWithCondiOrderByProdPriceDesc(Integer type, Integer low, Integer high, String name)
			throws SQLException {
		return pRepo.findAllByOrderByProdPriceDesc(type, low, high, name);
	}

	public List<Product> searchWithCondiOrderByProdPrice(Integer type, Integer low, Integer high, String name)
			throws SQLException {
		return pRepo.findAllByOrderByProdPrice(type, low, high, name);
	}

	public List<Product> searchWithCondiOrderByProdPost(Integer type, Integer low, Integer high, String name)
			throws SQLException {
		return pRepo.findAllByOrderByProdID(type, low, high, name);
	}

	public List<Product> searchWithCondiOrderByProdUpdate(Integer type, Integer low, Integer high, String name)
			throws SQLException {
		return pRepo.findAllByOrderByProdID(type, low, high, name);
	}

	public List<Product> findAllByOrderByProdCheckDesc(Integer type, Integer low, Integer high, String name)
			throws SQLException {
		return pRepo.findAllByOrderByProdCheckDesc(type, low, high, name);
	}

	public List<Product> findTop4ProductLikeByProductLike(Integer prodClass, Integer prodID) {
		return pRepo.findTop4ProductLikeByProductLike(prodClass, prodID);
	}

//	隨機搜尋
	public List<Product> findRandomProducts() {
		return pRepo.findRandomProducts();
	}

//	熱門檢索
	public List<Product> findHotestProducts() {
		return pRepo.findHotestProducts();
	}
	
//	-------------------上下架的搜尋------------------------
	public List<Product> findAllAndOnlyOnSales(){
		return pRepo.findAllAndOnlyOnSales();
	}
	
//	透過產品類別搜尋
	public List<Product> findByProdClassAndOnlyOnSales(Integer prodClass){
		return pRepo.findByProdClassAndOnlyOnSales(prodClass);
	}
	
//	條件搜尋
	public List<Product> findAllByOrderByProdIDAndOnlyOnSales(Integer type, Integer low, Integer high, String name){
		return pRepo.findAllByOrderByProdIDAndOnlyOnSales(type, low, high, name);
	}

	public List<Product> findAllByOrderByProdPriceDescAndOnlyOnSales(Integer type, Integer low, Integer high,String name){
		return pRepo.findAllByOrderByProdPriceDescAndOnlyOnSales(type, low, high, name);
	}

	public List<Product> findAllByOrderByProdPriceAndOnlyOnSales(Integer type, Integer low, Integer high, String name){
		return pRepo.findAllByOrderByProdPriceAndOnlyOnSales(type, low, high, name);
	}
	
	public List<Product> findAllByOrderByProdPostDescAndOnlyOnSales(Integer type, Integer low, Integer high, String name){
		return pRepo.findAllByOrderByProdPostDescAndOnlyOnSales(type, low, high, name);
	}

	public List<Product> findAllByOrderByProdUpdateDescAndOnlyOnSales(Integer type, Integer low, Integer high, String name){
		return pRepo.findAllByOrderByProdUpdateDescAndOnlyOnSales(type, low, high, name);
	}
	
	public List<Product> findAllByOrderByProdCheckDescAndOnlyOnSales(Integer type, Integer low, Integer high, String name){
		return pRepo.findAllByOrderByProdCheckDescAndOnlyOnSales(type, low, high, name);
	}

	public List<Product> findTop4ProductLikeByProductLikeAndOnlyOnSales(Integer prodClass,Integer prodID){
		return pRepo.findTop4ProductLikeByProductLikeAndOnlyOnSales(prodClass, prodID);
	}

	public List<Product> findRandomProductsAndOnlyOnSales(){
		return pRepo.findRandomProductsAndOnlyOnSales();
	}
	
	public List<Product> findHotestProductsAndOnlyOnSales(){
		return pRepo.findHotestProductsAndOnlyOnSales();
	}
	
//	---------------------------透過memID找prod但不顯示 下架產品-------------------------------
	public List<Product> findByMemidAndOnlyOnSales(Integer memId){
		return pRepo.findByMemidAndOnlyOnSales(memId);
	}
}
