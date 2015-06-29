package ctu.edu.vn.dlab.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.jboss.logging.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ctu.edu.vn.dlab.model.Lab;
import ctu.edu.vn.dlab.repository.LabRepository;

@Service
public class LabServiceImpl implements LabService {
	
	@Resource
	private LabRepository labRepository;
	
	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	@Transactional
	public Lab create(Lab lab) {
		Lab createdLab = lab;
		return labRepository.save(createdLab);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Lab delete(int idLab) throws Exception {
		Lab deletedLab = findById(idLab);
		
		if (deletedLab == null) {
			throw new Exception();
		}
		
		labRepository.delete(deletedLab);
		return deletedLab;
	}

	@Override
	@Transactional
	public List<Lab> findAll() {
		return labRepository.findAll();
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Lab update(Lab lab) throws Exception {
		Lab updatedLab = findById(lab.getIdLab());
		
		if (updatedLab == null) {
			throw new Exception();
		}
		
		updatedLab.setName(lab.getName());
		updatedLab.setAmount(lab.getAmount());
		updatedLab.setFileVPN(lab.getFileVPN());
		updatedLab.setIdCourse(lab.getIdCourse());
		updatedLab.setIdTeacher(lab.getIdTeacher());
		return updatedLab;
	}

	@Override
	@Transactional
	public Lab findById(int idLab) {
		return labRepository.findOne(idLab);
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Lab> findAllByIdTeacher(String idTeacher) {
		List<Lab> labs = new ArrayList<Lab>();
		
		try {
			Query query = entityManager.createQuery("FROM Lab WHERE idTeacher=:idTeacher", Lab.class);
			query.setParameter("idTeacher", idTeacher);
			
			labs = query.getResultList();
		} catch (Exception e) {
			_log.error("ctu.edu.vn.dlab.service.LabServiceImpl - Error. no lab by id teacher");
			e.printStackTrace();
		}
		
		return labs;
	}
	
	@Override
	@Transactional
	public Lab findByIdLabIdTeacher(int idLab, String idTeacher) {
		Lab lab = null;
		
		try {
			Query query = entityManager.createQuery("FROM Lab WHERE idLab=:idLab AND idTeacher=:idTeacher");
			query.setParameter("idLab", idLab);
			query.setParameter("idTeacher", idTeacher);
			
			lab = (Lab) query.getSingleResult();
		} catch (Exception e) {
			_log.error("ctu.edu.vn.dlab.service.LabServiceImpl - Error. no lab by id lab and id teacher");
			e.printStackTrace();
		}
		
		return lab;
	}
	
	private static final Logger _log = Logger.getLogger(LabServiceImpl.class);

}
