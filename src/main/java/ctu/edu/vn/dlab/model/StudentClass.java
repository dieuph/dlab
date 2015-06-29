package ctu.edu.vn.dlab.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "studentclass")
public class StudentClass {
	@Id
	private String idStudentClass;
	
	private String name;

	public String getIdStudentClass() {
		return idStudentClass;
	}

	public void setIdStudentClass(String idStudentClass) {
		this.idStudentClass = idStudentClass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
