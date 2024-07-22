package kr.co.soldesk.config;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;

public class SpringConfigClass implements WebApplicationInitializer{
/*
WebApplicationInitializer
-web.xml 없이도 자바 클래스를 통해 웹 애플리케이션을 설정
-애플리케이션 시작 시 자동으로 실행	
*/	
	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
	//onStartup : 웹 애플리케이션이 시작될 때 호출되며, 서블릿 컨텍스트(서블릿과 서블릿 컨테이너 간 통신 지원)를 설정하는 데 사용		

		AnnotationConfigWebApplicationContext servletAppContext = new AnnotationConfigWebApplicationContext();
		//애플리케이션 시작 시점에 컨테이너 생성(web.xml, <servlet>)
		servletAppContext.register(ServletAppContext.class);
		//ServletAppContext 파일을 컨테이너 파일로 등록

		DispatcherServlet dispatcherServlet = new DispatcherServlet(servletAppContext);
		//DispatcherServlet: 프론트에서 들어오는 모든 요청을 가로채 컨트롤러로 전달하고 응답 생성

		ServletRegistration.Dynamic servlet = servletContext.addServlet("dispatcher", dispatcherServlet);
		//서블릿 컨텍스트에 등록
		
		// 부가 설정
		servlet.setLoadOnStartup(1);//가장먼저 받아들이겠다는 뜻
		servlet.addMapping("/");
		
		//==================================================================

	    //(web.xml에서  <context-param>구현부와 같음)
		// Bean을 정의하는 클래스를 지정한다
		AnnotationConfigWebApplicationContext rootAppContext = new AnnotationConfigWebApplicationContext();
		rootAppContext.register(RootAppContext.class);
		 //(web.xml에서  <listener>구현부와 같음)
		ContextLoaderListener listener = new ContextLoaderListener(rootAppContext);
		servletContext.addListener(listener);
	    //(web.xml에서  <filter>구현부와 같음)
	    // 파라미터 인코딩 설정
		FilterRegistration.Dynamic filter = servletContext.addFilter("encodingFilter", CharacterEncodingFilter.class);
		filter.setInitParameter("encoding", "UTF-8");
	    //dispatcher에 의해서 추가된 Servlet에 UTF-8로 encoding하겠다는 구현부
		filter.addMappingForServletNames(null, false, "dispatcher");

	}

}
