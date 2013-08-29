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

public class ManagementJobController implements Controller {
	private String viewPage;

	/**
	 * 1.點選「排定工作管理」,進入此controller
	 * 2.取得登入user所屬的job，連同job所蒐集的筆數傳回頁面
	 */
	@SuppressWarnings("rawtypes")
	public ModelAndView handleRequest(HttpServletRequest req,
			HttpServletResponse res) throws Exception {	
		req.setCharacterEncoding("UTF-8");
		ApplicationContext applicationContext =WebApplicationContextUtils.getWebApplicationContext(req.getSession().getServletContext());
		//ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		ManagementService managementService = (ManagementService) applicationContext.getBean("managementService");
		String user = (String) req.getSession().getAttribute("user");
		List list = managementService.getJobByUserId(user);
		if (list.size() > 0) {
			list = getJobCollectTweetCount(list);
		}
		return new ModelAndView(viewPage, "list", list);
		
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	private List getJobCollectTweetCount(List list)
	{
		for(int i =0 ;i<list.size();i++)
		{
			List subList = (List)list.get(i);
			String jobSeq = (String)subList.get(1);
			subList.set(7, (SystemConstants.COLLECTTWEETCOUNT.get(jobSeq)));
		}
		return list;
	}
	
	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}

}
