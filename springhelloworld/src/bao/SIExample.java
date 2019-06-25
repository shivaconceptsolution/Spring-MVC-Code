package bao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SIExample {
	@RequestMapping("/si")
	public ModelAndView calc()
	{
		return new ModelAndView("siview");
	}
	@RequestMapping("/sicalc")
	public ModelAndView sicalc(HttpServletRequest request,HttpServletResponse response)
	{
        float p = Float.parseFloat(request.getParameter("txtp"));
        float r = Float.parseFloat(request.getParameter("txtr"));
        float t = Float.parseFloat(request.getParameter("txtt"));
        float si = (p*r*t)/100;
		return new ModelAndView("siview","res",si);
	}
	

}
