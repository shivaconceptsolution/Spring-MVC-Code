package template;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class HiberTemplate {
	static Configuration cfg; 
	static SessionFactory sf;
	static Session s ;
	public static void setConfiguration() {
		 cfg= new Configuration();
		 cfg.configure("hibernate.cfg.xml");
		 sf = cfg.buildSessionFactory();
		 s= sf.openSession();	
	}
	public static Query getData(String str) {
		Query q = s.createQuery(str);
		return q;
		
	}
	public static void InsertOperation(Object c) {
		Transaction tx = s.beginTransaction();
		s.save(c);
		tx.commit();
		
	}
	public static Object findOperation(Class c,int id)
	{
		Object q = s.get(c, id);
		return q;
	}
	public static Object findOperation(Class c,String id)
	{
		Object q = s.get(c, id);
		return q;
	}
	public static void updateOperation(Object o)
	{
		
		Transaction tx = s.beginTransaction();
		s.update(o);
		tx.commit();
	}
	public static void deleteOperation(Object o)
	{
		
		Transaction tx = s.beginTransaction();
		s.delete(o);
		tx.commit();
	}
	public static void closeConn() 
	{
		sf.close();
	}
}
