package edu.nccu.floodfire.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import edu.nccu.floodfire.service.MySQLTwitterStatusService;

public class QueryDataResultController implements Controller {
	private String viewPage;
	@SuppressWarnings("rawtypes")
	public ModelAndView handleRequest(HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("UTF-8");
		String userName = req.getParameter("userName");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		String keyword = req.getParameter("keyword");
		String mentionedUser = req.getParameter("mentionedUser");

		ApplicationContext applicationContext =WebApplicationContextUtils.getWebApplicationContext(req.getSession().getServletContext());	
		MySQLTwitterStatusService mySqlTwitterStatusService = (MySQLTwitterStatusService)applicationContext.getBean("mySqlTwitterStatusService");		
		List list =mySqlTwitterStatusService.getTweetsByCreateDateAndScreenNameAndKeywordAndMentionPersion(startDate, endDate, userName, keyword, mentionedUser);
		return new ModelAndView(viewPage,"list",list);
	}

	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}

}
