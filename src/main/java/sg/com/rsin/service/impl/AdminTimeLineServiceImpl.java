package sg.com.rsin.service.impl;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.jfree.util.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sg.com.rsin.dao.CompanyRepository;
import sg.com.rsin.dao.TimelineAdditionRepository;
import sg.com.rsin.dao.TimelineDetailRepository;
import sg.com.rsin.dao.TimelineRepository;
import sg.com.rsin.entity.Company;
import sg.com.rsin.entity.Timeline;
import sg.com.rsin.entity.TimelineAddition;
import sg.com.rsin.entity.TimelineDetail;
import sg.com.rsin.service.AdminTimelineService;
import sg.com.rsin.util.CommonUtils;

@Service
public class AdminTimeLineServiceImpl implements AdminTimelineService {

	@Autowired
	CompanyRepository companyRepository;

	@Autowired
	TimelineRepository timelineRepository;

	@Autowired
	TimelineDetailRepository timelineDetailRepository;

	@Autowired
	TimelineAdditionRepository timelineAdditionRepository;

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
	
	public void saveCompanyFlag (Long companyid, String flag) {
		Company company = companyRepository.findById(companyid).get();
    	if (flag == null || flag.equals("")) {
    		company.setTimelineLockFlag(false);
    	} else {
    		company.setTimelineLockFlag(true);
    	}
		companyRepository.save(company);
	}
	
	public void saveTimelineAndDetail (Long companyId, Map<String, String> parameters) {
		parameters.forEach((k, v) -> System.out.println("Key : " + k + " --> Value : " + v));
		List <Timeline> timelines = timelineRepository.findByCompanyId(companyId);

		// update Annual Audit
		String timelinePeriod = parameters.get("annual_audit_service_cycle"); //12个月
		Timeline auditTimeline = timelines.stream().filter(timeline -> "年审".equals(timeline.getService())).findAny().orElse(null);
		auditTimeline.setPeriod(Integer.parseInt(timelinePeriod.substring(0, timelinePeriod.indexOf("个月"))));//12个月
		auditTimeline.setTimes(Integer.parseInt(parameters.get("annual_audit_service_times"))); //2
		auditTimeline.setStartDate(Date.valueOf(parameters.get("annual_audit_start_date")));
		timelineRepository.save(auditTimeline);

		// update ECI 
		String ECITimelinePeriod = parameters.get("ECI_service_cycle"); //12个月
		Timeline ECITimeline = timelines.stream().filter(timeline -> "ECI申报".equals(timeline.getService())).findAny().orElse(null);
		ECITimeline.setPeriod(Integer.parseInt(ECITimelinePeriod.substring(0, ECITimelinePeriod.indexOf("个月"))));//12个月
		ECITimeline.setTimes(Integer.parseInt(parameters.get("ECI_service_times"))); //2
		ECITimeline.setStartDate(Date.valueOf(parameters.get("ECI_start_date")));
		timelineRepository.save(ECITimeline);

		// update GST 
		String GSTTimelinePeriod = parameters.get("GST_service_cycle"); //12个月
		Timeline GSTTimeline = timelines.stream().filter(timeline -> "消费税申报".equals(timeline.getService())).findAny().orElse(null);
		GSTTimeline.setPeriod(Integer.parseInt(GSTTimelinePeriod.substring(0, GSTTimelinePeriod.indexOf("个月"))));//12个月
		GSTTimeline.setTimes(Integer.parseInt(parameters.get("GST_service_times"))); //2
		GSTTimeline.setStartDate(Date.valueOf(parameters.get("GST_start_date")));
		timelineRepository.save(GSTTimeline);

		// update CIT 
		String CITTimelinePeriod = parameters.get("CIT_service_cycle"); //12个月
		Timeline CITTimeline = timelines.stream().filter(timeline -> "所得税报税".equals(timeline.getService())).findAny().orElse(null);
		CITTimeline.setPeriod(Integer.parseInt(CITTimelinePeriod.substring(0, CITTimelinePeriod.indexOf("个月"))));//12个月
		CITTimeline.setTimes(Integer.parseInt(parameters.get("CIT_service_times"))); //2
		CITTimeline.setStartDate(Date.valueOf(parameters.get("CIT_start_date")));
		timelineRepository.save(CITTimeline);

		// update CIT_payment 
		String CITPaymentTimelinePeriod = parameters.get("CIT_payment_service_cycle"); //12个月
		Timeline CITPaymentTimeline = timelines.stream().filter(timeline -> "所得税缴税".equals(timeline.getService())).findAny().orElse(null);
		CITPaymentTimeline.setPeriod(Integer.parseInt(CITPaymentTimelinePeriod.substring(0, CITPaymentTimelinePeriod.indexOf("个月"))));//12个月
		CITPaymentTimeline.setTimes(Integer.parseInt(parameters.get("CIT_payment_service_times"))); //2
		CITPaymentTimeline.setStartDate(Date.valueOf(parameters.get("CIT_payment_start_date")));
		timelineRepository.save(CITPaymentTimeline);

		//Save to timeline detail tables
		List<TimelineDetail> timelineDetails = new ArrayList<TimelineDetail> ();

		List<String> existedList = parameters.keySet().stream().filter(x -> x.startsWith("annual_audit_plan_date_exist_")).collect(Collectors.toList());
		existedList.forEach( key -> {
			TimelineDetail timelineDetail = new TimelineDetail();
			timelineDetail.setTimeline(auditTimeline);
			String count = key.substring(key.indexOf("annual_audit_plan_date_exist_") + 29);
			String planDate = parameters.get("annual_audit_plan_date_exist_" + count);
			String actualDate = parameters.get("annual_audit_actual_date_exist_" + count);
			try {
				timelineDetail.setEstimateDate(new SimpleDateFormat("yyyy-MM-dd").parse(planDate.substring(0, 10)));
				timelineDetail.setActualDate(new SimpleDateFormat("yyyy-MM-dd").parse(actualDate.substring(0, 10))); //2021-02-04
			} catch (ParseException e) {
				Log.error(planDate + "-->" + actualDate);
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			} //2022-01-28 08:00:00.0
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
			String actualDate = parameters.get("annual_audit_actual_date_gen_" + count);
			try {
				timelineDetail.setEstimateDate(new SimpleDateFormat("dd/MM/yyyy").parse(planDate.substring(0, 10)));
				timelineDetail.setActualDate(new SimpleDateFormat("dd/MM/yyyy").parse(actualDate.substring(0, 10))); //2021-02-04
			} catch (ParseException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			} //2022-01-28 08:00:00.0
			timelineDetail.setResult("on".equals(parameters.get("annual_audit_status_" + count)) ? true:false); //on
			timelineDetail.setComment(parameters.get("annual_audit_comment_gen_" + count));
			timelineDetails.add(timelineDetail);
		});

		//ECI
		existedList = parameters.keySet().stream().filter(x -> x.startsWith("ECI_plan_date_exist_")).collect(Collectors.toList());
		existedList.forEach( key -> {
			TimelineDetail timelineDetail = new TimelineDetail();
			timelineDetail.setTimeline(ECITimeline);
			String count = key.substring(key.indexOf("ECI_plan_date_exist_") + 20);
			String planDate = parameters.get("ECI_plan_date_exist_" + count);
			String actualDate = parameters.get("ECI_actual_date_exist_" + count);
			try {
				timelineDetail.setEstimateDate(new SimpleDateFormat("yyyy-MM-dd").parse(planDate.substring(0, 10)));
				timelineDetail.setActualDate(new SimpleDateFormat("yyyy-MM-dd").parse(actualDate.substring(0, 10))); //2021-02-04
			} catch (ParseException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			} //2022-01-28 08:00:00.0
			timelineDetail.setResult("on".equals(parameters.get("ECI_status_exist_" + count)) ? true:false); //on
			timelineDetail.setComment(parameters.get("ECI_comment_exist_" + count));
			timelineDetails.add(timelineDetail);
		});
		genList = parameters.keySet().stream().filter(x -> x.startsWith("ECI_plan_date_gen_")).collect(Collectors.toList());
		genList.forEach(key -> {
			TimelineDetail timelineDetail = new TimelineDetail();
			timelineDetail.setTimeline(ECITimeline);
			String count = key.substring(key.indexOf("ECI_plan_date_gen_") + 18);
			String planDate = parameters.get("ECI_plan_date_gen_" + count);
			String actualDate = parameters.get("ECI_actual_date_gen_" + count);
			try {
				timelineDetail.setEstimateDate(new SimpleDateFormat("dd/MM/yyyy").parse(planDate.substring(0, 10)));
				timelineDetail.setActualDate(new SimpleDateFormat("dd/MM/yyyy").parse(actualDate.substring(0, 10))); //2021-02-04
			} catch (ParseException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			} //2022-01-28 08:00:00.0
			timelineDetail.setResult("on".equals(parameters.get("ECI_status_" + count)) ? true:false); //on
			timelineDetail.setComment(parameters.get("ECI_comment_gen_" + count));
			timelineDetails.add(timelineDetail);
		});

		//GST
		existedList = parameters.keySet().stream().filter(x -> x.startsWith("GST_plan_date_exist_")).collect(Collectors.toList());
		existedList.forEach( key -> {
			TimelineDetail timelineDetail = new TimelineDetail();
			timelineDetail.setTimeline(GSTTimeline);
			String count = key.substring(key.indexOf("GST_plan_date_exist_") + 20);
			String planDate = parameters.get("GST_plan_date_exist_" + count);
			String actualDate = parameters.get("GST_actual_date_exist_" + count);
			try {
				timelineDetail.setEstimateDate(new SimpleDateFormat("yyyy-MM-dd").parse(planDate.substring(0, 10)));
				timelineDetail.setActualDate(new SimpleDateFormat("yyyy-MM-dd").parse(actualDate.substring(0, 10))); //2021-02-04
			} catch (ParseException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}//2022-01-28 08:00:00.0
			timelineDetail.setResult("on".equals(parameters.get("GST_status_exist_" + count)) ? true:false); //on
			timelineDetail.setComment(parameters.get("GST_comment_exist_" + count));
			timelineDetails.add(timelineDetail);
		});
		genList = parameters.keySet().stream().filter(x -> x.startsWith("GST_plan_date_gen_")).collect(Collectors.toList());
		genList.forEach(key -> {
			TimelineDetail timelineDetail = new TimelineDetail();
			timelineDetail.setTimeline(GSTTimeline);
			String count = key.substring(key.indexOf("GST_plan_date_gen_") + 18);
			String planDate = parameters.get("GST_plan_date_gen_" + count);
			String actualDate = parameters.get("GST_actual_date_gen_" + count);
			try {
				timelineDetail.setEstimateDate(new SimpleDateFormat("dd/MM/yyyy").parse(planDate.substring(0, 10)));
				timelineDetail.setActualDate(new SimpleDateFormat("dd/MM/yyyy").parse(actualDate.substring(0, 10))); //2021-02-04
			} catch (ParseException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			} //2022-01-28 08:00:00.0
			timelineDetail.setResult("on".equals(parameters.get("GST_status_" + count)) ? true:false); //on
			timelineDetail.setComment(parameters.get("GST_comment_gen_" + count));
			timelineDetails.add(timelineDetail);
		});
		
		//CIT
		existedList = parameters.keySet().stream().filter(x -> x.startsWith("CIT_plan_date_exist_")).collect(Collectors.toList());
		existedList.forEach( key -> {
			TimelineDetail timelineDetail = new TimelineDetail();
			timelineDetail.setTimeline(CITTimeline);
			String count = key.substring(key.indexOf("CIT_plan_date_exist_") + 20);
			String planDate = parameters.get("CIT_plan_date_exist_" + count);
			String actualDate = parameters.get("CIT_actual_date_exist_" + count);
			try {
				timelineDetail.setEstimateDate(new SimpleDateFormat("yyyy-MM-dd").parse(planDate.substring(0, 10)));
				timelineDetail.setActualDate(new SimpleDateFormat("yyyy-MM-dd").parse(actualDate.substring(0, 10))); //2021-02-04
			} catch (ParseException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			} //2022-01-28 08:00:00.0
			timelineDetail.setResult("on".equals(parameters.get("CIT_status_exist_" + count)) ? true:false); //on
			timelineDetail.setComment(parameters.get("CIT_comment_exist_" + count));
			timelineDetails.add(timelineDetail);
		});
		genList = parameters.keySet().stream().filter(x -> x.startsWith("CIT_plan_date_gen_")).collect(Collectors.toList());
		genList.forEach(key -> {
			TimelineDetail timelineDetail = new TimelineDetail();
			timelineDetail.setTimeline(CITTimeline);
			String count = key.substring(key.indexOf("CIT_plan_date_gen_") + 18);
			String planDate = parameters.get("CIT_plan_date_gen_" + count);
			String actualDate = parameters.get("CIT_actual_date_gen_" + count);
			try {
				timelineDetail.setEstimateDate(new SimpleDateFormat("dd/MM/yyyy").parse(planDate.substring(0, 10)));
				timelineDetail.setActualDate(new SimpleDateFormat("dd/MM/yyyy").parse(actualDate.substring(0, 10))); //2021-02-04
			} catch (ParseException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			} //2022-01-28 08:00:00.0
			timelineDetail.setResult("on".equals(parameters.get("CIT_status_" + count)) ? true:false); //on
			timelineDetail.setComment(parameters.get("CIT_comment_gen_" + count));
			timelineDetails.add(timelineDetail);
		});
		
		//CIT_payment
		existedList = parameters.keySet().stream().filter(x -> x.startsWith("CIT_payment_plan_date_exist_")).collect(Collectors.toList());
		existedList.forEach( key -> {
			TimelineDetail timelineDetail = new TimelineDetail();
			timelineDetail.setTimeline(CITPaymentTimeline);
			String count = key.substring(key.indexOf("CIT_payment_plan_date_exist_") + 28);
			String planDate = parameters.get("CIT_payment_plan_date_exist_" + count);
			String actualDate = parameters.get("CIT_payment_actual_date_exist_" + count);
			try {
				timelineDetail.setEstimateDate(new SimpleDateFormat("yyyy-MM-dd").parse(planDate.substring(0, 10)));
				timelineDetail.setActualDate(new SimpleDateFormat("yyyy-MM-dd").parse(actualDate.substring(0, 10))); //2021-02-04
			} catch (ParseException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			} //2022-01-28 08:00:00.0
			timelineDetail.setResult("on".equals(parameters.get("CIT_payment_status_exist_" + count)) ? true:false); //on
			timelineDetail.setComment(parameters.get("CIT_payment_comment_exist_" + count));
			timelineDetails.add(timelineDetail);
		});
		genList = parameters.keySet().stream().filter(x -> x.startsWith("CIT_payment_plan_date_gen_")).collect(Collectors.toList());
		genList.forEach(key -> {
			TimelineDetail timelineDetail = new TimelineDetail();
			timelineDetail.setTimeline(CITPaymentTimeline);
			String count = key.substring(key.indexOf("CIT_payment_plan_date_gen_") + 26);
			String planDate = parameters.get("CIT_payment_plan_date_gen_" + count);
			String actualDate = parameters.get("CIT_payment_actual_date_gen_" + count);
			try {
				timelineDetail.setEstimateDate(new SimpleDateFormat("dd/MM/yyyy").parse(planDate.substring(0, 10)));
				timelineDetail.setActualDate(new SimpleDateFormat("dd/MM/yyyy").parse(actualDate.substring(0, 10))); //2021-02-04
			} catch (ParseException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			} //2022-01-28 08:00:00.0
			timelineDetail.setResult("on".equals(parameters.get("CIT_payment_status_" + count)) ? true:false); //on
			timelineDetail.setComment(parameters.get("CIT_payment_comment_gen_" + count));
			timelineDetails.add(timelineDetail);
		});


		//New Service
		genList = parameters.keySet().stream().filter(x -> x.startsWith("new_service_name_")).collect(Collectors.toList());
		Company company  = companyRepository.findById(companyId).get();
		for (int i=1; i<=genList.size(); i++) {
			String service = parameters.get("new_service_name_"+i);
			Timeline timeline = timelineRepository.findByServiceAndCompanyId(service, companyId);
			if (timeline == null) {
				timeline = new Timeline();
				timeline.setService(parameters.get("new_service_name_"+i));
			}
			
			timeline.setComment(parameters.get("new_service_comment_"+i));
			String newserviceCycle = parameters.get("new_service_cycle_"+i); //12个月
			timeline.setPeriod(newserviceCycle!=null? Integer.parseInt(newserviceCycle.substring(0, newserviceCycle.length()-2)) : 0);
			String newserviceTimes = parameters.get("new_service_times_"+i);
			timeline.setTimes(newserviceTimes!=null? Integer.parseInt(newserviceTimes) : 0);
			String newserviceStartDate = parameters.get("new_service_start_date_"+i);
			try {
				timeline.setStartDate(newserviceStartDate!=null? new SimpleDateFormat("yyyy-MM-dd").parse(newserviceStartDate.substring(0, 10)) : null );
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			timeline.setCompany(company);
			timelineRepository.save(timeline);
			
			// save to timeline detail
			timelineDetailRepository.deleteAll(timelineDetailRepository.findByTimelineId(timeline.getId()));
			
			List<String> newServideDetail = parameters.keySet().stream().filter(x -> x.startsWith("new_service_plan_date_gen")).collect(Collectors.toList());
			for (int j=0; j<newServideDetail.size(); j++) {
				TimelineDetail timelineDetail =  new TimelineDetail();
				try {
					String newservicePlanDate = parameters.get("new_service_plan_date_gen_" + i + "_" +j);
					timelineDetail.setEstimateDate(newservicePlanDate!=null? new SimpleDateFormat("yyyy-MM-dd").parse(newservicePlanDate.substring(0, 10)):null);
					String newserviceaActualDate = parameters.get("new_service_actual_date_gen_" + i + "_" +j);
					timelineDetail.setActualDate(newserviceaActualDate!=null? new SimpleDateFormat("yyyy-MM-dd").parse(newserviceaActualDate.substring(0, 10)):null);
				} catch (Exception ex) {
					ex.printStackTrace();
				}
				timelineDetail.setComment(parameters.get("new_service_comment_gen_"+j));
				String status = parameters.get("new_service_status_gen_"+j);
				timelineDetail.setResult(status !=null && status.equals("on")? true: false);
				timelineDetail.setTimeline(timeline);
				timelineDetailRepository.save(timelineDetail);
			}
		}
		
		//Update new service 
		genList = parameters.keySet().stream().filter(x -> x.endsWith("_service")).collect(Collectors.toList());
		company  = companyRepository.findById(companyId).get();
		for (int i=0; i<genList.size(); i++) {
			String serviceParameter = genList.get(i);
			String service = serviceParameter.substring(0, serviceParameter.indexOf("_service"));
			String servicename = parameters.get(serviceParameter);
			Timeline timeline = timelineRepository.findByServiceAndCompanyId(service, companyId);
			if (timeline == null) {
				timeline = new Timeline();
				timeline.setService(parameters.get(service));
			}
			timeline.setService(servicename);
			timeline.setComment(parameters.get(service + "_comment"));
			String newserviceCycle = parameters.get(service + "_service_cycle"); //12个月
			timeline.setPeriod(newserviceCycle!=null? Integer.parseInt(newserviceCycle.substring(0, newserviceCycle.length()-2)) : 0);
			String newserviceTimes = parameters.get(service + "_service_times");
			timeline.setTimes(newserviceTimes!=null? Integer.parseInt(newserviceTimes) : 0);
			String newserviceStartDate = parameters.get(service + "_start_date");
			try {
				timeline.setStartDate(newserviceStartDate!=null? new SimpleDateFormat("yyyy-MM-dd").parse(newserviceStartDate.substring(0, 10)) : null );
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			timeline.setCompany(company);
			timelineRepository.save(timeline);
			
			//TODO for the existed record. need to copy into list first then remove all and insert again
			// save to timeline detail
			timelineDetailRepository.deleteAll(timelineDetailRepository.findByTimelineId(timeline.getId()));
			
			List<String> newServideDetail = parameters.keySet().stream().filter(x -> x.startsWith(service + "_actual_date_gen") ||
				x.startsWith(service + "_actual_date_exist")).collect(Collectors.toList());
			for (int j=0; j<newServideDetail.size(); j++) {
				String newService = newServideDetail.get(j);
				String dbNumber = newService.substring(newService.lastIndexOf('_',newService.lastIndexOf('_')-1)+1);//exist_975
				TimelineDetail timelineDetail = new TimelineDetail();
				try {
					String newserviceaActualDate = parameters.get(newService);
					timelineDetail.setActualDate(newserviceaActualDate!=null? new SimpleDateFormat("yyyy-MM-dd").parse(newserviceaActualDate.substring(0, 10)):null);
					String newservicePlanDate = parameters.get(service + "_plan_date_"+dbNumber);
					timelineDetail.setEstimateDate(newservicePlanDate!=null? new SimpleDateFormat("yyyy-MM-dd").parse(newservicePlanDate.substring(0, 10)):null);
					
					//newservicePlanDate = parameters.get(newService);
					//timelineDetail.setEstimateDate(newservicePlanDate!=null? new SimpleDateFormat("yyyy-MM-dd").parse(newservicePlanDate.substring(0, 10)):null);
					
					//String newserviceaActualDate = parameters.get(service + "_actual_date_gen_"+j);
					//timelineDetail.setActualDate(newserviceaActualDate!=null? new SimpleDateFormat("yyyy-MM-dd").parse(newserviceaActualDate.substring(0, 10)):null);
				} catch (Exception ex) {
					ex.printStackTrace();
				}
				timelineDetail.setComment(parameters.get(service + "_comment_"+dbNumber));
				String status = parameters.get(service + "_status_"+dbNumber);
				timelineDetail.setResult(status !=null && status.equals("on")? true: false);
				timelineDetail.setTimeline(timeline);
				timelineDetailRepository.save(timelineDetail);
			}
		}
		
		
		List <TimelineDetail> details = timelineDetailRepository.findByTimelineId(auditTimeline.getId());
		details.addAll(timelineDetailRepository.findByTimelineId(ECITimeline.getId()));
		details.addAll(timelineDetailRepository.findByTimelineId(GSTTimeline.getId()));
		details.addAll(timelineDetailRepository.findByTimelineId(CITTimeline.getId()));
		details.addAll(timelineDetailRepository.findByTimelineId(CITPaymentTimeline.getId()));

		// Remove all the timeline detail record under this company
		details.forEach(detail -> {
			timelineDetailRepository.delete(detail);
		});

		// Save all timeline detail data record
		timelineDetails.forEach(detail -> {
			timelineDetailRepository.save(detail);
		});
	}

	public void saveTimelineAddition (Long companyId, Map<String, String> parameters) {
		
		TimelineAddition timelineAddition = timelineAdditionRepository.findByCompanyId(companyId);

		if (timelineAddition == null) {
			timelineAddition = new TimelineAddition();
			timelineAddition.setCompany(companyRepository.findById(companyId).get());
		}
		String serviceProgress = parameters.get("textarea1");
		String channel = parameters.get("textarea2");
		String lockFlag = parameters.get("lockflag");

        if (serviceProgress != null) {
        	timelineAddition.setServiceProgress(serviceProgress);

        	if ("true".equals(lockFlag)) {
        		timelineAddition.setServiceFlag(true);
        	} else {
        		timelineAddition.setServiceFlag(false);
        	}
        } else if (channel !=  null) {
        	timelineAddition.setChannel(channel);
        	if ("true".equals(lockFlag)) {
        		timelineAddition.setChannelFlag(true);
        	} else {
        		timelineAddition.setChannelFlag(false);
        	}
        } else {
        	timelineAddition.setServiceFlag(false);
        	timelineAddition.setChannelFlag(false);
        }
        
    	timelineAdditionRepository.save(timelineAddition);
	}
	
	public TimelineAddition getTimelineAdditionByCompanyId(long companyId) {
		TimelineAddition timelineAddition = timelineAdditionRepository.findByCompanyId(companyId);
		return timelineAddition;
	}

	public List <Timeline> getOthersTimeline (List<Timeline> timelines) {
		List <Timeline> newServices = new ArrayList<Timeline>();
		timelines.forEach(timeline -> {
			if (!CommonUtils.timeLineTypeContains(timeline.getService())) {
				newServices.add(timeline);
			}
		});

		return newServices;
	}

	public List<TimelineDetail> getOthersTimelineDetail(List<Timeline> timelines) {
		List <TimelineDetail> timelineDetails = new ArrayList<TimelineDetail>();
		
		timelines.stream().forEach(timeline -> {
			timelineDetails.addAll(timelineDetailRepository.findByTimelineId(timeline.getId()));
		});

		return timelineDetails;
	}
}
