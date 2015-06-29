package ctu.edu.vn.dlab.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "registrationlab")
public class RegistrationLab {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer idRegistrationLab;

	@Column(name = "Lab_idLab")
	private Integer idLab;

	@Column(name = "Student_idStudent")
	private String idStudent;

	public Integer getIdRegistrationLab() {
		return idRegistrationLab;
	}

	public void setIdRegistrationLab(Integer idRegistrationLab) {
		this.idRegistrationLab = idRegistrationLab;
	}

	public Integer getIdLab() {
		return idLab;
	}

	public void setIdLab(Integer idLab) {
		this.idLab = idLab;
	}

	public String getIdStudent() {
		return idStudent;
	}

	public void setIdStudent(String idStudent) {
		this.idStudent = idStudent;
	}

}
