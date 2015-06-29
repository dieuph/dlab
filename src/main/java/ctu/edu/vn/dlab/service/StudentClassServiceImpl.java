package ctu.edu.vn.dlab.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ctu.edu.vn.dlab.model.StudentClass;
import ctu.edu.vn.dlab.repository.StudentClassRepository;

@Service
public class StudentClassServiceImpl implements StudentClassService {

	@Autowired
	private StudentClassRepository studentClassRepository;
	
	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	@Transactional
	public StudentClass create(StudentClass studentClass) {
		StudentClass createdStudentClass = studentClass;
		return studentClassRepository.save(createdStudentClass);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public StudentClass delete(String idStudentClass) throws Exception {
		StudentClass deletedStudentClass = findById(idStudentClass);
		
		if (deletedStudentClass == null) {
			throw new Exception();
		}
		
		studentClassRepository.delete(deletedStudentClass);
		return deletedStudentClass;
	}

	@Override
	@Transactional
	public List<StudentClass> findAll() {
		return studentClassRepository.findAll();
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public StudentClass update(StudentClass studentClass) throws Exception {
		StudentClass updatedStudentClass = findById(studentClass.getIdStudentClass());
		
		if (updatedStudentClass == null) {
			throw new Exception();
		}
		
		updatedStudentClass.setName(studentClass.getName());
		return updatedStudentClass;
	}

	@Override
	@Transactional
	public StudentClass findById(String idStudentClass) {
		StudentClass studentClass = null;
		try {
			Query query = entityManager.createQuery("FROM StudentClass WHERE idStudentClass=:idStudentClass", StudentClass.class);
			query.setParameter("idStudentClass", idStudentClass);
			
			studentClass = (StudentClass) query.getSingleResult();
		} catch (NoResultException nre) {
			_log.error("ctu.edu.vn.dlab.service.StudentClassServiceImpl - Error. find student class by student class id");
			nre.printStackTrace();
		} catch (NonUniqueResultException nure) {
			_log.error("ctu.edu.vn.dlab.service.StudentClassServiceImpl - Error. many student class have the same student class id");
			nure.printStackTrace();
		}
		
		return studentClass;
	}
	
	private static final Logger _log = Logger.getLogger(StudentClassServiceImpl.class);
}
