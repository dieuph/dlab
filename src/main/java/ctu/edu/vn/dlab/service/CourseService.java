package ctu.edu.vn.dlab.service;

import java.util.List;

import ctu.edu.vn.dlab.model.Course;

public interface CourseService {
	public Course create(Course course);

	public Course delete(String idCourse) throws Exception;

	public List<Course> findAll();

	public Course update(Course course) throws Exception;

	public Course findById(String idCourse);
}
