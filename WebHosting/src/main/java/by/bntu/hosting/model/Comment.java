package by.bntu.hosting.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "comments")
public class Comment {

    @Id
    @GeneratedValue
    @Column(name = "idcomment")
    private Long id;

    @Column(name = "value")
    private String value;

    @Column(name = "idVideo")
    private Long idVideo;

    @Column(name = "username")
    private String userName;

    @Column(name = "datePublication")
    private String datePublication;

    public Comment() {

    }

    public Comment(String value, Long idVideo, String userName) {
	this.value = value;
	this.idVideo = idVideo;
	this.userName = userName;
    }

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public String getDatePublication() {
	return datePublication;
    }

    public void setDatePublication(String datePublication) {
	this.datePublication = datePublication;
    }

    public String getValue() {
	return value;
    }

    public void setValue(String value) {
	this.value = value;
    }

    public Long getIdVideo() {
	return idVideo;
    }

    public void setIdVideo(Long idVideo) {
	this.idVideo = idVideo;
    }

    public String getUserName() {
	return userName;
    }

    public void setUserName(String userName) {
	this.userName = userName;
    }

}
