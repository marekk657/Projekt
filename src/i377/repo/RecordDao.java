package i377.repo;

import java.util.List;

public interface RecordDao<T>{
	
	T addRecord(T record);
	List<T> records();
	void deleteRecord(T record);
	List<T> activeRecords();
	T getRecordById(long id);
	void modifyRecord(T record);
	
}
