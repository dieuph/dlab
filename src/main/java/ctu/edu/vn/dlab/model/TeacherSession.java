package ctu.edu.vn.dlab.model;

public class TeacherSession extends Teacher {
	private String fullName;
	private String email;

	public TeacherSession(Teacher teacher) {
		this.setIdTeacher(teacher.getIdTeacher());
		this.setIdUser(teacher.getIdUser());
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
