package edu.nccu.floodfire.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import edu.nccu.floodfire.service.AnalyzeService;

public class AnalyzeByUserController implements Controller {
	private String viewPage;

	public ModelAndView handleRequest(HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		    req.setCharacterEncoding("UTF-8");
		    String startDate = req.getParameter("startDate");
		    String endDate = req.getParameter("endDate");
		    String jobSeq = req.getParameter("jobSeq");
		    ApplicationContext applicationContext =WebApplicationContextUtils.getWebApplicationContext(req.getSession().getServletContext());
		    //ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		    AnalyzeService analyzeService = (AnalyzeService)applicationContext.getBean("analyzeService");
		    List<?> list = analyzeService.getAnalyzeByUserString(startDate, endDate ,jobSeq);
			return new ModelAndView(viewPage,"list",list);
		
	}

	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}

}