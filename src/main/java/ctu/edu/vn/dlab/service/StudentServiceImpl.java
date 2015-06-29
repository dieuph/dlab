package ctu.edu.vn.dlab.service;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.jboss.logging.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ctu.edu.vn.dlab.model.Student;
import ctu.edu.vn.dlab.repository.StudentRepository;

@Service
public class StudentServiceImpl implements StudentService {

	@Resource
	private StudentRepository studentRepository;
	
	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	@Transactional
	public Student create(Student student) {
		Student createdStudent = student;
		return studentRepository.save(createdStudent);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Student delete(String idStudent) throws Exception {
		Student deletedStudent = findById(idStudent);
		
		if (deletedStudent == null) {
			throw new Exception();
		}
		
		studentRepository.delete(deletedStudent);
		return deletedStudent;
	}

	@Override
	@Transactional
	public List<Student> findAll() {
		return studentRepository.findAll();
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Student update(Student student) throws Exception {
		Student updatedStudent = findById(student.getIdStudent());
		
		if (updatedStudent == null) {
			throw new Exception();
		}
		
		updatedStudent.setIdStudentClass(student.getIdStudentClass());
		updatedStudent.setIdUser(student.getIdUser());
		return updatedStudent;
	}

	@Override
	@Transactional
	public Student findById(String idStudent) {
		Student student = null;
		try {
			Query query = entityManager.createQuery("FROM Student WHERE idStudent=:idStudent", Student.class);
			query.setParameter("idStudent", idStudent);
			
			student = (Student) query.getSingleResult();
		} catch (NoResultException nre) {
			_log.error("ctu.edu.vn.dlab.service.StudentServiceImpl - Error. no student by student id");
			nre.printStackTrace();
		} catch (NonUniqueResultException nure) {
			_log.error("ctu.edu.vn.dlab.service.StudentServiceImpl - Error. many student have the same student id");
			nure.printStackTrace();
		}
		return student;
	}
	
	private static final Logger _log = Logger.getLogger(StudentServiceImpl.class);
}
