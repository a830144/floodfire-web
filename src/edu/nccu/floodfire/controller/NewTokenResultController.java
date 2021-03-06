package edu.nccu.floodfire.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import edu.nccu.floodfire.entity.Token;
import edu.nccu.floodfire.service.ManagementService;


public class NewTokenResultController implements Controller {
	private String viewPage;

	public ModelAndView handleRequest(HttpServletRequest req,
			HttpServletResponse res) throws Exception {	
		req.setCharacterEncoding("UTF-8");
		ApplicationContext applicationContext =WebApplicationContextUtils.getWebApplicationContext(req.getSession().getServletContext());
		//ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		ManagementService managementService = (ManagementService)applicationContext.getBean("managementService");
		
		Token token = new Token();
		token.setTokenId( req.getParameter("tokenId"));
		token.setTokenName(req.getParameter("tokenName"));
		token.setFrequency(req.getParameter("frequency"));
		token.setAccessToken(req.getParameter("accessToken"));
		token.setAccessTokenSecret(req.getParameter("accessTokenSecret"));
		token.setConsumerKey(req.getParameter("consumerKey"));
		token.setConsumerSecret(req.getParameter("consumerSecret"));
		token.setJobSeq(null);
		token.setLocked("0");
		
				
		String result = managementService.addToken(token);
		return new ModelAndView(viewPage,"result",result);
		
	}

	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}

}
