package springTeam5;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/html/images/**").addResourceLocations("/WEB-INF/resources/images/");
		registry.addResourceHandler("/html/assets/css/**").addResourceLocations("/WEB-INF/resources/assets/css/");
		registry.addResourceHandler("/html/assets/js/**").addResourceLocations("/WEB-INF/resources/assets/js/");
		registry.addResourceHandler("/html/assets/scss/**").addResourceLocations("/WEB-INF/resources/assets/sass/");
		registry.addResourceHandler("/html/assets/images/**").addResourceLocations("/WEB-INF/resources/assets/images/");
		registry.addResourceHandler("/html/assets/lib/**").addResourceLocations("/WEB-INF/resources/assets/lib/");
	}
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/login/page").setViewName("_01_member/login");
		registry.addViewController("/backIndex").setViewName("backIndex");
		registry.addViewController("/index").setViewName("index");
		registry.addViewController("/logout").setViewName("_01_member/logout");
		registry.addViewController("/error403").setViewName("errorpages/403");
		registry.addViewController("/GoogleAuth").setViewName("_01_member/GoogleAuth");
		registry.addViewController("/mail").setViewName("_01_member/mail");
	}
}
