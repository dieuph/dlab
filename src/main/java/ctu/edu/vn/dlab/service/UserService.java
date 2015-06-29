package ctu.edu.vn.dlab.service;

import java.util.List;

import ctu.edu.vn.dlab.model.User;

public interface UserService {
	public User create(User user);

	public User delete(int idUser) throws Exception;

	public List<User> findAll();

	public User update(User user) throws Exception;

	public User findById(int idUser);
}
