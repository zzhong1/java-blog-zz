package zzblog.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import zzblog.entity.User;

public interface UserRepository extends JpaRepository<User, Integer>{

	User findByName(String name);

}
