package i377.entities;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.Date;
import java.util.List;

@NamedQueries({
    @NamedQuery(name="Amet.findAll", query="SELECT a FROM Amet a"),
    @NamedQuery(name="Amet.findActiveRecords", query="SELECT a FROM Amet a WHERE a.closedon IS NULL"),
    @NamedQuery(name="Amet.findById", query="SELECT a FROM Amet a WHERE a.id = :id")
})

/**
 * The persistent class for the AMET database table.
 * 
 */
@Entity
public class Amet implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private long id;

	private String closedby;

	@Temporal(TemporalType.DATE)
	private Date closedon;

	private String createdby;

	@Temporal(TemporalType.DATE)
	private Date createdon;

	@NotNull
	@Size(min = 4, max = 20)
	private String iscokood;

	@Size(min = 0, max = 255)
	private String kommentaar;

	private String modifiedby;

	@Temporal(TemporalType.DATE)
	private Date modifiedon;

	@NotNull
	@Size(min = 3, max = 25)
	private String nimetus;

	private int version;

	//bi-directional many-to-one association to AmetVaeosas
	@OneToMany(mappedBy="amet")
	private List<AmetVaeosas> ametvaeosas;

	public Amet() {
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

	public String getIscokood() {
		return this.iscokood;
	}

	public void setIscokood(String iscokood) {
		this.iscokood = iscokood;
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