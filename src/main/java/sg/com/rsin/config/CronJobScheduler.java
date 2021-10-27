package sg.com.rsin.config;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import sg.com.rsin.service.PendingTimelineService;


@Component
public class CronJobScheduler {
	@Autowired
	PendingTimelineService pendingTimelineService;
	
    private static final Logger logger = LoggerFactory.getLogger(CronJobScheduler.class);
    
    // Everydate 9 AM
    @Scheduled(cron = "* * 9 * * ?") 
    //@Scheduled(cron = "0 * * * * ?")
    public void checkPendingTasks() throws Exception {
    	
    	//Update all the actual date to estimate date if empty
    	//TODO to check if need to update instead of update all
    	pendingTimelineService.updateAllEmptyActualDate();
    	
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
        Date now = new Date();
        String strDate = sdf.format(now);
        pendingTimelineService.checkAndInsertPendingTimelineForAllCompany();

        logger.info("pending task completed!");
        System.out.println("Java cron job expression:: " + strDate);
    }
}
