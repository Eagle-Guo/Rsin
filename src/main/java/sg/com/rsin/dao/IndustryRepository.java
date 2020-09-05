package sg.com.rsin.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import sg.com.rsin.entity.Industry;

public interface IndustryRepository extends CrudRepository<Industry, Long>  {
	List<Industry> findByNameENContaining(String name);
}
