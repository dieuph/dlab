package ctu.edu.vn.dlab.service;

import java.util.List;

import ctu.edu.vn.dlab.model.Lab;

public interface LabService {
	public Lab create(Lab lab);

	public Lab delete(int idLab) throws Exception;

	public List<Lab> findAll();

	public Lab update(Lab lab) throws Exception;

	public Lab findById(int idLab);
	
	public List<Lab> findAllByIdTeacher(String idTeacher);
	
	public Lab findByIdLabIdTeacher(int idLab, String idTeacher);
}
