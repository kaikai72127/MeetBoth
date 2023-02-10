package springTeam5._01_member.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface MemberRepository extends JpaRepository<MemberBean, Integer> {
	
	@Query(value = "from MemberBean where account like concat('%',:account,'%')")
	public List<MemberBean> searchMemByAccountLike(String account);

	@Query(value = "from MemberBean where memName like concat('%',:memName,'%')")
	public List<MemberBean> searchMemByNameLike(String memName);
	
	@Query(value = "from MemberBean where account = :account")
	public List<MemberBean> searchMemByAccount(String account);







}
