package tk.mybatis.web.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import tk.mybatis.web.model.Comment;
import tk.mybatis.web.model.News;
import tk.mybatis.web.service.CommentService;
import tk.mybatis.web.service.NewsService;

@Controller
@RequestMapping("/commentBoard")
public class CommentController {
	
	@Autowired
	private CommentService commentservice;
	@Autowired
	private NewsService newsservice;

	@RequestMapping(value = "comment", method = RequestMethod.GET)
    public ModelAndView comment(Long newsId) {
		ModelAndView mv = new ModelAndView("commentBoard");
		List<Comment> comments = commentservice.findAll(newsId);
		News news = newsservice.findNewsById(newsId);
		
		mv.addObject("newsId", newsId);
		mv.addObject("news", news);
		mv.addObject("comments", comments);
		return mv;
	}
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
    public ModelAndView save(Comment commentary, Long newsId){
		ModelAndView mv = new ModelAndView();
		try {
			commentary.setNewsId(newsId);
			commentservice.save(commentary);
			System.out.println("*****************Name:" + commentary.getFollower());
			mv.setViewName("redirect:/commentBoard/comment?newsId=" + newsId);	
		}catch(Exception e) {
			mv.setViewName("commentBoard");
            mv.addObject("msg", e.getMessage());
            mv.addObject("model", commentary);
		}
		return mv;
	}
}
