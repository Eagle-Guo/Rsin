package sg.com.rsin.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import sg.com.rsin.entity.CompanyShareholderInfo;

public interface CompanyShareholderInfoRepository extends CrudRepository<CompanyShareholderInfo, Long> {
	CompanyShareholderInfo findById(long id);
	List<CompanyShareholderInfo> findByName(String name);
	List<CompanyShareholderInfo> findByDescription (String description);
}