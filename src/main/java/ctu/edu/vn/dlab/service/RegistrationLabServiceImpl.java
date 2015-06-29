package ctu.edu.vn.dlab.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.jboss.logging.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ctu.edu.vn.dlab.model.RegistrationLab;
import ctu.edu.vn.dlab.model.RegistrationLabStudent;
import ctu.edu.vn.dlab.model.RegistrationLabTeacher;
import ctu.edu.vn.dlab.repository.RegistrationLabRepository;

@Service
public class RegistrationLabServiceImpl implements RegistrationLabService {

	@Resource
	private RegistrationLabRepository registrationLabRepository;
	
	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	@Transactional
	public RegistrationLab create(RegistrationLab registrationLab) {
		RegistrationLab createdRegLab = registrationLab;
		return registrationLabRepository.save(createdRegLab);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public RegistrationLab delete(int idRegistrationLab) throws Exception {
		RegistrationLab deletedRegLab = findById(idRegistrationLab);
		
		if (deletedRegLab == null) {
			throw new Exception();
		}
		
		registrationLabRepository.delete(deletedRegLab);
		return deletedRegLab;
	}

	@Override
	@Transactional
	public List<RegistrationLab> findAll() {
		return registrationLabRepository.findAll();
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public RegistrationLab update(RegistrationLab registrationLab) throws Exception {
		RegistrationLab updatedRegLab = findById(registrationLab.getIdRegistrationLab());
		
		if (updatedRegLab == null) {
			throw new Exception();
		}
		
		updatedRegLab.setIdLab(registrationLab.getIdLab());
		updatedRegLab.setIdStudent(registrationLab.getIdStudent());
		return updatedRegLab;
	}

	@Override
	@Transactional
	public RegistrationLab findById(int idRegistrationLab) {
		return registrationLabRepository.findOne(idRegistrationLab);
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<RegistrationLab> findAllByIdLab(int idLab) {
		List<RegistrationLab> regLabList = new ArrayList<RegistrationLab>();
		
		try {
			Query query = entityManager.createQuery("FROM Lab WHERE idLab=:idLab");
			query.setParameter("idLab", idLab);
			
			regLabList = query.getResultList();
		} catch (Exception e) {
			_log.error("ctu.edu.vn.dlab.service.RegistrationLabServiceImpl - Error. not list reg lab by id lab");
			e.printStackTrace();
		}
		
		return regLabList;
	}
	
	@Override
	@Transactional
	public List<RegistrationLabTeacher> findByIdLab(int idLab) {
		List<Object[]> regObjectList = new ArrayList<Object[]>();
		List<RegistrationLabTeacher> regList = new ArrayList<RegistrationLabTeacher>();
		
		try {
			TypedQuery<Object[]> query = entityManager.createQuery(""
					+ "SELECT rl.idLab, s.idStudent, s.idStudentClass, s.idUser, u.fullName, u.email "
					+ "FROM RegistrationLab AS rl, Student AS s, User AS u "
					+ "WHERE rl.idStudent = s.idStudent "
					+ "AND s.idUser = u.idUser "
					+ "AND rl.idLab=:idLab", Object[].class);
			query.setParameter("idLab", idLab);
			
			regObjectList = query.getResultList();
			
			if (regObjectList.size() > 0) {
				RegistrationLabTeacher reg = null;
				for (Object[] objects : regObjectList) {
					reg = new RegistrationLabTeacher();

					reg.setIdLab(objects[0].toString());
					reg.setIdStudent(objects[1].toString());
					reg.setIdStudent_Class(objects[2].toString());
					reg.setIdUser(objects[3].toString());
					reg.setFullName(objects[4].toString());
					reg.setEmail(objects[5].toString());
					
					regList.add(reg);
				}
			}
		} catch (Exception e) {
			_log.error("ctu.edu.vn.dlab.service.RegistrationLabServiceImpl - Error. not found lab by id teacher");
			e.printStackTrace();
		}
		return regList;
	}
	
	@Override
	@Transactional
	public List<RegistrationLabStudent> findRegistedLabByIdStudent(String idStudent) {
		List<Object[]> registedObjectList = new ArrayList<Object[]>();
		List<RegistrationLabStudent> registedList = new ArrayList<RegistrationLabStudent>();

		try {
			TypedQuery<Object[]> query = entityManager.createQuery(""
					+ "SELECT l.idLab, l.name, l.amount, l.idCourse, l.idTeacher, t.idUser, u.fullName "
					+ "FROM Lab AS l, RegistrationLab AS rl, Teacher AS t, User AS u "
					+ "WHERE l.idLab = rl.idLab "
					+ "AND l.idTeacher = t.idTeacher "
					+ "AND t.idUser = u.idUser "
					+ "AND rl.idStudent=:idStudent", Object[].class);
			query.setParameter("idStudent", idStudent);
			
			registedObjectList = query.getResultList();
			
			if (registedObjectList.size() > 0) {
				RegistrationLabStudent reg = null;
				for (Object[] objects : registedObjectList) {
					reg = new RegistrationLabStudent();
					
					reg.setIdLab(objects[0].toString());
					reg.setName(objects[1].toString());
					reg.setAmount(objects[2].toString());
					reg.setIdCourse(objects[3].toString());
					reg.setIdTeacher(objects[4].toString());
					reg.setIdUser(objects[5].toString());
					reg.setFullName(objects[6].toString());
					
					registedList.add(reg);
				}
			}
		} catch (Exception e) {
			_log.error("ctu.edu.vn.dlab.service.RegistrationLabServiceImpl - Error. not found registed lab by id student");
			e.printStackTrace();
		}
		
		return registedList;
	}

	@Override
	@Transactional
	public List<RegistrationLabStudent> findNoRegistedLabByIdStudent(String idStudent) {
		List<Object[]> notRegistedObjectList = new ArrayList<Object[]>();
		List<RegistrationLabStudent> notRegistedList = new ArrayList<RegistrationLabStudent>();
		
		try {
			TypedQuery<Object[]> query = entityManager.createQuery(""
					+ "SELECT l.idLab, l.name, l.amount, l.idCourse, l.idTeacher, t.idUser, u.fullName "
					+ "FROM Lab l, Teacher t, User u "
					+ "WHERE l.idTeacher = t.idTeacher "
					+ "AND t.idUser = u.idUser "
					+ "AND idLab NOT IN "
						+ "(SELECT l.idLab "
						+ "FROM Lab l, RegistrationLab rl "
						+ "WHERE l.idLab = rl.idLab "
						+ "AND rl.idStudent=:idStudent)", Object[].class);
			query.setParameter("idStudent", idStudent);
			
			notRegistedObjectList = query.getResultList();
			
			if (notRegistedObjectList.size() > 0) {
				RegistrationLabStudent reg = null;
				for (Object[] objects : notRegistedObjectList) {
					reg = new RegistrationLabStudent();
					
					reg.setIdLab(objects[0].toString());
					reg.setName(objects[1].toString());
					reg.setAmount(objects[2].toString());
					reg.setIdCourse(objects[3].toString());
					reg.setIdTeacher(objects[4].toString());
					reg.setIdUser(objects[5].toString());
					reg.setFullName(objects[6].toString());
					
					notRegistedList.add(reg);
				}
			}
		} catch (Exception e) {
			_log.error("ctu.edu.vn.dlab.service.RegistrationLabServiceImpl - Error. not found no registed lab by id student");
			e.printStackTrace();
		}
		
		return notRegistedList;
	}

	@Override
	@Transactional
	public RegistrationLab getByIdStudent(int idLab, String idStudent) {
		RegistrationLab reg = null;
		
		try {
			Query query = entityManager.createQuery(""
					+ "FROM RegistrationLab "
					+ "WHERE idLab=:idLab "
					+ "AND idStudent=:idStudent", RegistrationLab.class);
			query.setParameter("idLab", idLab);
			query.setParameter("idStudent", idStudent);
			
			reg = (RegistrationLab) query.getSingleResult();
		} catch (NoResultException nre) {
			_log.error("ctu.edu.vn.dlab.service.RegistrationLabServiceImpl - Error. not found registed lab by id student");
			nre.printStackTrace();
		} catch (NonUniqueResultException nure) {
			_log.error("ctu.edu.vn.dlab.service.RegistrationLabServiceImpl - Error. many registed lab have the same student id");
			nure.printStackTrace();
		}
		
		return reg;
	}
	
	@Override
	public Long getTotalByIdLab(int idLab) {
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<Long> cq = cb.createQuery(Long.class);
		Root<RegistrationLab> root = cq.from(RegistrationLab.class);
		
		cq.select(cb.count(root));
		
	    cq.where(cb.equal(root.get("idLab"), idLab));
		
		TypedQuery<Long> tq = entityManager.createQuery(cq);
		
		return tq.getSingleResult().longValue();
	}
	
	private static final Logger _log = Logger.getLogger(RegistrationLabServiceImpl.class);

}
