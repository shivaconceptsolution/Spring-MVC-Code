package bao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdditionDemo {

	@RequestMapping("/add")
	public ModelAndView addLogic(HttpServletRequest req,HttpServletResponse res) {
		if(req.getParameter("btnsubmit")!=null)
		{
			int a = Integer.parseInt(req.getParameter("txtnum1"));
			int b = Integer.parseInt(req.getParameter("txtnum2"));
			int c=a+b;
			return new ModelAndView("addition","msg",c);
		}
		else
		{
		return new ModelAndView("addition");
		}
	}
}
