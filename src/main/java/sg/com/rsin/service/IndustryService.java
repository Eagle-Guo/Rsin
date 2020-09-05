package sg.com.rsin.service;

import java.util.List;

import sg.com.rsin.entity.Industry;

public interface IndustryService {
	List<String> getIndustryByName(String name);
	List<String> getAllIndustries();
}
