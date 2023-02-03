package springTeam5._03_product.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springTeam5._03_product.model.ProdType;
import springTeam5._03_product.model.ProdTypeRepository;
import springTeam5._03_product.model.Product;

@Service
@Transactional
public class ProdTypeService {

	@Autowired
	private ProdTypeRepository ptRepo;
	
//	透過產品類別編號建立查詢
	public ProdType findByProdclass(Integer prodclass) {
		return ptRepo.findByProdClass(prodclass);
	}
	
//	新增商品
	public void insertProduct(ProdType pt) {
		ptRepo.save(pt);
	}
	
}
