package main.controller;

import main.model.User;
import main.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/restapi")
public class RestAALController {

    @Autowired
    UserService userService;
    
    @ModelAttribute
    public void setResponseHeader(HttpServletResponse response) {
    	response.setHeader("Cache-Control", "no-cache");
    }
    
    @RequestMapping(value="/login")
    @ResponseBody
	public String login(HttpServletRequest request, 
			@RequestParam(value = "username", required=true) String username,
			@RequestParam(value = "password", required=true) String password) {

    	User user = new User();
    	user.setUsername(username);
    	user.setPassword(password);
    	System.out.println("username = " + user.getUsername());
    	System.out.println("password = " + user.getPassword());
    	System.out.println(userService.getUserRole(user.getUsername()).toString());
    	if(userService.userAuthentication(user))
    		return userService.getUserRole(user.getUsername()).toString();
    	else
    		return "Fail";
    }
}
