package ctu.edu.vn.dlab.model;

public class StudentSession extends Student {
	private String fullName;
	private String email;
	
	public StudentSession(Student student) {
		this.setIdStudent(student.getIdStudent());
		this.setIdStudentClass(student.getIdStudentClass());
		this.setIdUser(student.getIdUser());
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
