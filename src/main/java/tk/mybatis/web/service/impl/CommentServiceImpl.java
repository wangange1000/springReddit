package tk.mybatis.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.mybatis.web.mapper.commentMapper;
import tk.mybatis.web.model.Comment;
import tk.mybatis.web.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private commentMapper commentmapper;
	
	@Override
	public List<Comment> findAll(Long newsId) {
		return commentmapper.selectByNewsId(newsId);
	}

	@Override
	public Boolean save(Comment commentary) {
		return commentmapper.insert(commentary)==1;
	}

}