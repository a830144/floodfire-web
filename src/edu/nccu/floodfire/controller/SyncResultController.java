package edu.nccu.floodfire.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

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
			return new ModelAndView(viewPage);
		
	}

	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}

}
