package springTeam5;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.client.web.AuthorizationRequestRepository;
import org.springframework.security.oauth2.client.web.HttpSessionOAuth2AuthorizationRequestRepository;
import org.springframework.security.oauth2.core.endpoint.OAuth2AuthorizationRequest;

import springTeam5._01_member.model.AuthUserDetialService;

@Configuration
@EnableWebSecurity
@PropertySource("classpath:application.properties")
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private AuthUserDetialService authService;
	

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
		  .userDetailsService(authService)
		  .passwordEncoder(new BCryptPasswordEncoder());
	}

	@Override
	public void configure(WebSecurity web) throws Exception {

	}

	@Override
	public void configure(HttpSecurity http) throws Exception {
       http
         .authorizeRequests()
         .antMatchers("/index").permitAll()
         .antMatchers("/login/page").permitAll()
         .antMatchers(HttpMethod.GET,"/backIndex.controller").hasAnyAuthority("admin")
         .antMatchers(HttpMethod.POST,"/backIndex.controller").hasRole("admin")
//         .anyRequest().authenticated()
         
         .and()  //Google第三方驗證
         
         .oauth2Login()
//         .authorizationEndpoint()
//         .baseUri("/login/page")
//         .authorizationRequestRepository(authorizationRequestRepository())
//         .and()
         
         .and()
         .exceptionHandling()
         .accessDeniedPage("/error403") //攔截403並轉向客製化403
         .and()
         
         .rememberMe().tokenValiditySeconds(86400).key("rememberMe-key")
         .and()
         
         .csrf().disable()
         .formLogin().loginPage("/login/page")
         .defaultSuccessUrl("/")
         .and()
         
         .logout()
         .logoutUrl("/logout") //自定義登出URL
         .logoutSuccessUrl("/") //登出成功後導向首頁
         .deleteCookies("JSESSIONID") //刪除指定的Cookie
         .invalidateHttpSession(true) //使HttpSession失效
         .and()
         
         .sessionManagement()
         .maximumSessions(1);
         
       
       
	}

}
