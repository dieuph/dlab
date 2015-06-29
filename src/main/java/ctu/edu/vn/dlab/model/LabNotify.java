package ctu.edu.vn.dlab.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "labnotify")
public class LabNotify {
	@Id
	@GeneratedValue
	private Integer idLabNotify;

	private String name;

	private String content;

	@Column(name = "Lab_idLab")
	private Integer idLab;

	public LabNotify() {
		super();
	}

	public LabNotify(String name, String content, Integer idLab) {
		super();
		this.name = name;
		this.content = content;
		this.idLab = idLab;
	}

	public Integer getIdLabNotify() {
		return idLabNotify;
	}

	public void setIdLabNotify(Integer idLabNotify) {
		this.idLabNotify = idLabNotify;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getIdLab() {
		return idLab;
	}

	public void setIdLab(Integer idLab) {
		this.idLab = idLab;
	}

}
