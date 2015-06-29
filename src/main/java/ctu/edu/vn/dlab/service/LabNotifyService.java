package ctu.edu.vn.dlab.service;

import java.util.List;

import ctu.edu.vn.dlab.model.LabNotify;

public interface LabNotifyService {
	public LabNotify create(LabNotify labNotify);

	public LabNotify delete(int idLabNotify) throws Exception;

	public List<LabNotify> findAll();

	public LabNotify update(LabNotify labNotify) throws Exception;

	public LabNotify findById(int idLabNotify);
	
	public List<LabNotify> findAllByIdLab(int idLab);
}
