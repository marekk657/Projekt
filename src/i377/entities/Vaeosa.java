package i377.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the VAEOSA database table.
 * 
 */
@Entity
public class Vaeosa implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;

	private String closedby;

	private Timestamp closedon;

	private String createdby;

	private Timestamp createdon;

	private String kommentaar;

	private String kood;

	private String modifiedby;

	private Timestamp modifiedon;

	private String nimetus;

	private int version;

	//bi-directional many-to-one association to AmetVaeosas
	@OneToMany(mappedBy="vaeosa")
	private List<AmetVaeosas> ametvaeosas;

	//bi-directional many-to-one association to PiirivalvurVaeosas
	@OneToMany(mappedBy="vaeosa")
	private List<PiirivalvurVaeosas> piirivalvurvaeosas;

	public Vaeosa() {
	}

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getClosedby() {
		return this.closedby;
	}

	public void setClosedby(String closedby) {
		this.closedby = closedby;
	}

	public Timestamp getClosedon() {
		return this.closedon;
	}

	public void setClosedon(Timestamp closedon) {
		this.closedon = closedon;
	}

	public String getCreatedby() {
		return this.createdby;
	}

	public void setCreatedby(String createdby) {
		this.createdby = createdby;
	}

	public Timestamp getCreatedon() {
		return this.createdon;
	}

	public void setCreatedon(Timestamp createdon) {
		this.createdon = createdon;
	}

	public String getKommentaar() {
		return this.kommentaar;
	}

	public void setKommentaar(String kommentaar) {
		this.kommentaar = kommentaar;
	}

	public String getKood() {
		return this.kood;
	}

	public void setKood(String kood) {
		this.kood = kood;
	}

	public String getModifiedby() {
		return this.modifiedby;
	}

	public void setModifiedby(String modifiedby) {
		this.modifiedby = modifiedby;
	}

	public Timestamp getModifiedon() {
		return this.modifiedon;
	}

	public void setModifiedon(Timestamp modifiedon) {
		this.modifiedon = modifiedon;
	}

	public String getNimetus() {
		return this.nimetus;
	}

	public void setNimetus(String nimetus) {
		this.nimetus = nimetus;
	}

	public int getVersion() {
		return this.version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public List<AmetVaeosas> getAmetvaeosas() {
		return this.ametvaeosas;
	}

	public void setAmetvaeosas(List<AmetVaeosas> ametvaeosas) {
		this.ametvaeosas = ametvaeosas;
	}

	public List<PiirivalvurVaeosas> getPiirivalvurvaeosas() {
		return this.piirivalvurvaeosas;
	}

	public void setPiirivalvurvaeosas(List<PiirivalvurVaeosas> piirivalvurvaeosas) {
		this.piirivalvurvaeosas = piirivalvurvaeosas;
	}

}