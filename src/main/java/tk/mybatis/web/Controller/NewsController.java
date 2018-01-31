package tk.mybatis.web.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import tk.mybatis.web.model.News;
import tk.mybatis.web.service.NewsService;

@Controller
@RequestMapping("/newsBoard")
public class NewsController {
	@Autowired
	private NewsService newsservice;
	
	/**
     * 
     * @param newsTitle
     * @param content
     * @param postedBy
     * @param email
     */
	
	@RequestMapping
    public ModelAndView news(Integer offset, Integer limit) {
        ModelAndView mv = new ModelAndView("newsBoard");
        List<News> news = newsservice.findAll();
        mv.addObject("news", news);
        return mv;
    }
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
    public ModelAndView save(News news) {
		ModelAndView mv = new ModelAndView();
		try {
			newsservice.save(news);
			System.out.println("*****************Name:" + news.getNewsTitle());
			mv.setViewName("redirect:/newsBoard");	
		}catch(Exception e) {
			mv.setViewName("redirect:/newsBoard");
            mv.addObject("msg", e.getMessage());
            mv.addObject("model", news);
		}
		return mv;
	}
}
