package ctu.edu.vn.dlab.service;

import java.util.List;

import ctu.edu.vn.dlab.model.StudentClass;

public interface StudentClassService {
	public StudentClass create(StudentClass studentClass);

	public StudentClass delete(String idStudentClass) throws Exception;

	public List<StudentClass> findAll();

	public StudentClass update(StudentClass studentClass) throws Exception;

	public StudentClass findById(String idStudentClass);
}
