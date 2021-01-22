package sg.com.rsin.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import sg.com.rsin.entity.TimelineDetail;

public interface TimelineDetailRepository extends JpaRepository<TimelineDetail, Long> {
	@Query("select td from TimelineDetail td, Timeline t where td.timeline.id = t.id and t.id = :id")
	List<TimelineDetail> findByTimelineId(Long id);
}