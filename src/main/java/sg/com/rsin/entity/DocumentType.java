package sg.com.rsin.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "document_type")
public class DocumentType {
	@Id
	@Column(name="document_type_code")
	private String documentTypeCode;
	@Column(name="document_type_desc")
	private String documentTypeDesc;
	@Column(name="document_type_desc_cn")
	private String documentTypeDescCn;
    @Column(name="created_date")
	private Date createdDate;
    
    public DocumentType() {}

	public String getDocumentTypeCode() {
		return documentTypeCode;
	}

	public void setDocumentTypeCode(String documentTypeCode) {
		this.documentTypeCode = documentTypeCode;
	}

	public String getDocumentTypeDesc() {
		return documentTypeDesc;
	}

	public void setDocumentTypeDesc(String documentTypeDesc) {
		this.documentTypeDesc = documentTypeDesc;
	}

	public String getDocumentTypeDescCn() {
		return documentTypeDescCn;
	}

	public void setDocumentTypeDescCn(String documentTypeDescCn) {
		this.documentTypeDescCn = documentTypeDescCn;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
}
