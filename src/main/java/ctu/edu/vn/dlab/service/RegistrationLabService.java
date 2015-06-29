package ctu.edu.vn.dlab.service;

import java.util.List;

import ctu.edu.vn.dlab.model.RegistrationLab;
import ctu.edu.vn.dlab.model.RegistrationLabStudent;
import ctu.edu.vn.dlab.model.RegistrationLabTeacher;

public interface RegistrationLabService {
	public RegistrationLab create(RegistrationLab registrationLab);

	public RegistrationLab delete(int idRegistrationLab) throws Exception;

	public List<RegistrationLab> findAll();

	public RegistrationLab update(RegistrationLab registrationLab) throws Exception;

	public RegistrationLab findById(int idRegistrationLab);
	
	public List<RegistrationLab> findAllByIdLab(int idLab);
	
	public List<RegistrationLabTeacher> findByIdLab(int idLab);
	
	public List<RegistrationLabStudent> findRegistedLabByIdStudent(String idStudent);
	
	public List<RegistrationLabStudent> findNoRegistedLabByIdStudent(String idStudent);
	
	public RegistrationLab getByIdStudent(int idLab, String idStudent);
	
	public Long getTotalByIdLab(int idLab);

}
