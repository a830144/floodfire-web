package edu.nccu.floodfire.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import edu.nccu.floodfire.service.MySQLTwitterStatusService;

public class SyncResultController implements Controller {
	private String viewPage;


	public ModelAndView handleRequest(HttpServletRequest req,
			HttpServletResponse res) throws Exception {	
		req.setCharacterEncoding("UTF-8");
		/**
		String syncFunc = req.getParameter("syncFUNC");
		SchedulerFactory sf = new SchedulerFactory();
	    Scheduler scheduler = sf.createScheduler();
	    
		
		Trigger trigger = new SimpleTrigger();
		Map<String, String> map = new HashMap<String, String>();
        map.put("syncFunc", syncFunc);
		JobExecutionContext jc = new JobExecutionContext(map);
	    WorkJob myJob = new SyncJob(jc);			   
		
		String jobSeq = "temp";
		scheduler.createSchedulerThread(jobSeq, trigger, myJob);
		**/
		String function = req.getParameter("function");
		Date startDate = req.getParameter("startDate")!=null? parse(""+req.getParameter("startDate")) : null;
	    Date endDate = req.getParameter("endDate")!=null? parse(""+req.getParameter("endDate")) : null;;
		String fileName = req.getParameter("fileName");
		ApplicationContext applicationContext =WebApplicationContextUtils.getWebApplicationContext(req.getSession().getServletContext());	
		MySQLTwitterStatusService mySqlTwitterStatusService = (MySQLTwitterStatusService)applicationContext.getBean("mySqlTwitterStatusService");		
		if("export".equals(function))
		{
			mySqlTwitterStatusService.exportTweetData(startDate, endDate, fileName);
		}
		
		
		return new ModelAndView(viewPage);
		
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
