package ctu.edu.vn.dlab.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "student")
public class Student {
	@Id
	@Column(name = "idStudent", nullable = false)
	private String idStudent;

	@Column(name = "StudentClass_idStudentClass")
	private String idStudentClass;

	@Column(name = "User_idUser")
	private Integer idUser;

	public String getIdStudent() {
		return idStudent;
	}

	public void setIdStudent(String idStudent) {
		this.idStudent = idStudent;
	}

	public String getIdStudentClass() {
		return idStudentClass;
	}

	public void setIdStudentClass(String idStudentClass) {
		this.idStudentClass = idStudentClass;
	}

	public Integer getIdUser() {
		return idUser;
	}

	public void setIdUser(Integer idUser) {
		this.idUser = idUser;
	}

}
