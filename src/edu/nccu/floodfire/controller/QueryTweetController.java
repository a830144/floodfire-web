package edu.nccu.floodfire.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import edu.nccu.floodfire.service.ManagementService;

public class QueryTweetController implements Controller {
	private String viewPage;

	/**
	 * 1.在[設定Tweet資料蒐集功能]中，針對某個事件取得，按下[新增工作]，會進入到此controller
	 * 2.此controller會計算現有還有多少token可用，並顯示於queryTweeet.jsp
	 */
	@SuppressWarnings("rawtypes")
	public ModelAndView handleRequest(HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("UTF-8");
		ApplicationContext applicationContext =WebApplicationContextUtils.getWebApplicationContext(req.getSession().getServletContext());
		//ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		ManagementService managementService = (ManagementService)applicationContext.getBean("managementService");
		List<?> list = managementService.queryAllToken();
		int tokenUsable =0;
		for(int i=0;i<list.size();i++)
		{
			List sublist = (List)list.get(i);
			if("0".equals(sublist.get(2)))
			{
				tokenUsable ++;
			}
		}
				
		return new ModelAndView(viewPage,"tokenUsable",tokenUsable);
	}

	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}

}
