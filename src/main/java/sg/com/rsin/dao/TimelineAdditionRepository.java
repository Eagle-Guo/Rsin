package sg.com.rsin.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import sg.com.rsin.entity.TimelineAddition;

public interface TimelineAdditionRepository extends JpaRepository<TimelineAddition, Long> {

	@Query("select t from TimelineAddition t, Company c where c.id = t.company.id and c.id = :id")
	TimelineAddition findByCompanyId(@Param("id") long id);

}