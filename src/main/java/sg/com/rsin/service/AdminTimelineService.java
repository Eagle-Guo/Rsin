package sg.com.rsin.service;

import java.util.List;
import java.util.Map;

import sg.com.rsin.entity.Company;
import sg.com.rsin.entity.Timeline;
import sg.com.rsin.entity.TimelineDetail;

public interface AdminTimelineService {

	public List<Timeline> getAllTimelineByCompanyId(long companyId);

	public Timeline getTimelineByServiceAndCompanyId(String service, long companyId);

	public List<TimelineDetail> getTimelineDetailByService(String service, List<Timeline> timelines);

	public void saveCompanyFlag (Company company, String flag);

	public void saveTimelineAndDetail (Long companyId, Map<String, String> parameters);

	public void saveTimelineAddtion (Long companyId, Map<String, String> parameters);
}
