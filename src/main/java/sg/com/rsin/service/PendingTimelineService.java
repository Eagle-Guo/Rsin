package sg.com.rsin.service;

public interface PendingTimelineService {

	public void updateAllEmptyActualDate();

	public long countActualDateNull();

	public void checkAndInsertPendingTimelineForAllCompany();
}
