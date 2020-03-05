package main.controller;

import main.model.User;
import main.service.UserService;

import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/restapi")
public class RestAALController {

    @Autowired
    UserService userService;
    
    @RequestMapping(value="/login", produces="application/json;")
	public ResponseEntity<String> login(HttpServletRequest request, 
			@RequestParam(value = "username") String username,
			@RequestParam(value = "password") String password) {

    	User user = new User();
    	user.setUsername(username);
    	user.setPassword(password);
    	System.out.println("username = " + user.getUsername());
    	System.out.println("password = " + user.getPassword());
    	System.out.println(userService.getUserRole(user.getUsername()).toString());
    	if(userService.userAuthentication(user))
    		return new ResponseEntity<String>(userService.getUserRole(user.getUsername()).toString(), HttpStatus.OK);
    	else
    		return new ResponseEntity<String>("Fail", HttpStatus.OK);
    }
    
    @PostMapping("/upload")
	public ResponseEntity<String> uploadData(@RequestParam("file") MultipartFile file) throws Exception {
		if (file == null) {
			throw new RuntimeException("You must select the a file for uploading");
		}
		InputStream inputStream = file.getInputStream();
		String originalName = file.getOriginalFilename();
		String name = file.getName();
		String contentType = file.getContentType();
		long size = file.getSize();
		System.out.println("inputStream: " + inputStream);
		System.out.println("originalName: " + originalName);
		System.out.println("name: " + name);
		System.out.println("contentType: " + contentType);
		System.out.println("size: " + size);
		// Do processing with uploaded file data in Service layer
		return new ResponseEntity<String>(originalName, HttpStatus.OK);
	}
}
