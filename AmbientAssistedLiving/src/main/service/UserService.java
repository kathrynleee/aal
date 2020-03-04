package main.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.model.User;
import main.model.User.Role;

@Service
@Transactional(rollbackFor=Exception.class)
public class UserService {
	private User u1 = new User();
	private User u2 = new User();
	
	public Boolean userAuthentication(User user) {
		u1.setRole(Role.USER);
		u1.setUsername("jenny");
		u1.setPassword("1234");
		u2.setRole(Role.FRIEND);
		u2.setUsername("nick");
		u2.setPassword("1234");
		if(user.getUsername().equals(u1.getUsername()) || user.getUsername().equals(u2.getUsername()))
			if(user.getPassword().equals(u1.getPassword()))
				return true;
			else
				return false;
		else 
			return false;
	}
	
	public Role getUserRole(String username) {
		if(username.equals("jenny"))
			return Role.USER;
		else 
			return Role.FRIEND;
	}
}
