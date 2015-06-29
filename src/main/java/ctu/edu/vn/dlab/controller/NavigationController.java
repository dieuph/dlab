package ctu.edu.vn.dlab.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ctu.edu.vn.dlab.model.StudentClass;
import ctu.edu.vn.dlab.service.StudentClassService;

@Controller
public class NavigationController {
	
	@Autowired
	private StudentClassService studentClassService;
	
	@RequestMapping(value = "/")
	public ModelAndView mainPage() {
		return new ModelAndView("index");
	}

	@RequestMapping(value = "/index")
	public ModelAndView indexPage() {
		return new ModelAndView("index");
	}
	
	@RequestMapping(value = "/login")
	public ModelAndView loginPage() {
		return new ModelAndView("login");
	}
	
	@RequestMapping(value = "/register")
	public ModelAndView registerPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			List<StudentClass> stuClassList = studentClassService.findAll();
			request.setAttribute("stuClassList", stuClassList);
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("register");
		}
		return new ModelAndView("register");
	}
	
	@RequestMapping(value = "/forgotpassword")
	public ModelAndView forgotPasswordPage() {
		return new ModelAndView("forgotpassword");
	}
	
}
