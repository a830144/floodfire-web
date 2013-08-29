package edu.nccu.floodfire.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import edu.nccu.floodfire.constants.SystemConstants;
import edu.nccu.floodfire.service.ManagementService;
import edu.nccu.floodfire.service.TwitterDataService;
import edu.nccu.floodfire.util.TwitterConfiguration;

public class TestConnectionResultController implements Controller {
	private String viewPage;

	@SuppressWarnings("rawtypes")
	public ModelAndView handleRequest(HttpServletRequest req,
			HttpServletResponse res) throws Exception {	
		req.setCharacterEncoding("UTF-8");
		
		String tokenId = req.getParameter("tokenId");
		ApplicationContext applicationContext =WebApplicationContextUtils.getWebApplicationContext(req.getSession().getServletContext());
		//ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		/** todo **/
		ManagementService managementService = (ManagementService)applicationContext.getBean("managementService");
		List list =managementService.getTokenByWildCard(null, tokenId);
		List subList = (List)list.get(0);
		
		TwitterDataService twitterDataService = (TwitterDataService)applicationContext.getBean("twitterDataService");
		TwitterConfiguration twitterConfiguration = new TwitterConfiguration(""+subList.get(4),""+subList.get(5),""+subList.get(2),""+subList.get(3));
		twitterDataService.getTweetDataBySearch("test", twitterConfiguration,false);
		String text = "";
		if(SystemConstants.TEST_CONNECTION.get(""+subList.get(2))!=null)
		{
		  text = "成功 , example = " + SystemConstants.TEST_CONNECTION.get(""+subList.get(2));
		}
		else
		{
			text = "失敗!!!";
		}
		return new ModelAndView(viewPage,"text",text);
		
	}
	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}

}
