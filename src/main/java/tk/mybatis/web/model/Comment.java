package tk.mybatis.web.model;

import java.io.Serializable;

public class Comment implements Serializable{
	private static final long serialVersionUID = 1L;

	private Long id;
	private Long newsId;
	private String email;
	private String follower;
	private String commentary;
	private String dateCreated;
	
	public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    
    public Long getNewsId() {
        return newsId;
    }
    public void setNewsId(Long newsId) {
        this.newsId = newsId;
    }
    
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getDateCreated() {
        return dateCreated;
    }
    public void setDateCreated(String dateCreated) {
        this.dateCreated = dateCreated;
    }
    
    public String getFollower() {
        return follower;
    }
    public void setFollower(String follower) {
        this.follower = follower;
    }
    
    public String getCommentary() {
        return commentary;
    }
    public void setCommentary(String commentary) {
        this.commentary = commentary;
    }
}
