package sg.com.rsin.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import sg.com.rsin.entity.TimelineDetail;

public interface TimelineDetailRepository extends JpaRepository<TimelineDetail, Long> {
	@Query("select td from TimelineDetail td, Timeline t where td.timeline.id = t.id and t.id = :id order by td.estimateDate desc")
	List<TimelineDetail> findByTimelineId(Long id);
	
	void deleteByTimelineId(Long id);
	
	@Query("SELECT td FROM TimelineDetail td WHERE td.actualDate BETWEEN :startDate AND :endDate AND result = 0")
	List<TimelineDetail> findPendingTimelineDetail(Date startDate, Date endDate);
	
	@Modifying
	@Transactional
	@Query("update TimelineDetail td set td.actualDate = td.estimateDate WHERE td.actualDate IS NULL")
	void updateActualDateNull ();
}