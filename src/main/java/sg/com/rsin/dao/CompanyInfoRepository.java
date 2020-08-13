package sg.com.rsin.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import sg.com.rsin.entity.CompanyInfo;

public interface CompanyInfoRepository extends CrudRepository<CompanyInfo, Long> {
	CompanyInfo findById(long id);
	List<CompanyInfo> findByName(String name);
	
}