package edu.nccu.floodfire.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class TrendController implements Controller {
	private String viewPage;

	public ModelAndView handleRequest(HttpServletRequest req,
			HttpServletResponse res) throws Exception {	
		req.setCharacterEncoding("UTF-8");		
		return new ModelAndView(viewPage);
		
	}
	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}

}
