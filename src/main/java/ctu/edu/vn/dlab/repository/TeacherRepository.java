package ctu.edu.vn.dlab.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import ctu.edu.vn.dlab.model.Teacher;

public interface TeacherRepository extends JpaRepository<Teacher, String> {

}
