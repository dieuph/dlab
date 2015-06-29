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

import ctu.edu.vn.dlab.model.Admin;
import ctu.edu.vn.dlab.repository.AdminRepository;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Resource
	private AdminRepository adminRepository;
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	@Transactional
	public Admin create(Admin admin) {
		Admin createdAdmin = admin;
		return adminRepository.save(createdAdmin);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Admin delete(String idAdmin) throws Exception {
		return null;
	}

	@Override
	@Transactional
	public List<Admin> findAll() {
		return adminRepository.findAll();
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Admin update(Admin admin) throws Exception {
		return null;
	}

	@Override
	@Transactional
	public Admin findById(String idAdmin) {
		Admin admin = null;
		try {
			Query query = entityManager.createQuery("FROM Admin WHERE idAdmin=:idAdmin", Admin.class);
			query.setParameter("idAdmin", idAdmin);
			
			admin = (Admin) query.getSingleResult();
		} catch (NoResultException nre) {
			_log.error("ctu.edu.vn.dlab.service.AdminServiceImpl - Error. no admin by admin id");
			nre.printStackTrace();
		} catch (NonUniqueResultException nure) {
			_log.error("ctu.edu.vn.dlab.service.AdminServiceImpl - Error. many admin have the same admin id");
			nure.printStackTrace();
		}
		return admin;
	}
	
	private static final Logger _log = Logger.getLogger(AdminServiceImpl.class);
}
