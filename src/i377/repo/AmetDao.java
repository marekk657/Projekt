package i377.repo;

import java.util.List;

import i377.entities.Amet;

public interface AmetDao {
	
	void addAmet(Amet amet);
	List<Amet> ametid();
	void deleteAmet(Amet amet, long Id);
	List<Amet> aktiivsedAmetid();
	void modifyAmet(Amet amet, long Id);
}
