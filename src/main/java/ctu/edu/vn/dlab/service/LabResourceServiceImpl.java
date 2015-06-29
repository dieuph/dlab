package ctu.edu.vn.dlab.service;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.jboss.logging.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ctu.edu.vn.dlab.model.LabResource;
import ctu.edu.vn.dlab.repository.LabResourceRepository;

@Service
public class LabResourceServiceImpl implements LabResourceService {

	@Resource
	private LabResourceRepository labResourceRepository;
	
	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	@Transactional
	public LabResource create(LabResource labResource) {
		LabResource createdLabResource = labResource;
		return labResourceRepository.save(createdLabResource);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public LabResource delete(int idLabResource) throws Exception {
		LabResource deletedLabResource = findById(idLabResource);
		
		if (deletedLabResource == null) {
			throw new Exception();
		}
		
		labResourceRepository.delete(deletedLabResource);
		return deletedLabResource;
	}

	@Override
	@Transactional
	public List<LabResource> findAll() {
		return labResourceRepository.findAll();
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public LabResource update(LabResource labResource) throws Exception {
		LabResource updatedLabResource = findById(labResource.getIdLabResource());
		
		if (updatedLabResource == null) {
			throw new Exception();
		}
		
		updatedLabResource.setName(labResource.getName());
		updatedLabResource.setStartDateTime(labResource.getStartDateTime());
		updatedLabResource.setEndDateTime(labResource.getEndDateTime());
		updatedLabResource.setLabLink(labResource.getLabLink());
		updatedLabResource.setIdLab(labResource.getIdLab());
		return updatedLabResource;
	}

	@Override
	@Transactional
	public LabResource findById(int idLabResource) {
		return labResourceRepository.findOne(idLabResource);
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<LabResource> findAllByIdLab(int idLab) {
		List<LabResource> labResourceList = null;
		try {
			Query query = entityManager.createQuery("FROM LabResource WHERE Lab_idLab=:idLab", LabResource.class);
			query.setParameter("idLab", idLab);
			
			labResourceList = query.getResultList();
		} catch (Exception e) {
			_log.error("ctu.edu.vn.dlab.service.LabResourceServiceImpl - Error. no lab resource by id lab");
			e.printStackTrace();
		}

		return labResourceList;
	}
	
	private static final Logger _log = Logger.getLogger(LabResourceServiceImpl.class);
}
