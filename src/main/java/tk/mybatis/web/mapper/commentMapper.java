package tk.mybatis.web.mapper;

import java.util.List;

import tk.mybatis.web.model.Comment;

public interface commentMapper {
	
	List<Comment> selectByNewsId(Long newsId);
	
	int insert(Comment comment);
}
