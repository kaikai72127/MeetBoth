package springTeam5._03_product.service;


import java.sql.SQLException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springTeam5._03_product.model.ProductRepository;
import springTeam5._03_product.model.Product;

@Service
@Transactional
public class ProductService {

	@Autowired
	private ProductRepository pRepo;

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
	public List<Product> findByProdClass(Integer prodClass){
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
	public List<Product> searchWithCondiOrderByProdID(Integer type, Integer low, Integer high, String name)throws SQLException {
		return pRepo.findAllByOrderByProdID(type, low, high, name);
	}
	public List<Product> searchWithCondiOrderByProdPriceDesc(Integer type, Integer low, Integer high, String name)throws SQLException {
		return pRepo.findAllByOrderByProdPriceDesc(type, low, high, name);
	}
	public List<Product> searchWithCondiOrderByProdPrice(Integer type, Integer low, Integer high, String name)throws SQLException {
		return pRepo.findAllByOrderByProdPrice(type, low, high, name);
	}
	public List<Product> searchWithCondiOrderByProdPost(Integer type, Integer low, Integer high, String name)throws SQLException {
		return pRepo.findAllByOrderByProdID(type, low, high, name);
	}
	public List<Product> searchWithCondiOrderByProdUpdate(Integer type, Integer low, Integer high, String name)throws SQLException {
		return pRepo.findAllByOrderByProdID(type, low, high, name);
	}
	
	public List<Product> findTop4ProductLikeByProductLike(Integer prodClass,Integer prodID){
		return pRepo.findTop4ProductLikeByProductLike(prodClass,prodID);
	}
	
	public List<Product> findRandomProducts(){
		return pRepo.findRandomProducts();
	}
}
