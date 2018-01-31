package tk.mybatis.web.service;

import java.util.List;

import tk.mybatis.web.model.Comment;

public interface CommentService {
	
	List<Comment> findAll(Long newsId);

	Boolean save(Comment commentary);
}
