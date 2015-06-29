package ctu.edu.vn.dlab.service;

import java.util.List;

import ctu.edu.vn.dlab.model.Teacher;

public interface TeacherService {
	public Teacher create(Teacher teacher);

	public Teacher delete(String idTeacher) throws Exception;

	public List<Teacher> findAll();

	public Teacher update(Teacher teacher) throws Exception;

	public Teacher findById(String idTeacher);
}
