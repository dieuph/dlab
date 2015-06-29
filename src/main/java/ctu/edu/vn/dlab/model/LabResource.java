package ctu.edu.vn.dlab.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "labresource")
public class LabResource {
	@Id
	@GeneratedValue
	private Integer idLabResource;

	private String name;

	private Date startDateTime;

	private Date endDateTime;

	private String labLink;

	@Column(name = "Lab_idLab")
	private Integer idLab;

	public LabResource() {
		super();
	}

	public LabResource(String name, Date startDateTime, Date endDateTime, String labLink, Integer idLab) {
		super();
		this.name = name;
		this.startDateTime = startDateTime;
		this.endDateTime = endDateTime;
		this.labLink = labLink;
		this.idLab = idLab;
	}

	public Integer getIdLabResource() {
		return idLabResource;
	}

	public void setIdLabResource(Integer idLabResource) {
		this.idLabResource = idLabResource;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getStartDateTime() {
		return startDateTime;
	}

	public void setStartDateTime(Date startDateTime) {
		this.startDateTime = startDateTime;
	}

	public Date getEndDateTime() {
		return endDateTime;
	}

	public void setEndDateTime(Date endDateTime) {
		this.endDateTime = endDateTime;
	}

	public String getLabLink() {
		return labLink;
	}

	public void setLabLink(String labLink) {
		this.labLink = labLink;
	}

	public Integer getIdLab() {
		return idLab;
	}

	public void setIdLab(Integer idLab) {
		this.idLab = idLab;
	}

}
