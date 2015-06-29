package ctu.edu.vn.dlab.service;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.jboss.logging.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ctu.edu.vn.dlab.model.LabNotify;
import ctu.edu.vn.dlab.repository.LabNotifyRepository;

@Service
public class LabNotifyServiceImpl implements LabNotifyService {
	
	@Resource
	private LabNotifyRepository labNotifyRepository;

	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	@Transactional
	public LabNotify create(LabNotify labNotify) {
		LabNotify createdLabNotify = labNotify;
		return labNotifyRepository.save(createdLabNotify);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public LabNotify delete(int idLabNotify) throws Exception {
		LabNotify deletedLabNotify = findById(idLabNotify);
		
		if (deletedLabNotify == null) {
			throw new Exception();
		}
		
		labNotifyRepository.delete(deletedLabNotify);
		return deletedLabNotify;
	}

	@Override
	@Transactional
	public List<LabNotify> findAll() {
		return labNotifyRepository.findAll();
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public LabNotify update(LabNotify labNotify) throws Exception {
		LabNotify updatedLabNotify = findById(labNotify.getIdLabNotify());
		
		if (updatedLabNotify == null) {
			throw new Exception();
		}
		
		updatedLabNotify.setName(labNotify.getName());
		updatedLabNotify.setContent(labNotify.getContent());
		updatedLabNotify.setIdLab(labNotify.getIdLab());
		return updatedLabNotify;
	}

	@Override
	@Transactional
	public LabNotify findById(int idLabNotify) {
		return labNotifyRepository.findOne(idLabNotify);
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<LabNotify> findAllByIdLab(int idLab) {
		List<LabNotify> labNotifyList = null;
		
		try {
			Query query = entityManager.createQuery("FROM LabNotify WHERE Lab_idLab=:idLab", LabNotify.class);
			query.setParameter("idLab", idLab);
			
			labNotifyList = query.getResultList();
		} catch (Exception e) {
			_log.error("ctu.edu.vn.dlab.service.LabNotifyServiceImpl - Error. no lab notify by id lab");
			e.printStackTrace();
		}
		
		return labNotifyList;
	}
	
	private static final Logger _log = Logger.getLogger(LabNotifyServiceImpl.class);
}
