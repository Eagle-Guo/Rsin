package sg.com.rsin.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.jfree.util.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sg.com.rsin.dao.CompanyShareholderInfoRepository;
import sg.com.rsin.dao.DocumentHistoryRepository;
import sg.com.rsin.dao.DocumentRepository;
import sg.com.rsin.entity.CompanyShareholderInfo;
import sg.com.rsin.entity.Document;
import sg.com.rsin.entity.DocumentHistory;
import sg.com.rsin.service.AdminManageCompanyService;

@Service
public class AdminManageCompanyServiceImpl implements AdminManageCompanyService {

	@Autowired
	CompanyShareholderInfoRepository companyShareholderInfoRepository;

	@Autowired
	DocumentRepository documentRepository;
	
	@Autowired
	DocumentHistoryRepository documentHistoryRepository;

	@Override
	public List<String> getShareholders(Long companyId) {
		List<CompanyShareholderInfo> companyShareholderInfos = companyShareholderInfoRepository.findByCompanyId(companyId);
		List<String> name = companyShareholderInfos.stream().filter(shareholder -> shareholder.getPositionType().contains("股东")).map(CompanyShareholderInfo::getName).collect(Collectors.toList());
		return name;
	}
	
	@Override
	public List<CompanyShareholderInfo> getCompanyShareholders(Long companyId) {
		List<CompanyShareholderInfo> companyShareholderInfos = companyShareholderInfoRepository.findByCompanyId(companyId);
		return companyShareholderInfos;
	}

	@Override
	public List<String> getDirectors(Long companyId) {
		try {
			List<CompanyShareholderInfo> companyShareholderInfos = companyShareholderInfoRepository.findByCompanyId(companyId);
			List<String> name = companyShareholderInfos.stream().filter(shareholder -> shareholder.getPositionType().contains("董事")).map(CompanyShareholderInfo::getName).collect(Collectors.toList());
			return name;
		} catch (Exception ex) {
			Log.error("Getting shareholder info error: " + ex.getMessage());
		}
		return new ArrayList<String>();
	}

	@Override
	public List<Document> getCompanyDocumentList(Long companyId) {
		List<Document> documents = documentRepository.findByCompanyIdAndCategoryOrderByDisplaySequenceAsc(companyId, "C");
		return documents;
	}

	@Override
	public Map<String, List<DocumentHistory>> getCompanyDocumentListWithDetail(Long companyId) {
		List<Document> documents = documentRepository.findByCompanyIdAndCategoryOrderByDisplaySequenceAsc(companyId, "C");
		Map<String, List<DocumentHistory>> fileMap = new LinkedHashMap<String, List<DocumentHistory>>();
		documents.stream().forEach(doc -> {
			String type = doc.getDocumentType().getDocumentTypeCode();
			//String desc = doc.getDocumentDesc() + ((doc.getDocumentDesccn() == null || "".equals(doc.getDocumentDesccn())) ? "" : " (" + doc.getDocumentDesccn() + ")");
			List<DocumentHistory> hiss = documentHistoryRepository.findByDocumentIdOrderByIdDesc(doc.getId());
			fileMap.put(type, hiss);
		});
		
		return fileMap;
	}
	
	@Override
	public List<Document> getPersonalDocumentList(Long companyId) {
		List<Document> documents = documentRepository.findByCompanyIdAndCategoryOrderByDisplaySequenceAsc(companyId, "P");
		return documents;
	}

	@Override
	public Map<String, List<DocumentHistory>> getPersonalDocumentListWithDetail(Long companyId) {
		List<Document> documents = documentRepository.findByCompanyIdAndCategoryOrderByDisplaySequenceAsc(companyId, "P");
		Map<String, List<DocumentHistory>> fileMap = new LinkedHashMap<String, List<DocumentHistory>>();
		documents.stream().forEach(doc -> {
			String type = doc.getDocumentType().getDocumentTypeCode();
			//String desc = doc.getDocumentDesc() + ((doc.getDocumentDesccn() == null || "".equals(doc.getDocumentDesccn())) ? "" : " (" + doc.getDocumentDesccn() + ")");
			List<DocumentHistory> hiss = documentHistoryRepository.findByDocumentIdOrderByIdDesc(doc.getId());
			fileMap.put(type, hiss);
		});
		
		return fileMap;
	}
	
}
