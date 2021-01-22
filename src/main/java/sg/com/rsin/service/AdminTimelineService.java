package sg.com.rsin.service;

import java.util.List;

import sg.com.rsin.entity.Timeline;
import sg.com.rsin.entity.TimelineDetail;

public interface AdminTimelineService {
	
	public List<Timeline> getAllTimelineByCompanyId(long companyId);

	public Timeline getTimelineByServiceAndCompanyId(String service, long companyId);

	public List<TimelineDetail> getTimelineDetailByService(String service, List<Timeline> timelines);
}
