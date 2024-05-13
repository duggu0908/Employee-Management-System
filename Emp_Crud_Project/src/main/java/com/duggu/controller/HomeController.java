package com.duggu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.duggu.dao.EmpDao;
import com.duggu.entity.Emp;


@Controller
public class HomeController {
	
	@Autowired
	private EmpDao empDao ;
	
	@RequestMapping(path="/home")
	public String home(Model m ) {
		//model attribute used for show our data controller to view
		List<Emp> list = empDao.getAllEmp();
		m.addAttribute("empList", list);
		return "home";
	}
	
	@RequestMapping(path="/addEmp")
	public String addEmp() {
		return "add_emp";
	}

	@RequestMapping(path="/createEmp",method = RequestMethod.POST)
	// post method is used for sending our data securely to our back end
	//we also use get method here but its not secure
	public String createEmp(@ModelAttribute Emp emp ,HttpSession session) {
		//@modelattribute is used for getting data front-end to back-end
		//session is used for showing data back-end to front-end
		System.out.println(emp);
		
		int i = empDao.saveEmp(emp);
		session.setAttribute("msg", "Registered Successfully");
		return "redirect:/addEmp";
	}
	@RequestMapping(path="/editEmp/{id}")
	//id get with the help of path variable
	public String editEmp(@PathVariable int id ,Model m) {
		
	 Emp emp =	empDao.getEmpById(id);
	 //print value in boxes
	 m.addAttribute("emp", emp);
	 return "edit_emp";
	}
	@RequestMapping(path="/updateEmp",method=RequestMethod.POST)
	public String updateEmp(@ModelAttribute Emp emp,HttpSession session ) {
		
		empDao.update(emp);
		session.setAttribute("msg", "update successfully");
		return "redirect:/home";
	}
	@RequestMapping("/deleteEmp/{id}")
	public String deleteEmp(@PathVariable int id ,HttpSession session) {
		empDao.deleteEmp(id);
		session.setAttribute("msg", "Emp delete Successfully");
		return "redirect:/home";
	}
}
