package springTeam5._03_product.model;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "PRODUCTCOMMENT")
@Component
public class ProductComment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "COMMENTID")
	private int commentID;

	@Column(name = "CUSTOMID")
	private int customID;

	@Column(name = "PRODSCORE")
	private int prodScore;

	@Column(name = "COMMENT")
	private String comment;

	@Column(name = "COMMENTDATE")
	private String commentDate;

	@Column(name = "PRODID")
	@Transient
	private int prodID;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "PRODID")
	private Product product;

	public ProductComment() {
	}

	public int getCommentID() {
		return commentID;
	}

	public void setCommentID(int commentID) {
		this.commentID = commentID;
	}

	public int getCustomID() {
		return customID;
	}

	public void setCustomID(int customID) {
		this.customID = customID;
	}

	public int getProdScore() {
		return prodScore;
	}

	public void setProdScore(int prodScore) {
		this.prodScore = prodScore;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}

	public int getProdID() {
		return prodID;
	}

	public void setProdID(int prodID) {
		this.prodID = prodID;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public ProductComment(int commentID, int customID, int prodScore, String comment, String commentDate, int prodID,
			Product product) {
		super();
		this.commentID = commentID;
		this.customID = customID;
		this.prodScore = prodScore;
		this.comment = comment;
		this.commentDate = commentDate;
		this.prodID = prodID;
		this.product = product;
	}

}
