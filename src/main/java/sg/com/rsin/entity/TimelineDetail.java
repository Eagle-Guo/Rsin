package sg.com.rsin.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "timeline_detail")
public class TimelineDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(name="estimate_date")
	private Date estimateDate;
	@Column(name="actual_date")
	private Date actualDate;
	@Column(name="result")
	private boolean result;
	@Column(name="comment")
	private String comment;

	@ManyToOne
    @JoinColumn(name = "timeline_id", nullable = false)
	private Timeline timeline;
    
    public TimelineDetail() {}

	public TimelineDetail(Long id, Date estimateDate, Date actualDate, boolean result, String comment,
			Timeline timeline) {
		super();
		this.id = id;
		this.estimateDate = estimateDate;
		this.actualDate = actualDate;
		this.result = result;
		this.comment = comment;
		this.timeline = timeline;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getEstimateDate() {
		return estimateDate;
	}

	public void setEstimateDate(Date estimateDate) {
		this.estimateDate = estimateDate;
	}

	public Date getActualDate() {
		return actualDate;
	}

	public void setActualDate(Date actualDate) {
		this.actualDate = actualDate;
	}

	public boolean isResult() {
		return result;
	}

	public void setResult(boolean result) {
		this.result = result;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Timeline getTimeline() {
		return timeline;
	}

	public void setTimeline(Timeline timeline) {
		this.timeline = timeline;
	}
}
