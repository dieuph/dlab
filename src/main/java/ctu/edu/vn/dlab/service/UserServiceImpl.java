package ctu.edu.vn.dlab.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ctu.edu.vn.dlab.model.User;
import ctu.edu.vn.dlab.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UserRepository userRepository;
	
	@Override
	@Transactional
	public User create(User user) {
		User createdUser = user;
		return userRepository.save(createdUser);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public User delete(int idUser) throws Exception {
		User deletedUser = findById(idUser);
		
		if (deletedUser == null) {
			throw new Exception();
		}
		
		userRepository.delete(deletedUser);
		return deletedUser;
	}

	@Override
	@Transactional
	public List<User> findAll() {
		return userRepository.findAll();
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public User update(User user) throws Exception {
		User updatedUser = findById(user.getIdUser());
		
		if (updatedUser == null) {
			throw new Exception();
		}
		
		updatedUser.setPassword(user.getPassword());
		updatedUser.setFullName(user.getFullName());
		updatedUser.setEmail(user.getEmail());
		return updatedUser;
	}

	@Override
	@Transactional
	public User findById(int idUser) {
		return userRepository.findOne(idUser);
	}

}
