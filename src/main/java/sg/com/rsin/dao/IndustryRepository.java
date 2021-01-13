package sg.com.rsin.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import sg.com.rsin.entity.Industry;

public interface IndustryRepository extends JpaRepository<Industry, Long>  {
	List<Industry> findByNameENContaining(String name);
}
