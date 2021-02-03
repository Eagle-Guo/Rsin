package sg.com.rsin.service.impl;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sg.com.rsin.dao.CompanyRepository;
import sg.com.rsin.dao.TimelineDetailRepository;
import sg.com.rsin.dao.TimelineRepository;
import sg.com.rsin.entity.Company;
import sg.com.rsin.entity.Timeline;
import sg.com.rsin.entity.TimelineDetail;
import sg.com.rsin.service.AdminTimelineService;

@Service
public class AdminTimeLineServiceImpl implements AdminTimelineService {

	@Autowired
	CompanyRepository companyRepository;

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
	
	public void saveCompanyFlag (Company company, String flag) {
    	if (flag == null) {
    		company.setTimelineLockFlag(false);
    	} else {
    		company.setTimelineLockFlag(true);
    	}
    	companyRepository.save(company);
	}
	
	public void saveTimelineAndDetail (Long companyId, Map<String, String> parameters) {
		parameters.forEach((k, v) -> System.out.println("Key : " + k + " --> Value : " + v));
		List <Timeline> timelines = timelineRepository.findByCompanyId(companyId);

		String timelinePeriod = parameters.get("annual_audit_service_cycle"); //12个月
		Timeline auditTimeline = timelines.stream().filter(timeline -> "年审".equals(timeline.getService())).findAny().orElse(null);
		auditTimeline.setPeriod(Integer.parseInt(timelinePeriod.substring(0, timelinePeriod.indexOf("个月"))));//12个月
		auditTimeline.setTimes(Integer.parseInt(parameters.get("annual_audit_service_times"))); //2
		auditTimeline.setStart_date(Date.valueOf(parameters.get("annual_audit_start_date")));
		timelineRepository.save(auditTimeline);

		List<TimelineDetail> timelineDetails = new ArrayList<TimelineDetail> ();

		List<String> existedList = parameters.keySet().stream().filter(x -> x.startsWith("annual_audit_plan_date_exist_")).collect(Collectors.toList());
		existedList.forEach( key -> {
			TimelineDetail timelineDetail = new TimelineDetail();
			timelineDetail.setTimeline(auditTimeline);
			String count = key.substring(key.indexOf("annual_audit_plan_date_exist_") + 29);
			String planDate = parameters.get("annual_audit_plan_date_exist_" + count);
			try {
				timelineDetail.setEstimateDate(new SimpleDateFormat("yyyy-MM-dd").parse(planDate.substring(0, 10)));
			} catch (ParseException e) {
				e.printStackTrace();
			} //2022-01-28 08:00:00.0
			timelineDetail.setActualDate(Date.valueOf(parameters.get("annual_audit_actual_date_exist_" + count))); //2021-02-04
			timelineDetail.setResult("on".equals(parameters.get("annual_audit_status_exist_" + count)) ? true:false); //on
			timelineDetail.setComment(parameters.get("annual_audit_comment_exist_" + count));
			timelineDetails.add(timelineDetail);
		});
		
		List<String> genList = parameters.keySet().stream().filter(x -> x.startsWith("annual_audit_plan_date_gen_")).collect(Collectors.toList());
		genList.forEach(key -> {
			TimelineDetail timelineDetail = new TimelineDetail();
			timelineDetail.setTimeline(auditTimeline);
			String count = key.substring(key.indexOf("annual_audit_plan_date_gen_") + 27);
			String planDate = parameters.get("annual_audit_plan_date_gen_" + count);
			try {
				timelineDetail.setEstimateDate(new SimpleDateFormat("dd/MM/yyyy").parse(planDate.substring(0, 10)));
			} catch (ParseException e) {
				e.printStackTrace();
			} //2022-01-28 08:00:00.0
			timelineDetail.setActualDate(Date.valueOf(parameters.get("annual_audit_actual_date_gen_" + count))); //2021-02-04
			timelineDetail.setResult("on".equals(parameters.get("annual_audit_status_" + count)) ? true:false); //on
			timelineDetail.setComment(parameters.get("annual_audit_comment_gen_" + count));
			timelineDetails.add(timelineDetail);
		});
		List <TimelineDetail> details = timelineDetailRepository.findByTimelineId(auditTimeline.getId());
		details.forEach(detail -> {
			timelineDetailRepository.delete(detail);
		});
		timelineDetails.forEach(detail -> {
			timelineDetailRepository.save(detail);
		});
		
	}
}
