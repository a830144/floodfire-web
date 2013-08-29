package edu.nccu.floodfire.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import edu.nccu.floodfire.service.ManagementService;

public class AnalyzeMainContentController implements Controller {
	private String viewPage;

	public ModelAndView handleRequest(HttpServletRequest req,
			HttpServletResponse res) throws Exception {	
		req.setCharacterEncoding("UTF-8");
		ApplicationContext applicationContext =WebApplicationContextUtils.getWebApplicationContext(req.getSession().getServletContext());
		//ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		ManagementService managementService = (ManagementService)applicationContext.getBean("managementService");
		String user = (String)req.getSession().getAttribute("user");
		@SuppressWarnings("rawtypes")
		List list = managementService.getJobByUserId(user);
		return new ModelAndView(viewPage,"list",list);
		
	}

	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}

}
