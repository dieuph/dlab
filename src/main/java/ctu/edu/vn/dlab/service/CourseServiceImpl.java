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

import ctu.edu.vn.dlab.model.Course;
import ctu.edu.vn.dlab.repository.CourseRepository;

@Service
public class CourseServiceImpl implements CourseService {

	@Resource
	private CourseRepository courseRepository;

	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	@Transactional
	public Course create(Course course) {
		Course createdCourse = course;
		return courseRepository.save(createdCourse);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Course delete(String idCourse) throws Exception {
		Course deletedCourse = findById(idCourse);
		
		if (deletedCourse == null) {
			throw new Exception();
		}
		
		courseRepository.delete(deletedCourse);
		return deletedCourse;
	}

	@Override
	@Transactional
	public List<Course> findAll() {
		return courseRepository.findAll();
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Course update(Course course) throws Exception {
		Course updatedCourse = findById(course.getIdCourse());
		
		if (updatedCourse == null) {
			throw new Exception();
		}
		
		updatedCourse.setName(course.getName());
		return updatedCourse;
	}

	@Override
	@Transactional
	public Course findById(String idCourse) {
		Course course = null;
		try {
			Query query = entityManager.createQuery("FROM Course WHERE idCourse=:idCourse", Course.class);
			query.setParameter("idCourse", idCourse);
			
			course = (Course) query.getSingleResult();
		} catch (NoResultException nre) {
			_log.error("ctu.edu.vn.dlab.service.CourseServiceImpl - Error. no course by course id");
			nre.printStackTrace();
		} catch (NonUniqueResultException nure) {
			_log.error("ctu.edu.vn.dlab.service.CourseServiceImpl - Error. many course have the same course id");
			nure.printStackTrace();
		}
		return course;
	}
	
	private static final Logger _log = Logger.getLogger(CourseServiceImpl.class);

}
