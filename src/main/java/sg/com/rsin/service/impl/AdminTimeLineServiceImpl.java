package sg.com.rsin.service.impl;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sg.com.rsin.dao.TimelineDetailRepository;
import sg.com.rsin.dao.TimelineRepository;
import sg.com.rsin.entity.Timeline;
import sg.com.rsin.entity.TimelineDetail;
import sg.com.rsin.service.AdminTimelineService;

@Service
public class AdminTimeLineServiceImpl implements AdminTimelineService {

	@Autowired
	TimelineRepository timelineRepository;
	
	@Autowired
	TimelineDetailRepository timelineDetailRepository;
	
	public List<Timeline> getAllTimelineByCompanyId(long companyId) {
		List<Timeline> timelines = timelineRepository.findByCompanyId(companyId);
		return timelines;
	}
	
	public Timeline getTimelineByServiceAndCompanyId(String service, long companyId) {
		Timeline timeline = timelineRepository.findByServiceAndCompanyId(service, companyId);
		return timeline;
	}
	
	public List<TimelineDetail> getTimelineDetailByService(String service, List<Timeline> timelines) {
		List<TimelineDetail> timelineDetails = new ArrayList<TimelineDetail>() ;
		timelines.forEach(timeline -> {
			if (service.equalsIgnoreCase(timeline.getService())) {
				timelineDetails.addAll(timelineDetailRepository.findByTimelineId(timeline.getId()));
			}
		});
		return timelineDetails;
	}
	
}
