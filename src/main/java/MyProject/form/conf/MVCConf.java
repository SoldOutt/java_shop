package MyProject.form.conf;


import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import MyProject.form.dto.Constands;

@Configuration
public class MVCConf implements WebMvcConfigurer,Constands {
	
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		// TODO Auto-generated method stub
		registry.addResourceHandler("/user/**").addResourceLocations("classpath:/user/");
		// resource handler cho phần upload ảnh từ người dùng.
				registry.addResourceHandler("/uploads/**").addResourceLocations("file:" + PATH_PRODUCT_IMG);
		
	}
	
	@Bean // config folder chứa view
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class); // view engine
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");
		return bean;
	}
}


