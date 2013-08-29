package edu.nccu.floodfire.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import edu.nccu.floodfire.service.ManagementService;

public class QueryEventResultController implements Controller {
	private String viewPage;
	@SuppressWarnings("rawtypes")
	public ModelAndView handleRequest(HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("UTF-8");
		String eventName = req.getParameter("eventName");
		String eventType = req.getParameter("eventType");
		ApplicationContext applicationContext =WebApplicationContextUtils.getWebApplicationContext(req.getSession().getServletContext());
		//ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		ManagementService managementService = (ManagementService)applicationContext.getBean("managementService");		
		List list = managementService.getEventByWildCard(eventName, eventType);		
		return new ModelAndView(viewPage,"list",list);
		
	}

	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}

}
