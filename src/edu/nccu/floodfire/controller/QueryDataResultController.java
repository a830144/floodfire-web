package edu.nccu.floodfire.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
		Date startDate = req.getParameter("startDate")!=null? parse(""+req.getParameter("startDate")) : null;
	    Date endDate = req.getParameter("endDate")!=null? parse(""+req.getParameter("endDate")) : null;;
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
	
	private Date parse(String date)
	{
		Date todate = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			todate = sdf.parse(date);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return todate;

	}

}
