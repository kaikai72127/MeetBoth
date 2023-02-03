package springTeam5;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import springTeam5._01_member.model.AuthUserDetialService;


@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private AuthUserDetialService authService;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
		  .userDetailsService(authService)
		  .passwordEncoder(new BCryptPasswordEncoder());
//		auth.inMemoryAuthentication()
//			.withUser("a05852002")
//			.password("!Aa123456")
//			.roles("ADMIN","USER") //擁有管理員與一般使用者權限
//			.and()
//			.withUser("user")
//			.password("123456")
//			.roles("USER");
	}

	@Override
	public void configure(WebSecurity web) throws Exception {

	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
       http
         .authorizeRequests()
         .antMatchers(HttpMethod.GET,"/backIndex.controller").authenticated()
         .antMatchers(HttpMethod.GET).permitAll()
         .antMatchers(HttpMethod.POST,"/backIndex.controller").authenticated()
         .antMatchers(HttpMethod.POST).permitAll()
         .anyRequest().authenticated()
         .and()
         .rememberMe().tokenValiditySeconds(86400).key("rememberMe-key")
         .and()
         .csrf().disable()
         .formLogin().loginPage("/login/page")
         .defaultSuccessUrl("/backIndex")
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
