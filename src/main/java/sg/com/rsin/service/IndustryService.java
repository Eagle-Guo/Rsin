package sg.com.rsin.service;

import java.util.List;

import sg.com.rsin.entity.Industry;

public interface IndustryService {
	List<Industry> getIndustryByName(String name);
	List<String> getAllIndustries();
}
