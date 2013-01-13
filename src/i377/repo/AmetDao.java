package i377.repo;

import java.util.List;

import i377.entities.Amet;

public interface AmetDao {
	
	void addAmet(Amet amet);
	List<Amet> ametid();
}
