package ctu.edu.vn.dlab.service;

import java.util.List;

import ctu.edu.vn.dlab.model.Student;

public interface StudentService {
	public Student create(Student student);

	public Student delete(String idStudent) throws Exception;

	public List<Student> findAll();

	public Student update(Student student) throws Exception;

	public Student findById(String idStudent);
}
