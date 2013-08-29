package edu.nccu.floodfire.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Queue;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import edu.nccu.floodfire.constants.SystemConstants;
import edu.nccu.floodfire.model.twitter.TweetData;

public class PreviewResultController implements Controller {
	private String viewPage;

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ModelAndView handleRequest(HttpServletRequest req,
			HttpServletResponse res) throws Exception {	
		req.setCharacterEncoding("UTF-8");
		
		String jobSeq = req.getParameter("previewJob");
		List list = new ArrayList();
		Queue queue = null;
		if (jobSeq != null) {
			queue = (Queue) SystemConstants.PREVIEW_COLLECTTWEETDATA.get(jobSeq);
			Iterator iterator =queue.iterator();
			while(iterator.hasNext())
			{
				TweetData tweetData = (TweetData)iterator.next();
				List sublist = new ArrayList();
				sublist.add(tweetData.getText());
				sublist.add(tweetData.getContributors());
				sublist.add(tweetData.getCreated_at());
				list.add(sublist);
			}
		}
		return new ModelAndView(viewPage, "list", list);
		
	}
	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}

}
