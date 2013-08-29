package edu.nccu.floodfire.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.quartz.Scheduler;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import twitter4j.TwitterStream;
import edu.nccu.floodfire.constants.SystemConstants;
import edu.nccu.floodfire.service.ManagementService;

public class KillResultController implements Controller {
	private String viewPage;

	@SuppressWarnings("rawtypes")
	public ModelAndView handleRequest(HttpServletRequest req,
			HttpServletResponse res) throws Exception {	
		req.setCharacterEncoding("UTF-8");
		String jobSeq = req.getParameter("killJob");
		String queryFunc = req.getParameter("queryFunc");
		System.out.println("xxx::"+jobSeq+":::func::"+queryFunc);
		ApplicationContext applicationContext =WebApplicationContextUtils.getWebApplicationContext(req.getSession().getServletContext());
		
		//ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		ManagementService managementService = (ManagementService)applicationContext.getBean("managementService");
		
		Scheduler scheduler = (Scheduler)SystemConstants.SCHEDULER_POOL.get(jobSeq);
		scheduler.shutdown();
		
		if("STREAM".equals(queryFunc))
		{
			TwitterStream twitterStream = (TwitterStream)SystemConstants.STREAM_POOL.get(jobSeq);
			twitterStream.cleanUp(); // shutdown internal stream consuming thread
			twitterStream.shutdown(); // Shuts down internal dispatcher thread shared by all TwitterStream instances.
		}
		/**
		SchedulerFactory sf = new SchedulerFactory();
	    Scheduler scheduler = sf.createScheduler();
	    scheduler.stopSchedulerThread(jobSeq);
	    **/
	    
	    //update job_status
	    managementService.updateJobStatusById(jobSeq, "2");
		
	    //update token status
	    managementService.updateTokenStatusByJobSeq(jobSeq);
		
		String user = (String)req.getSession().getAttribute("user");
		List list = managementService.getJobByUserId(user);
		if(list.size()>0){
			list = getJobCollectTweetCount(list);
		};
		return new ModelAndView(viewPage,"list",list);
		
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
