package tk.mybatis.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.mybatis.web.model.News;
import tk.mybatis.web.service.NewsService;
import tk.mybatis.web.mapper.newsMapper;

@Service
public class NewsServiceImpl implements NewsService {

	@Autowired
	private newsMapper newsmapper;
	
	@Override
	public List<News> findAll() {
		return newsmapper.selectByNews();
	}

	@Override
	public Boolean save(News news) {
        return newsmapper.insert(news) == 1;
	}
	
	@Override
	public News findNewsById(Long newsId) {
		return newsmapper.selectByPrimaryKey(newsId);
	}
}
