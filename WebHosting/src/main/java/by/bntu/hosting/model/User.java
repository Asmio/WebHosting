package by.bntu.hosting.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class User {

    @Id
    @Column(name = "username")
    private String username;

    @Column(name = "password")
    private String password;

    @Column(name = "confirmpassword")
    private String confirmPassword;

    @Column(name = "description")
    private String description;

    @Column(name = "enabled")
    private int enabled;

    public User() {

    }

    public User(String username, String password) {
	this.username = username;
	this.password = password;
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

    public String getConfirmPassword() {
	return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
	this.confirmPassword = confirmPassword;
    }

    public String getDescription() {
	return description;
    }

    public void setDescription(String description) {
	this.description = description;
    }

    public int getEnabled() {
	return enabled;
    }

    public void setEnabled(int enabled) {
	this.enabled = enabled;
    }

}
