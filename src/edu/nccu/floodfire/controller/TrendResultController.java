package edu.nccu.floodfire.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import edu.nccu.floodfire.service.AnalyzeService;

public class TrendResultController implements Controller {
	private String viewPage;

	public ModelAndView handleRequest(HttpServletRequest req,
			HttpServletResponse res) throws Exception {	
		req.setCharacterEncoding("UTF-8");	
		String startDate = req.getParameter("startDate");
	    String endDate = req.getParameter("endDate");
	    String jobSeq = req.getParameter("trendJob");
	    /**
	     * 此處需針對jobSeq是否要加上user再做盤點確認
	     */
	    ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(req.getSession().getServletContext());
	    AnalyzeService analyzeService = (AnalyzeService)applicationContext.getBean("analyzeService");
	    List<?> list = analyzeService.getTrendByJobSeq(startDate, endDate ,jobSeq);
		return new ModelAndView(viewPage,"list",list);
		
		
	}
	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}

}
