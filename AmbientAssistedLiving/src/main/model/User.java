package main.model;

//import javax.persistence.*;

//@Entity
//@Table(name = "user")
public class User {
	private int id;
	private String name;
	public enum Role {
		USER,
		FRIEND,
		FAMILY,
		CAREGIVER
	}
	private Role role;
	private int inhabitant_id;
	private String username;
	private String password;
	
	//@Id
	//@Column(name = "user_id")
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public Role getRole() {
		return role;
	}
	
	public void setRole(Role role) {
		this.role = role;
	}
	
	public int getInhabitantId() {
		return inhabitant_id;
	}
	
	public void setInhabitantId(int id) {
		this.id = id;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
}