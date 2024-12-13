package org.jsp;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class UserController {
	static EntityManagerFactory emf=Persistence.createEntityManagerFactory("dev");
	static EntityManager em=emf.createEntityManager();
	static EntityTransaction et=em.getTransaction();
	
 @RequestMapping("/reg")
 public ModelAndView saveUser(@RequestParam String name,
		                      @RequestParam String email,
		                      @RequestParam long phone,
		                      @RequestParam int age,
		                      @RequestParam String password) 
 {
	
	 et.begin();
	 User u = em.merge(new User(0, name, email, phone, age, password));
	 et.commit();
	 ModelAndView mv = new ModelAndView();
	 mv.setViewName("success.jsp");
	 mv.addObject("id", u.getId());
	 mv.addObject("name",u.getName());
	 mv.addObject("email",u.getEmail());
	 mv.addObject("phone",u.getPhone());
	 mv.addObject("age",u.getAge());
	 mv.addObject("password",u.getPassword());
	 return mv;
 }
 @RequestMapping("/regpage")
 public ModelAndView regPage() {
	 
	 ModelAndView mv = new ModelAndView();
	 mv.setViewName("reg.jsp");
	 return mv;
	 
 }
 @RequestMapping("/allusers")
 public ModelAndView findAllUsers() {
	 Query q = em.createQuery("from User");
	 List ul = q.getResultList();
	 ModelAndView mv = new ModelAndView();
	 mv.setViewName("allusers.jsp");
	 mv.addObject("users",ul);
	 
	 
	 return mv; 
 }
 @RequestMapping("/delete")
 public ModelAndView deleteUserById(@RequestParam int id) {
	
	User u = em.find(User.class, id);
	if(u!=null) {
		et.begin();
		em.remove(u);
		et.commit();
		return findAllUsers();
	}
	else {
		
	}
	
	 ModelAndView mv = new ModelAndView();
	 mv.setViewName("index.jsp");
	 mv.addObject("msg", "invalid user id");
	 return mv;
 }
 @RequestMapping("/updatepage")
 public ModelAndView updatePage(@RequestParam int id) {
	 
	 User user= em.find(User.class, id);
	 ModelAndView mv = new ModelAndView();
	 mv.setViewName("update.jsp");
	 mv.addObject("u", user);
	 
	 return mv;
  }
 @RequestMapping("/update")
 public ModelAndView update(@RequestParam int id,
		                    @RequestParam String name,
                            @RequestParam String email,
                            @RequestParam long phone,
                            @RequestParam int age,
                            @RequestParam String password) {
	 
	 User u = em.find(User.class, id);
	 u.setName(name);
	 u.setEmail(email);
	 u.setPhone(phone);
	 u.setAge(age);
	 u.setPassword(password);
	 
	 et.begin();
	 em.merge(u);
	 et.commit();
	 return findAllUsers();
	
 }
}
