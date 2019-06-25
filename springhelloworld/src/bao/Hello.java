package bao;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Hello {
	@RequestMapping("/abc")
	public String fun()
	{
		return "hello";
	}

}
