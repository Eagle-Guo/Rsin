package sg.com.rsin.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import sg.com.rsin.entity.PendingTimeline;

public interface PendingTimelineRepository extends JpaRepository<PendingTimeline, Long> {
	PendingTimeline findById(long id);
	//PendingTimeline findByCompanyIdAndService(long companyId, String service);
	List<PendingTimeline> findByCompany(String companyId);
}
