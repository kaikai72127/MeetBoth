package springTeam5._03_product.service;

import java.sql.SQLException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springTeam5._03_product.model.ProductComment;
import springTeam5._03_product.model.ProductCommentRepository;

@Service
@Transactional
public class ProductCommentService {

	@Autowired
	private ProductCommentRepository pcRepo;
	
	public void insertPorductComment(ProductComment pc) {
		pcRepo.save(pc);
	}
	
	
//	透過 ProdID 搜尋全部的 commentBean
	public List<ProductComment> searchAllCommentByProdID(Integer id) throws SQLException {
		return pcRepo.findByAllLike(id);
	}

//	修改一條Comment
	public void updateCommentByCommentID(ProductComment c) {
		pcRepo.save(c);
	}

//	刪除某條Comment
	public void deleteCommentFromCommentID(Integer CommentID) {
		pcRepo.deleteByCommentID(CommentID);
	}

//	排序
//	評分高到低
	public List<ProductComment> findAllByOrderByProdScore() {
		return pcRepo.findAllByOrderByProdScore();
	}

//	評分低到高
	public List<ProductComment> findAllByOrderByProdScoreDESC() {
		return pcRepo.findAllByOrderByProdScoreDesc();
	}

//	時間較新
	public List<ProductComment> findAllByOrderBycommentDate() {
		return pcRepo.findAllByOrderByCommentDate();
	}

//	時間較舊
	public List<ProductComment> findAllByOrderBycommentDateDESC() {
		return pcRepo.findAllByOrderByCommentDateDesc();
	}

}
