package ctu.edu.vn.dlab.service;

import java.util.List;

import ctu.edu.vn.dlab.model.Admin;

public interface AdminService {
	public Admin create(Admin admin);

	public Admin delete(String idAdmin) throws Exception;

	public List<Admin> findAll();

	public Admin update(Admin admin) throws Exception;

	public Admin findById(String idAdmin);
}
