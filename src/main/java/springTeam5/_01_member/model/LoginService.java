package springTeam5._01_member.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class LoginService {
	
	@Autowired
	private MemberRepository memberRepository;
	

	public MemberBean MemberLogin(String account) {
		List<MemberBean> member = memberRepository.searchMemByAccount(account);
		
		if (member.isEmpty()) {
			throw new UsernameNotFoundException("can't find user");
		}
		
		return member.get(0);
	}
}
