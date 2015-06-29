package ctu.edu.vn.dlab.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import ctu.edu.vn.dlab.model.Course;

public interface CourseRepository extends JpaRepository<Course, String> {

}
