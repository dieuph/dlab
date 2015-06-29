package ctu.edu.vn.dlab.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import ctu.edu.vn.dlab.model.Student;

public interface StudentRepository extends JpaRepository<Student, String> {

}
