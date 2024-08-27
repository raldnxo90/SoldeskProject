package kr.co.soldesk.config;

import javax.annotation.Resource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.co.soldesk.beans.User;
import kr.co.soldesk.interceptor.AdminInterceptor;
import kr.co.soldesk.interceptor.TopInterceptor;
import kr.co.soldesk.interceptor.loginInterceptor;

@Configuration // Spring MVC 프로젝트에 관련된 설정을 하는 클래스
@EnableWebMvc // Controller 어노테이션이 셋팅되어 있는 클래스를 Controller로 등록
@ComponentScan("kr.co.soldesk.controller")
@ComponentScan("kr.co.soldesk.service")
@PropertySource("/WEB-INF/properties/db.properties")
public class ServletAppContext implements WebMvcConfigurer {
//WebMvcConfigurer: 스프링 프레임워크 설정 인터페이스
//ServletAppContext: 서블릿과 관련된 설정 및 빈을 관리(컨트롤러, 뷰 리졸버, 웹 관련 설정 등)	
	
    @Value("${db.classname}")
    private String db_classname;
    
    @Value("${db.url}")
    private String db_url;
    
    @Value("${db.username}")
    private String db_username;
    
    @Value("${db.password}")
    private String db_password;
    
	@Resource(name = "loginUserBean")
	private User loginUserBean;
    
    //데이터베이스 접속 정보 관리 Bean
    @Bean
    public BasicDataSource dataSource() {
        BasicDataSource source = new BasicDataSource();
        source.setDriverClassName(db_classname);
        source.setUrl(db_url);
        source.setUsername(db_username);
        source.setPassword(db_password);
        
        return source;
    }
    // 쿼리문과 접속 관리하는 객체인 SqlSessionFactory를 관리하는 Bean
    @Bean
    public SqlSessionFactory factory(BasicDataSource source) throws Exception {
        SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
        factoryBean.setDataSource(source);
        SqlSessionFactory factory = factoryBean.getObject();
        return factory;
    }
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		// Controller의 메서드가 반환하는 jsp의 이름 앞뒤에 경로와 확장자를 붙혀주도록 설정
		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/views/", ".jsp");
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
	//정적 파일 경로 매핑
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/**").addResourceLocations("/WEB-INF/resources/");
	}
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		loginInterceptor loginInterceptor = new loginInterceptor(loginUserBean);
		InterceptorRegistration reg1 = registry.addInterceptor(loginInterceptor);
		reg1.addPathPatterns("/user/logout");
		
		AdminInterceptor adminInterceptor = new AdminInterceptor(loginUserBean);
		InterceptorRegistration reg2 = registry.addInterceptor(adminInterceptor);
		reg2.addPathPatterns("/admin/*");
		reg2.excludePathPatterns("/admin/not_admin");
		
		TopInterceptor topInterceptor = new TopInterceptor(loginUserBean);
		InterceptorRegistration reg3 = registry.addInterceptor(topInterceptor);
		reg3.addPathPatterns("/**");
		
	}
	
}