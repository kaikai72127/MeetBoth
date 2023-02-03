package springTeam5._03_product.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ProdTypeRepository extends JpaRepository<ProdType, Integer>  {
	
//	搜單一類別
	public ProdType findByProdClass(Integer prodclass);
}
