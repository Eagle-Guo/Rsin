package sg.com.rsin.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import sg.com.rsin.entity.PendingTimeline;

public interface PendingTimelineRepository extends JpaRepository<PendingTimeline, Long> {
	PendingTimeline findById(long id);
	//PendingTimeline findByCompanyIdAndService(long companyId, String service);
	List<PendingTimeline> findByCompany(String companyId);
	
    @Query("SELECT t FROM PendingTimeline t where t.flag = 0") 
	List<PendingTimeline> findAllPendingTimeline();
}
