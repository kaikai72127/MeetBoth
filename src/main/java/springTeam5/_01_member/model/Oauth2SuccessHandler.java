package springTeam5._01_member.model;

import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2UserAuthority;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;

public class Oauth2SuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

	@Autowired
	private MemberService mService;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		super.onAuthenticationSuccess(request, response, authentication);
//		取得服務商
		String uri = request.getRequestURI();
	    String[] parts = uri.split("/");
	    String provider = parts[parts.length - 1];
//	    組合第三方帳號
	    String account = provider.toUpperCase() + "_" + authentication.getName();
	    OAuth2User oAuth2User = (OAuth2User)authentication.getPrincipal();
//	    檢查是否註冊過
//	    若為首次登入
	    if (mService.searchMemByAccount(account) == null) {
			MemberBean member = new MemberBean();
			member.setAccount(account);
			member.setMemName(oAuth2User.getAttribute("name"));
			member.seteMail(oAuth2User.getAttribute("email"));
			mService.add(member);
			request.setAttribute("account", account);
			response.sendRedirect("/_01_member/oathupdate");
		}else {
			response.sendRedirect("/");
		}
	    	
	}
	
	
	

}
