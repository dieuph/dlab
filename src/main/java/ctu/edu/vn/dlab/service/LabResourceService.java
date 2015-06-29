package ctu.edu.vn.dlab.service;

import java.util.List;

import ctu.edu.vn.dlab.model.LabResource;

public interface LabResourceService {
	public LabResource create(LabResource labResource);

	public LabResource delete(int idLabResource) throws Exception;

	public List<LabResource> findAll();

	public LabResource update(LabResource labResource) throws Exception;

	public LabResource findById(int idLabResource);
	
	public List<LabResource> findAllByIdLab(int idLab);
}
