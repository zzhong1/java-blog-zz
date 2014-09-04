package zzblog.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import zzblog.entity.Blog;
import zzblog.entity.User;

public interface BlogRepository extends JpaRepository<Blog, Integer>{

	List<Blog> findByUser(User user);

}
