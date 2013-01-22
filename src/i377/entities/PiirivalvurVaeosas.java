package i377.entities;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

//import java.sql.Timestamp;
import java.util.Date;

@NamedQueries({
    @NamedQuery(name="PiirivalvurVaeosas.findAll", query="SELECT pva FROM PiirivalvurVaeosas pva"),
    @NamedQuery(name="PiirivalvurVaeosas.findActiveRecords", query="SELECT pva FROM PiirivalvurVaeosas pva WHERE pva.closedon IS NULL"),
    @NamedQuery(name="PiirivalvurVaeosas.findById", query="SELECT pvv FROM PiirivalvurVaeosas pvv WHERE pvv.id = :id")
})

/**
 * The persistent class for the PIIRIVALVURVAEOSAS database table.
 * 
 */
@Entity
public class PiirivalvurVaeosas implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private long id;

	@Column (name = "Alates")
	@NotNull
	@DateTimeFormat(pattern="dd/MM/yyyy")
	private Date alates;

	private String closedby;

	@Temporal(TemporalType.DATE)
	private Date closedon;

	private String createdby;

	@Temporal(TemporalType.DATE)
	private Date createdon;

	@Size(min = 0, max = 255)
	private String kommentaar;

	@NotNull
	@Range(min = 0, max = 1)
	private double koormus;

	@Column (name = "Kuni")
	@NotNull
	@DateTimeFormat(pattern="dd/MM/yyyy")
	private Date kuni;

	private String modifiedby;

	@Temporal(TemporalType.DATE)
	private Date modifiedon;

	private int version;

	//bi-directional many-to-one association to AmetVaeosas
	@ManyToOne
	@JoinColumn(name="AMETVAEOSAS_ID")
	@NotNull
	private AmetVaeosas ametvaeosa;

	//bi-directional many-to-one association to Piirivalvur
	@ManyToOne
	@JoinColumn(name="PIIRIVALVUR_ID")
	@NotNull
	private Piirivalvur piirivalvur;

	//bi-directional many-to-one association to Vaeosa
	@ManyToOne
	@JoinColumn(name="VAEOSA_ID")
	@NotNull
	private Vaeosa vaeosa;

	public PiirivalvurVaeosas() {
	}

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Date getAlates() {
		return this.alates;
	}

	public void setAlates(Date alates) {
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

	public double getKoormus() {
		return this.koormus;
	}

	public void setKoormus(double koormus) {
		this.koormus = koormus;
	}

	public Date getKuni() {
		return this.kuni;
	}

	public void setKuni(Date kuni) {
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

	public AmetVaeosas getAmetvaeosa() {
		return this.ametvaeosa;
	}

	public void setAmetvaeosa(AmetVaeosas ametvaeosa) {
		this.ametvaeosa = ametvaeosa;
	}

	public Piirivalvur getPiirivalvur() {
		return this.piirivalvur;
	}

	public void setPiirivalvur(Piirivalvur piirivalvur) {
		this.piirivalvur = piirivalvur;
	}

	public Vaeosa getVaeosa() {
		return this.vaeosa;
	}

	public void setVaeosa(Vaeosa vaeosa) {
		this.vaeosa = vaeosa;
	}

	@PrePersist
	public void recordCreated() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		String name = null;
		if (auth == null || auth.getName() == null) 
			name = "TEST";
		else
			name = auth.getName();

		setCreatedby(name);
		setCreatedon(new Date());
	}
	
	@PreUpdate
	public void recordModified() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		setModifiedby(auth.getName());
		setModifiedon(new Date());
	}

	@PreRemove
	public void recordDeleted() {
		throw new SecurityException("Removing entity is prohibited!");
	}
}