package ctu.edu.vn.dlab.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "lab")
public class Lab {
	@Id
	@GeneratedValue
	private Integer idLab;

	private String name;

	private Integer amount;

	private String fileVPN;

	@Column(name = "Course_idCourse")
	private String idCourse;

	@Column(name = "Teacher_idTeacher")
	private String idTeacher;

	public Lab() {
		super();
	}

	public Lab(Integer idLab) {
		super();
		this.idLab = idLab;
	}

	public Lab(String name, Integer amount, String fileVPN, String idCourse, String idTeacher) {
		super();
		this.name = name;
		this.amount = amount;
		this.fileVPN = fileVPN;
		this.idCourse = idCourse;
		this.idTeacher = idTeacher;
	}

	public Integer getIdLab() {
		return idLab;
	}

	public void setIdLab(Integer idLab) {
		this.idLab = idLab;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public String getFileVPN() {
		return fileVPN;
	}

	public void setFileVPN(String fileVPN) {
		this.fileVPN = fileVPN;
	}

	public String getIdCourse() {
		return idCourse;
	}

	public void setIdCourse(String idCourse) {
		this.idCourse = idCourse;
	}

	public String getIdTeacher() {
		return idTeacher;
	}

	public void setIdTeacher(String idTeacher) {
		this.idTeacher = idTeacher;
	}

}
