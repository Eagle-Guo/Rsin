package sg.com.rsin.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import sg.com.rsin.entity.Timeline;

public interface TimelineRepository extends JpaRepository<Timeline, Long> {
	@Query("select t from Timeline t, Company c where c.id = t.company.id and c.id = :id order by t.id desc")
	List<Timeline> findByCompanyId(@Param("id") long id);
	
	@Query("select t from Timeline t, Company c where c.id = t.company.id and t.service = :service and c.id = :id")
	Timeline findByServiceAndCompanyId(@Param("service") String service, @Param("id") long id);
}