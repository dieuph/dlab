package ctu.edu.vn.dlab.service;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ctu.edu.vn.dlab.model.Teacher;
import ctu.edu.vn.dlab.repository.TeacherRepository;

@Service
public class TeacherServiceImpl implements TeacherService {
	
	@Resource
	private TeacherRepository teacherRepository;
	
	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	@Transactional
	public Teacher create(Teacher teacher) {
		Teacher createdTeacher = teacher;
		return teacherRepository.save(createdTeacher);
	}

	@Override
	@Transactional
	public Teacher delete(String idTeacher) throws Exception {
		Teacher deletedTeacher = findById(idTeacher);
		
		if (deletedTeacher == null) {
			throw new Exception();
		}
		
		teacherRepository.delete(deletedTeacher);
		return deletedTeacher;
	}

	@Override
	@Transactional
	public List<Teacher> findAll() {
		return teacherRepository.findAll();
	}

	@Override
	@Transactional
	public Teacher update(Teacher teacher) throws Exception {
		Teacher updatedTeacher = findById(teacher.getIdTeacher());
		
		if (updatedTeacher == null) {
			throw new Exception();
		}
		
		updatedTeacher.setIdUser(teacher.getIdUser());
		return updatedTeacher;
	}

	@Override
	@Transactional
	public Teacher findById(String idTeacher) {
		Teacher teacher = null;
		
		try {
			Query query = entityManager.createQuery("FROM Teacher WHERE idTeacher=:idTeacher", Teacher.class);
			query.setParameter("idTeacher", idTeacher);
			
			teacher = (Teacher) query.getSingleResult();
		} catch (NoResultException nre) {
			_log.error("ctu.edu.vn.dlab.service.TeacherServiceImpl - Error. find teacher by teacher id");
			nre.printStackTrace();
		} catch (NonUniqueResultException nure) {
			_log.error("ctu.edu.vn.dlab.service.TeacherServiceImpl - Error. many teacher have the same teacher id");
			nure.printStackTrace();
		}
		
		return teacher;
	}
	
	private static final Logger _log = Logger.getLogger(TeacherServiceImpl.class);
}
