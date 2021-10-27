package sg.com.rsin.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import sg.com.rsin.entity.PendingTask;

public interface PendingTaskRepository extends JpaRepository<PendingTask, Long> {
	PendingTask findById(long id);
	List<PendingTask> findByCompany(String companyId);
}
