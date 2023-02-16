package springTeam5._03_product.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ProductRepository extends JpaRepository<Product, Integer> {

//	shoppingHome 全部搜尋
	@Query(value="select * from Product Order By ProdID", nativeQuery=true)
	public List<Product> findAll();

//	給ProdPicSave使用 來找尋單一的Product 並顯示圖片
//	或是 單純用來搜尋單一Product
	public Product findByProdID(Integer prodID);

//	透過prodID刪除整筆商品資料
	public void deleteByProdID(Integer prodID);
	
//	透過產品類別搜尋
	@Query(value="select * from Product where prodClass = ?1 Order By ProdID", nativeQuery=true)
	public List<Product> findByProdClass(Integer prodClass);

//	條件搜尋
	@Query(value = "select * from Product where IIF(?1=0,?1,prodClass)=?1 and prodPrice >= ?2 and prodPrice <= ?3 and (prodName like concat('%',?4,'%') or memberID like concat('%',?4,'%')) order by prodID", nativeQuery = true)
	public List<Product> findAllByOrderByProdID(Integer type, Integer low, Integer high, String name);

	@Query(value = "select * from Product where IIF(?1=0,?1,prodClass)=?1 and prodPrice >= ?2 and prodPrice <= ?3 and (prodName like concat('%',?4,'%') or memberID like concat('%',?4,'%')) order by ProdPrice DESC", nativeQuery = true)
	public List<Product> findAllByOrderByProdPriceDesc(Integer type, Integer low, Integer high,String name);

	@Query(value = "select * from Product where IIF(?1=0,?1,prodClass)=?1 and prodPrice >= ?2 and prodPrice <= ?3 and (prodName like concat('%',?4,'%') or memberID like concat('%',?4,'%')) order by prodPrice", nativeQuery = true)
	public List<Product> findAllByOrderByProdPrice(Integer type, Integer low, Integer high, String name);
	
	@Query(value = "select * from Product where IIF(?1=0,?1,prodClass)=?1 and prodPrice >= ?2 and prodPrice <= ?3 and (prodName like concat('%',?4,'%') or memberID like concat('%',?4,'%')) order by ProdPost DESC", nativeQuery = true)
	public List<Product> findAllByOrderByProdPostDesc(Integer type, Integer low, Integer high, String name);

	@Query(value = "select * from Product where IIF(?1=0,?1,prodClass)=?1 and prodPrice >= ?2 and prodPrice <= ?3 and (prodName like concat('%',?4,'%') or memberID like concat('%',?4,'%')) order by prodUpdate DESC", nativeQuery = true)
	public List<Product> findAllByOrderByProdUpdateDesc(Integer type, Integer low, Integer high, String name);
	
	@Query(value = "select * from Product where IIF(?1=0,?1,prodClass)=?1 and prodPrice >= ?2 and prodPrice <= ?3 and (prodName like concat('%',?4,'%') or memberID like concat('%',?4,'%')) order by prodCheck DESC", nativeQuery = true)
	public List<Product> findAllByOrderByProdCheckDesc(Integer type, Integer low, Integer high, String name);

	@Query(value = "select top 4 * from Product where prodClass = ?1 and prodID != ?2 order by prodID", nativeQuery=true)
	public List<Product> findTop4ProductLikeByProductLike(Integer prodClass,Integer prodID);

	@Query(value = "select top 8 * from Product order by NEWID()", nativeQuery = true)
	public List<Product> findRandomProducts();
	
	@Query(value = "select top 4 * from Product order by prodCheck DESC,prodSales DESC;", nativeQuery = true)
	public List<Product> findHotestProducts();
	
	
//	-------------------上下架的搜尋------------------------
	@Query(value="select * from Product where prodState != '下架' Order By ProdID", nativeQuery = true)
	public List<Product> findAllAndOnlyOnSales();
	
//	透過產品類別搜尋
	@Query(value="select * from Product where prodClass = ?1 and prodState != '下架' Order By ProdID", nativeQuery=true)
	public List<Product> findByProdClassAndOnlyOnSales(Integer prodClass);
	
//	條件搜尋
	@Query(value = "select * from Product where IIF(?1=0,?1,prodClass)=?1 and prodPrice >= ?2 and prodPrice <= ?3 and prodState != '下架' and (prodName like concat('%',?4,'%') or memberID like concat('%',?4,'%')) order by prodID", nativeQuery = true)
	public List<Product> findAllByOrderByProdIDAndOnlyOnSales(Integer type, Integer low, Integer high, String name);

	@Query(value = "select * from Product where IIF(?1=0,?1,prodClass)=?1 and prodPrice >= ?2 and prodPrice <= ?3 and prodState != '下架' and (prodName like concat('%',?4,'%') or memberID like concat('%',?4,'%')) order by ProdPrice DESC", nativeQuery = true)
	public List<Product> findAllByOrderByProdPriceDescAndOnlyOnSales(Integer type, Integer low, Integer high,String name);

	@Query(value = "select * from Product where IIF(?1=0,?1,prodClass)=?1 and prodPrice >= ?2 and prodPrice <= ?3 and prodState != '下架' and (prodName like concat('%',?4,'%') or memberID like concat('%',?4,'%')) order by prodPrice", nativeQuery = true)
	public List<Product> findAllByOrderByProdPriceAndOnlyOnSales(Integer type, Integer low, Integer high, String name);
	
	@Query(value = "select * from Product where IIF(?1=0,?1,prodClass)=?1 and prodPrice >= ?2 and prodPrice <= ?3 and prodState != '下架' and (prodName like concat('%',?4,'%') or memberID like concat('%',?4,'%')) order by ProdPost DESC", nativeQuery = true)
	public List<Product> findAllByOrderByProdPostDescAndOnlyOnSales(Integer type, Integer low, Integer high, String name);

	@Query(value = "select * from Product where IIF(?1=0,?1,prodClass)=?1 and prodPrice >= ?2 and prodPrice <= ?3 and prodState != '下架' and (prodName like concat('%',?4,'%') or memberID like concat('%',?4,'%')) order by prodUpdate DESC", nativeQuery = true)
	public List<Product> findAllByOrderByProdUpdateDescAndOnlyOnSales(Integer type, Integer low, Integer high, String name);
	
	@Query(value = "select * from Product where IIF(?1=0,?1,prodClass)=?1 and prodPrice >= ?2 and prodPrice <= ?3 and prodState != '下架' and (prodName like concat('%',?4,'%') or memberID like concat('%',?4,'%')) order by prodCheck DESC", nativeQuery = true)
	public List<Product> findAllByOrderByProdCheckDescAndOnlyOnSales(Integer type, Integer low, Integer high, String name);

	@Query(value = "select top 4 * from Product where prodClass = ?1 and prodID != ?2 prodState != '下架' order by prodID", nativeQuery=true)
	public List<Product> findTop4ProductLikeByProductLikeAndOnlyOnSales(Integer prodClass,Integer prodID);

	@Query(value = "select top 8 * from Product where prodState != '下架' order by NEWID()", nativeQuery = true)
	public List<Product> findRandomProductsAndOnlyOnSales();
	
	@Query(value = "select top 4 * from Product where prodState != '下架' order by prodCheck DESC,prodSales DESC;", nativeQuery = true)
	public List<Product> findHotestProductsAndOnlyOnSales();

//	---------------------------透過memID找prod但不顯示 下架產品-------------------------------
	@Query(value = "select * from product where memberID = ?1 and prodState != '下架'",nativeQuery = true)
	public List<Product> findByMemidAndOnlyOnSales(Integer memId);
	
}
