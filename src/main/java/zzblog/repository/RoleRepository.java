package zzblog.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import zzblog.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Integer>{

	Role findByName(String string);

}
