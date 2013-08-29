package edu.nccu.floodfire.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import edu.nccu.floodfire.service.ManagementService;

public class MainController implements Controller {
	private String viewPage;

	public ModelAndView handleRequest(HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("UTF-8");
		String user = req.getParameter("account");
		String password = req.getParameter("password");
		
		ApplicationContext applicationContext =WebApplicationContextUtils.getWebApplicationContext(req.getSession().getServletContext());
		//ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		ManagementService managementService = (ManagementService)applicationContext.getBean("managementService");
		boolean isPasswdTrue = managementService.isPasswdTrue(user, password);
		if(isPasswdTrue)
		{
			setViewPage("main");
			req.getSession().setAttribute("user", user);
			return new ModelAndView(viewPage, "user", user);
		}
		else
		{
			setViewPage("indexRetry");
			return new ModelAndView(viewPage);
		}
	}

	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}

}
