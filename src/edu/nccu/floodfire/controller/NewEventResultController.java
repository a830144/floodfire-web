package edu.nccu.floodfire.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import edu.nccu.floodfire.entity.Event;
import edu.nccu.floodfire.service.ManagementService;


public class NewEventResultController implements Controller {
	private String viewPage;

	public ModelAndView handleRequest(HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("UTF-8");
		ApplicationContext applicationContext =WebApplicationContextUtils.getWebApplicationContext(req.getSession().getServletContext());
		//ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		ManagementService managementService = (ManagementService) applicationContext
				.getBean("managementService");
		
		String eventName = req.getParameter("eventName");
		String eventType = req.getParameter("eventType");
		Event event = new Event();
		event.setEventName(eventName);
		event.setEventType(eventType);
		String result = managementService.addEvent(event);
		return new ModelAndView(viewPage, "result", result);

	}

	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}

}
