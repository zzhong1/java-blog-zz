package zzblog.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import zzblog.entity.Blog;
import zzblog.entity.Item;
import zzblog.entity.Role;
import zzblog.entity.User;
import zzblog.repository.BlogRepository;
import zzblog.repository.ItemRepository;
import zzblog.repository.RoleRepository;
import zzblog.repository.UserRepository;

@Service
@Transactional
public class UserService {
	
	@Autowired
	private RoleRepository roleReepository;
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BlogRepository blogRepository;
	
	@Autowired
	private ItemRepository itemRepository;
	
	public List<User> findAll(){
		return userRepository.findAll();
	}

	public User findOne(int id) {
		return userRepository.findOne(id);
	}

	@Transactional
	public User findOneWithBlogs(int id) {
		
		User user = findOne(id);
		List<Blog> blogs = blogRepository.findByUser(user);
		for (Blog blog:blogs){
			
			List<Item> items = itemRepository.findByBlog(blog, new PageRequest(0,10,Direction.DESC,"publishedDate" ));
			blog.setItems(items);
		}
		user.setBlogs(blogs);
		return user;
	}


	public void save(User user) {
		user.setEnabled(true);
		
		BCryptPasswordEncoder encoder  = new BCryptPasswordEncoder();
		user.setPassword(encoder.encode(user.getPassword()));
		List<Role> roles = new ArrayList<Role>();
		roles.add(roleReepository.findByName("ROLE_USER"));
		user.setRoles(roles);
		userRepository.save(user);
	}

	public User findOneWithBlogs(String name) {
		User user = userRepository.findByName(name);
		return findOneWithBlogs(user.getId());
	}
		
}
