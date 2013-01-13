package i377.conf;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.DelegatingFilterProxy;
import org.springframework.web.servlet.DispatcherServlet;

public class SpringInit implements WebApplicationInitializer{

	@Override
	public void onStartup(ServletContext arg0) throws ServletException {
		
		AnnotationConfigWebApplicationContext rootContext = 
    			new AnnotationConfigWebApplicationContext();
        
    	rootContext.register(DispatcherConfig.class);


        // Create the dispatcher servlet's Spring application context
        ServletRegistration.Dynamic dispatcher = 
        		arg0.addServlet("dispatcher", new DispatcherServlet(rootContext));
        
        dispatcher.setLoadOnStartup(1);
        dispatcher.addMapping("/");


        arg0.addListener(new ContextLoaderListener(rootContext));
        
        // Spring Security
        FilterRegistration.Dynamic securityFilter = 
        		arg0.addFilter("springSecurityFilterChain", DelegatingFilterProxy.class);
		securityFilter.addMappingForUrlPatterns(null, false, "/*");

	}

}
