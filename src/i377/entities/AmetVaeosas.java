package i377.entities;

import java.io.Serializable;
import javax.persistence.*;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@NamedQueries({
    @NamedQuery(name="AmetVaeosas.findAll", query="SELECT avs FROM AmetVaeosas avs"),
    @NamedQuery(name="AmetVaeosas.findActiveRecords", query="SELECT avs FROM AmetVaeosas avs WHERE avs.closedon IS NULL")
})

/**
 * The persistent class for the AMETVAEOSAS database table.
 * 
 */
@Entity
public class AmetVaeosas implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private long id;

	private Timestamp alates;

	private String closedby;

	@Temporal(TemporalType.DATE)
	private Date closedon;

	private String createdby;

	@Temporal(TemporalType.DATE)
	private Date createdon;

	private String kommentaar;

	private Timestamp kuni;

	private String modifiedby;

	@Temporal(TemporalType.DATE)
	private Date modifiedon;

	private int version;

	//bi-directional many-to-one association to Amet
	@ManyToOne
	private Amet amet;

	//bi-directional many-to-one association to Vaeosa
	@ManyToOne
	private Vaeosa vaeosa;

	//bi-directional many-to-one association to PiirivalvurVaeosas
	@OneToMany(mappedBy="ametvaeosa")
	private List<PiirivalvurVaeosas> piirivalvurvaeosas;

	public AmetVaeosas() {
	}

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Timestamp getAlates() {
		return this.alates;
	}

	public void setAlates(Timestamp alates) {
		this.alates = alates;
	}

	public String getClosedby() {
		return this.closedby;
	}

	public void setClosedby(String closedby) {
		this.closedby = closedby;
	}

	public Date getClosedon() {
		return this.closedon;
	}

	public void setClosedon(Date closedon) {
		this.closedon = closedon;
	}

	public String getCreatedby() {
		return this.createdby;
	}

	public void setCreatedby(String createdby) {
		this.createdby = createdby;
	}

	public Date getCreatedon() {
		return this.createdon;
	}

	public void setCreatedon(Date createdon) {
		this.createdon = createdon;
	}

	public String getKommentaar() {
		return this.kommentaar;
	}

	public void setKommentaar(String kommentaar) {
		this.kommentaar = kommentaar;
	}

	public Timestamp getKuni() {
		return this.kuni;
	}

	public void setKuni(Timestamp kuni) {
		this.kuni = kuni;
	}

	public String getModifiedby() {
		return this.modifiedby;
	}

	public void setModifiedby(String modifiedby) {
		this.modifiedby = modifiedby;
	}

	public Date getModifiedon() {
		return this.modifiedon;
	}

	public void setModifiedon(Date modifiedon) {
		this.modifiedon = modifiedon;
	}

	public int getVersion() {
		return this.version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public Amet getAmet() {
		return this.amet;
	}

	public void setAmet(Amet amet) {
		this.amet = amet;
	}

	public Vaeosa getVaeosa() {
		return this.vaeosa;
	}

	public void setVaeosa(Vaeosa vaeosa) {
		this.vaeosa = vaeosa;
	}

	public List<PiirivalvurVaeosas> getPiirivalvurvaeosas() {
		return this.piirivalvurvaeosas;
	}

	public void setPiirivalvurvaeosas(List<PiirivalvurVaeosas> piirivalvurvaeosas) {
		this.piirivalvurvaeosas = piirivalvurvaeosas;
	}

}