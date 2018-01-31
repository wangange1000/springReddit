package tk.mybatis.web.mapper;

import java.util.List;

import tk.mybatis.web.model.News;

public interface newsMapper {

	List<News> selectByNews();
	
	int insert(News news);
	
	News selectByPrimaryKey(Long id);
}
