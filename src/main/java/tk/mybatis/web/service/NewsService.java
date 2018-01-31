package tk.mybatis.web.service;

import java.util.List;

import tk.mybatis.web.model.News;

public interface NewsService {
	
	List<News> findAll();
	
	Boolean save(News news);
	
	News findNewsById(Long newsId);
}
