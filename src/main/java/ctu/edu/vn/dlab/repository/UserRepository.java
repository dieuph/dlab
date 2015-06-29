package ctu.edu.vn.dlab.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import ctu.edu.vn.dlab.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {

}
