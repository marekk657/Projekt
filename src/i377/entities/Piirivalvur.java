package i377.entities;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Range;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.Date;
import java.util.List;

@NamedQueries({
    @NamedQuery(name="Piirivalvur.findAll", query="SELECT pv FROM Piirivalvur pv"),
    @NamedQuery(name="Piirivalvur.findActiveRecords", query="SELECT pv FROM Piirivalvur pv WHERE pv.closedon IS NULL"),
    @NamedQuery(name="Piirivalvur.findById", query="SELECT pv FROM Piirivalvur pv WHERE pv.id = :id")
})

/**
 * The persistent class for the PIIRIVALVUR database table.
 * 
 */
@Entity
public class Piirivalvur implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private long id;

	@NotNull
	@Size(min = 5, max = 25)
	private String aadress;

	private String closeddby;

	@Temporal(TemporalType.DATE)
	private Date closedon;

	private String createdby;

	@Temporal(TemporalType.DATE)
	private Date createdon;

	@NotNull
	@Size(min = 2, max = 255)
	private String eesnimi;

	@NotNull
	@Size(min = 6, max = 50)
	private String email;

	@NotNull
	@Size(min = 6, max = 20)
	private String isikukood;

	@Size(min = 0, max = 255)
	private String kommentaar;

	private String modifiedby;

	@Temporal(TemporalType.DATE)
	private Date modifiedon;

	@NotNull
	@Size(min = 2, max = 255)
	private String perekonnanimi;

	@NotNull
	@Size(min = 4, max = 40)
	private String sodurikood;

	@NotNull
	@Range(min = 0, max = 1)
	private int sugu;

	@NotNull
	@Size(min = 3, max = 255)
	private String telefon;

	private int version;

	//bi-directional many-to-one association to PiirivalvurVaeosas
	@OneToMany(mappedBy="piirivalvur")
	private List<PiirivalvurVaeosas> piirivalvurvaeosas;

	public Piirivalvur() {
	}

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getAadress() {
		return this.aadress;
	}

	public void setAadress(String aadress) {
		this.aadress = aadress;
	}

	public String getCloseddby() {
		return this.closeddby;
	}

	public void setCloseddby(String closeddby) {
		this.closeddby = closeddby;
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

	public String getEesnimi() {
		return this.eesnimi;
	}

	public void setEesnimi(String eesnimi) {
		this.eesnimi = eesnimi;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIsikukood() {
		return this.isikukood;
	}

	public void setIsikukood(String isikukood) {
		this.isikukood = isikukood;
	}

	public String getKommentaar() {
		return this.kommentaar;
	}

	public void setKommentaar(String kommentaar) {
		this.kommentaar = kommentaar;
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

	public String getPerekonnanimi() {
		return this.perekonnanimi;
	}

	public void setPerekonnanimi(String perekonnanimi) {
		this.perekonnanimi = perekonnanimi;
	}

	public String getSodurikood() {
		return this.sodurikood;
	}

	public void setSodurikood(String sodurikood) {
		this.sodurikood = sodurikood;
	}

	public int getSugu() {
		return this.sugu;
	}

	public void setSugu(int sugu) {
		this.sugu = sugu;
	}

	public String getTelefon() {
		return this.telefon;
	}

	public void setTelefon(String telefon) {
		this.telefon = telefon;
	}

	public int getVersion() {
		return this.version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public List<PiirivalvurVaeosas> getPiirivalvurvaeosas() {
		return this.piirivalvurvaeosas;
	}

	public void setPiirivalvurvaeosas(List<PiirivalvurVaeosas> piirivalvurvaeosas) {
		this.piirivalvurvaeosas = piirivalvurvaeosas;
	}

	@PrePersist
	public void recordCreated() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		setCreatedby(auth.getName());
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