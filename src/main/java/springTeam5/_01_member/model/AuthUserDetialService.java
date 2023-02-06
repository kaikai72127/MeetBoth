package springTeam5._01_member.model;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class AuthUserDetialService implements UserDetailsService {
	
	@Autowired
	private LoginService loginService;

	@Override
	public UserDetails loadUserByUsername(String account) throws UsernameNotFoundException {
		MemberBean member = loginService.MemberLogin(account);
		return new User(member.getAccount(), member.getPassword(), AuthorityUtils.createAuthorityList(member.getRole()));
	}

}
