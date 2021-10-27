package sg.com.rsin.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.jfree.util.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sg.com.rsin.dao.CompanyRepository;
import sg.com.rsin.dao.PendingTaskRepository;
import sg.com.rsin.dao.PendingTimelineRepository;
import sg.com.rsin.dao.TimelineDetailRepository;
import sg.com.rsin.entity.Company;
import sg.com.rsin.entity.PendingTimeline;
import sg.com.rsin.entity.TimelineDetail;
import sg.com.rsin.service.PendingTimelineService;

@Service
public class PendingTimelineServiceImpl implements PendingTimelineService {

	@Autowired
	CompanyRepository companyRepository;
	@Autowired
	TimelineDetailRepository timelineDetailRepository;
	@Autowired
	PendingTimelineRepository pendingTimelineRepository;

	public void updateAllEmptyActualDate() {
		timelineDetailRepository.updateActualDateNull();
	}
	
	public void checkAndInsertPendingTimelineForAllCompany() {
		Calendar c = Calendar.getInstance();
        c.setTime(new Date());
        c.add(Calendar.MONTH, 1);
        Log.info("after 1 month:" + c.getTime());
		List <TimelineDetail> timelineDetails = 
				timelineDetailRepository.findPendingTimelineDetail(new Date(), c.getTime());
		//List<Company> companys = companyRepository.findAll();

		Log.info("timelineDetails:" + timelineDetails.size());
		for (TimelineDetail timelineDetail: timelineDetails) {
			//TODO check if the record have generated then no need to insert again
			//pendingTimelineRepository.findb
			//if () {
				Company company = timelineDetail.getTimeline().getCompany();
				//insert the record into pending timeline table
				PendingTimeline pt = new PendingTimeline();
				pt.setComment("");
				pt.setCreatedDate(new Date());
				pt.setDueDate(timelineDetail.getActualDate());
				pt.setFlag(0);
				pt.setService(timelineDetail.getTimeline().getService());
				pt.setCompany(company);
				pendingTimelineRepository.save(pt);
			//}
			
		}

    }
	
}
