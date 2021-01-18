package sg.com.rsin.util;

import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import sg.com.rsin.entity.Company;
import sg.com.rsin.entity.CompanyService;
import sg.com.rsin.entity.CompanyShareholderInfo;
import sg.com.rsin.vo.CompanyInfoVO;
import sg.com.rsin.vo.CompanyServiceVO;

public class CommonUtils {
	
	/**
	 * SHA 256 generation
	 * @param text
	 * @return
	 */
	public static String getHashValue(String text) {
		StringBuffer sb = new StringBuffer();
		try {
	        MessageDigest md = MessageDigest.getInstance("SHA-256");
	        md.update(text.getBytes());
	        byte byteData[] = md.digest();

			for (byte aByteData : byteData) {
				sb.append(Integer.toString((aByteData & 0xff) + 0x100, 16).substring(1));
			}
		}
		catch (Exception e) {
			sb = new StringBuffer();
		}
        return sb.toString();
	}
	
	public static String getFileName(int id) {
		String filename;
		switch (id) {
	        case 1: filename = "First_Director_Meeting_Resolution.pdf"; break;
	        case 2: filename = "Secretary_Agreement.pdf"; break;
	        case 3: filename = "Notice_For_Controllers.pdf"; break;
	        case 4: filename = "Application_of_Shares.pdf"; break;
	        case 5: filename = "Client_Acceptance_Form.pdf"; break;
	        case 6: filename = "Form_45_201.pdf"; break;
	        case 7: filename = "Share_Certificate.pdf"; break;
	        case 8: filename = "Nominee_Dir_Authrn_Final.pdf"; break;
	        case 9: filename = "Constitution_of_Company.pdf"; break;
	        case 10: filename = "Attached_AML/CFT_Report.pdf"; break;
	        case 11: filename = "Certificate_of_Incorporation.pdf"; break;
	        case 12: filename = "Risk_Assessment.pdf"; break;
	        case 13: filename = "Risk_Assessment_Checklist.pdf"; break;
	        case 14: filename = "Company_info.pdf"; break;
	        case 15: filename = "Register_of_Charges.pdf"; break;
	        case 16: filename = "Register_of_Secretary.pdf"; break;
	        
	        default:  filename = "First_Director_Meeting_Resolution.pdf";
	    }
		return filename;
	}
	
	public static String getJaspterTemplateName(int id) {
		String templateName;
		switch (id) {
		 	case 1: templateName = "First_Director_Meeting_Resolution.jrxml"; break;
		    case 2: templateName = "Secretary_Agreement.jrxml"; break;//Signature.jrxml
		    case 3: templateName = "Notice_For_Controllers.jrxml"; break;
		    case 4: templateName = "Application_of_Shares.jrxml"; break;
		    case 5: templateName = "Client_Acceptance_Form.jrxml"; break;
		    case 6: templateName = "Form_45_201.jrxml"; break;
		    case 7: templateName = "Share_Certificate.jrxml"; break;
		    case 8: templateName = "Nominee_Dir_Authrn_Final.jrxml"; break;
		    default : templateName = "First_Director_Meeting_Resolution.jrxml";
	    }
		return templateName;
	}
	
	public static Company phaseNewCompany (List<CompanyInfoVO> companyInfos) {
		Company company = new Company();
		for(CompanyInfoVO companyInfoVO : companyInfos) {
			switch (companyInfoVO.getName()) {
			case "公司名称":
				company.setName(companyInfoVO.getDescription());
				break; 
			case "公司备用名称":
				company.setBackupName(companyInfoVO.getDescription());
				break; 
			case "公司类型":
				company.setType(companyInfoVO.getDescription());
				break; 
			case "发行股份资本":
				company.setTotalStockCapital(Float.parseFloat(companyInfoVO.getDescription()));
				break; 
			case "实缴股份资本":
				company.setActualStockCapital(Float.parseFloat(companyInfoVO.getDescription()));
				break; 
			case "公司商业活动1":
				company.setActivityOne(companyInfoVO.getDescription());
				break; 
			case "公司商业活动2":
				company.setActivityTwo(companyInfoVO.getDescription());
				break; 
			case "公司地址及邮编":
				company.setAddress(companyInfoVO.getDescription());
				break; 
			}
		}
		return company;
	}
	
	public static CompanyService phaseNewCompanyService (List<CompanyServiceVO> companyServices) {
		CompanyService companyService = new CompanyService();
		for(CompanyServiceVO companyServiceVO : companyServices) {
			switch (companyServiceVO.getName()) {
			case "私人豁免有限公司":
			case "公众有限责任公司":
				companyService.setCompanyType(companyServiceVO.getPrice());
				break; 
			case "新注册新加坡公司开户":
				companyService.setOpenAccount(companyServiceVO.getPrice());
				break; 
			case "挂名董事":
				companyService.setNominalDirector(companyServiceVO.getPrice());
				break; 
			case "GST消费税注册":
				companyService.setGstTax(companyServiceVO.getPrice());
				break; 
			case "虚拟电话":
				companyService.setVirtualPhone(companyServiceVO.getPrice());
				break; 
			case "收信转寄服务":
				companyService.setForwardMail(companyServiceVO.getPrice());
				break; 
			case "会计记账":
				companyService.setAccounting(companyServiceVO.getPrice());
				break; 
			case "注册加急":
				companyService.setUrgentRegistration(companyServiceVO.getPrice());
				break; 
			}
		}
		return companyService;
	}

	public static List<CompanyShareholderInfo> phaseNewCompanyShareholderInfo(List<CompanyInfoVO> companyInfoVOs) {
		List<CompanyShareholderInfo> companyShareholderInfos = new ArrayList<CompanyShareholderInfo>();
		
		String count = companyInfoVOs.stream().filter(holderInfo -> holderInfo.getName().equals("CONTACTCOUNT"))
				.collect(Collectors.toList()).get(0).getDescription();
		for (int i=1; i<=Integer.parseInt(count); i++) {
			CompanyShareholderInfo companyShareholderInfo = new CompanyShareholderInfo();

			for(CompanyInfoVO companyInfoVO : companyInfoVOs) {
				if (companyInfoVO.getName().equals("职位填报类型"+i)) {
					companyShareholderInfo.setPositionType(companyInfoVO.getDescription());
				} else if (companyInfoVO.getName().equals("全名"+i)) {
					companyShareholderInfo.setName(companyInfoVO.getDescription());
				} else if (companyInfoVO.getName().equals("性别"+i)) {
					companyShareholderInfo.setGender(companyInfoVO.getDescription());
				} else if (companyInfoVO.getName().equals("国籍"+i)) {
					companyShareholderInfo.setNationality(companyInfoVO.getDescription());
				} else if (companyInfoVO.getName().equals("证件类型"+i)) {
					companyShareholderInfo.setIcType(companyInfoVO.getDescription());
				} else if (companyInfoVO.getName().equals("证件号码"+i)) {
					companyShareholderInfo.setIcNumber(companyInfoVO.getDescription());
				} else if (companyInfoVO.getName().equals("电子邮箱"+i)) {
					companyShareholderInfo.setEmail(companyInfoVO.getDescription());
				} else if (companyInfoVO.getName().equals("联系电话"+i)) {
					companyShareholderInfo.setContactNumber(companyInfoVO.getDescription());
				} else if (companyInfoVO.getName().equals("发行股份数量"+i)) {
					companyShareholderInfo.setIssueStockAmount(Integer.parseInt(companyInfoVO.getDescription()));
				} else if (companyInfoVO.getName().equals("实缴股份数量"+i)) {
					companyShareholderInfo.setActualStockAmount(Integer.parseInt(companyInfoVO.getDescription()));
				} else if (companyInfoVO.getName().equals("每股价值"+i)) {
					companyShareholderInfo.setValuePerStock(Integer.parseInt(companyInfoVO.getDescription()));
				} else if (companyInfoVO.getName().equals("个人地址及邮编"+i)) {
					companyShareholderInfo.setAddress(companyInfoVO.getDescription());
				}
			}
			companyShareholderInfo.setSeq(i);
			companyShareholderInfos.add(companyShareholderInfo);
		}
		return companyShareholderInfos;
	}
}
