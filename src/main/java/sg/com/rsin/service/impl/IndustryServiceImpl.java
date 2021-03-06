package sg.com.rsin.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sg.com.rsin.dao.IndustryRepository;
import sg.com.rsin.entity.Industry;
import sg.com.rsin.service.IndustryService;

@Service
public class IndustryServiceImpl implements IndustryService {
	private final Logger logger = LoggerFactory.getLogger(IndustryServiceImpl.class);
	@Autowired
	IndustryRepository industryRepository;
	
	public List<Industry> getIndustryByName(String name){
		List<Industry> industries = industryRepository.findByNameENContaining(name);
		logger.info("Get industry count" + industries.size());
		return industries;
	}
	
	public List<String> getAllIndustries() {
		List<Industry> industries = (List<Industry>) industryRepository.findAll();
		List <String> names = industries.parallelStream().map(Industry::getNameEN).collect(Collectors.toList());
		
		return names;
	}
}
