package bao;

import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Iterator;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dao.*;
import template.*;
@Controller
public class Guest {

	@RequestMapping("/checkdata")
	public ModelAndView checkdata(HttpServletRequest req,HttpServletResponse res)
	{
		String str = req.getParameter("q");
		return new ModelAndView("checkdata","msg",str) ;
	}
	@RequestMapping("/showdata")
	public ModelAndView showdata(HttpServletRequest req,HttpServletResponse res)
	{
		String str = req.getParameter("q");
		return new ModelAndView("showdata","msg",str) ;
	}
	@RequestMapping("/upload")
	public ModelAndView uploadfile()
	{
		return new ModelAndView("upload");
	}
	@RequestMapping("/savefile")
	public ModelAndView savefile(@RequestParam CommonsMultipartFile file,HttpSession session,HttpServletRequest request,HttpServletResponse response)
	{
		String path=session.getServletContext().getRealPath("/");  
        String filename=file.getOriginalFilename(); 
        String desc="";
       
        	desc= request.getParameter("txtdesc");
       
        try{  
            byte barr[]=file.getBytes();  
            HiberTemplate.setConfiguration();
           
            FileOutputStream fi = new FileOutputStream(path+"/"+filename);  
            BufferedOutputStream bout=new BufferedOutputStream(fi);  
            bout.write(barr); 
            HiberTemplate.InsertOperation(new Upload(filename,desc));
            HiberTemplate.closeConn();
            bout.flush();  
            bout.close();  
              
            }
        catch(Exception e)
        {
        	System.out.println(e);
        }  
		return new ModelAndView("upload","fname",filename);
		
	}
	@RequestMapping("/login")
	public ModelAndView login()
	{
		
		
		return new ModelAndView("login");
	}
	@RequestMapping("dashboard")
	public ModelAndView dashboard(HttpServletRequest request,HttpServletResponse response)
	{
		
		    String res="";
		      
			
			Configuration cfg= new Configuration();
			cfg.configure("hibernate.cfg.xml");
			SessionFactory sf = cfg.buildSessionFactory();
			Session s= sf.openSession();	
		  //  HiberTemplate.setConfiguration();
		    Query q = s.createSQLQuery("select * from tbl_reg where username='"+request.getParameter("txtuser")+"' and password='"+request.getParameter("txtpass")+"'");
		   // Query q = HiberTemplate.getData("from Reg r where r.username=? and r.password=?");
		   // q.setString(0,request.getParameter("txtuser"));
			//q.setString(1,request.getParameter("txtpass"));
			List lst = q.list();
			Iterator it = lst.iterator();
			//Reg r=null;
			HttpSession session = request.getSession();
			/*if(it.hasNext())
			{
			 r= (Reg)it.next();
			}*/
			if(lst.size()>0)
			{
				//session.setAttribute("uid",r.getUsername());
				res="dashboard";
			  /*  if(r.getRole().equals("1")) 
			    {
				res="dashboard";
			    }
			    else
			    {
			    res="admindash";	
			    }*/
			    return new ModelAndView(res);
			}
			else
			{
				res = "invalid userid and password";
				 return new ModelAndView("login","msg",res);
			}
		/*	Configuration cfg = new Configuration();
			cfg.configure("hibernate.cfg.xml");
			SessionFactory sf = cfg.buildSessionFactory();
			Session s = sf.openSession();
			Query q = s.createQuery("from Reg r where r.username=? and r.password=?");
			q.setString(0,request.getParameter("txtuser"));
			q.setString(1,request.getParameter("txtpass"));
			List lst = q.list();
			Iterator it = lst.iterator();
			Reg r=null;
			HttpSession session = request.getSession();
			if(it.hasNext())
			{
			 r= (Reg)it.next();
			}
			if(lst.size()>0)
			{
				session.setAttribute("uid",r.getUsername());
				
			    if(r.getRole().equals("1")) 
			    {
				res="dashboard";
			    }
			    else
			    {
			    res="admindash";	
			    }
			    return new ModelAndView(res);
			}
			else
			{
				res = "invalid userid and password";
				 return new ModelAndView("login","msg",res);
			}*/
			
			
	}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session = request.getSession();
		session.removeAttribute("uid");
		session.invalidate();
		response.setHeader("Cache-Control","no-cache");
		response.setHeader("Cache-Control","no-store");
		response.setHeader("Pragma","no-cache");
		response.setDateHeader ("Expires", 0);
		return "login";
	}
	
	@RequestMapping("/home")
	public ModelAndView home(HttpServletRequest req,HttpServletResponse res)
	{
		String s1="";
		if(req.getParameter("btnsubmit")!=null)
		{
		/*Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory sf = cfg.buildSessionFactory();
		Session s = sf.openSession();*/
		Reg r = new Reg();
		r.setUsername(req.getParameter("txtuser"));
		r.setPassword(req.getParameter("txtpass"));
		r.setMobile(req.getParameter("txtmobile"));
		HiberTemplate.setConfiguration();
		Reg r1 = (Reg)HiberTemplate.findOperation(Reg.class,r.getUsername());
		if(r1!=null)
		{
			s1 = "User Already Exist";
		
		}
		else
		{
			HiberTemplate.InsertOperation(r);
			HiberTemplate.closeConn();
			s1="Registration successfully";
		}
		//Transaction tx = s.beginTransaction();
		//s.save(r);
		//tx.commit();
		//s.close();
		
		}
		
	    return new ModelAndView("home","msg",s1);
	}
	@RequestMapping("/FindReg")
	public ModelAndView findreg(HttpServletRequest req,HttpServletResponse res)
	{
		HiberTemplate.setConfiguration();
	    Reg r=(Reg)HiberTemplate.findOperation(Reg.class,req.getParameter("q"));
		return new ModelAndView("findreg","data",r);
	}
	@RequestMapping("/editreg")
	public String EditReg(HttpServletRequest req,HttpServletResponse res)
	{
		Reg r = new Reg();
		r.setUsername(req.getParameter("txtuser"));
		r.setPassword(req.getParameter("txtpass"));
		r.setMobile(req.getParameter("txtmobile"));
		HiberTemplate.setConfiguration();
		HiberTemplate.updateOperation(r);;
		HiberTemplate.closeConn();
		return "home";
	}
	@RequestMapping("/DeleteReg")
	public String DeleteReg(HttpServletRequest req,HttpServletResponse res)
	{
		
		
		HiberTemplate.setConfiguration();
		Reg r = (Reg)HiberTemplate.findOperation(Reg.class,req.getParameter("q"));
		HiberTemplate.deleteOperation(r);
		HiberTemplate.closeConn();
		return "home";
	}
	@RequestMapping("/about")
	
	public ModelAndView about()
	{
		return new ModelAndView("about");
	}
	@RequestMapping("/services")
	public ModelAndView services()
	{
		return new ModelAndView("services");
	}
	@RequestMapping("/gallery")
	public ModelAndView gallery()
	{
		ModelAndView gallery=new ModelAndView("gallery");
		return gallery;
	}
	@RequestMapping("/contact")
	public ModelAndView contact()
	{
		return new ModelAndView("contact");
	}
}
