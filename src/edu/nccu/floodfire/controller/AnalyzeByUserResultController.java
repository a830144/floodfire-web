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

import edu.nccu.floodfire.service.AnalyzeService;

public class AnalyzeByUserResultController implements Controller {
	private String viewPage;

	public ModelAndView handleRequest(HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		    System.out.println("Here is the report begin");
		    req.setCharacterEncoding("UTF-8");
		    Date startDate = req.getParameter("startDate")!=null && !"".equals(req.getParameter("startDate"))? parse(""+req.getParameter("startDate")) : null;
		    Date endDate = req.getParameter("endDate")!=null && !"".equals(req.getParameter("endDate"))? parse(""+req.getParameter("endDate")) : null;
		    String jobSeq = req.getParameter("jobSeq");
		    System.out.println(startDate +";"+endDate+";"+jobSeq);
		    ApplicationContext applicationContext =WebApplicationContextUtils.getWebApplicationContext(req.getSession().getServletContext());

		    AnalyzeService analyzeService = (AnalyzeService)applicationContext.getBean("analyzeService");
		    System.out.println(analyzeService);
		    List<?> list = analyzeService.getAnalyzeByUserString(startDate, endDate ,jobSeq);
		    System.out.println(list.size());
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
