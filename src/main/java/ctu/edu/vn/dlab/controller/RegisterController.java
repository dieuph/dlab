package ctu.edu.vn.dlab.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ctu.edu.vn.dlab.common.MD5Digest;
import ctu.edu.vn.dlab.model.Student;
import ctu.edu.vn.dlab.model.User;
import ctu.edu.vn.dlab.service.StudentService;
import ctu.edu.vn.dlab.service.UserService;

@Controller
public class RegisterController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private StudentService studentService;
		
	@RequestMapping(value = "/register/action")
	public ModelAndView register(HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes redirectAttributes) throws IOException {
		ModelAndView mav = new ModelAndView();
		
		try {
			request.setCharacterEncoding("UTF-8");
			
			// get request parameter
			String idStudent = request.getParameter("idStudent");
			String fullName = request.getParameter("fullName");
			String password = MD5Digest.toMd5(request.getParameter("password"));
			String idStudentClass = request.getParameter("idStudentClass");
			String email = request.getParameter("email");
			
			Student newStudent = studentService.findById(idStudent);
			User newUser = null;
			
			// check student id exists
			if (newStudent == null) {
				newUser = new User();
				newUser.setPassword(password);
				newUser.setFullName(fullName);
				newUser.setEmail(email);
				
				newUser = userService.create(newUser);
				
				if (newUser != null) {
					newStudent = new Student();
					newStudent.setIdStudent(idStudent);
					newStudent.setIdStudentClass(idStudentClass);
					newStudent.setIdUser(newUser.getIdUser());
					
					newStudent = studentService.create(newStudent);
				}
				
				if (newStudent != null) {
					redirectAttributes.addFlashAttribute("create_student_success", "Đăng ký tài khoản thành công");
					_log.info("ctu.edu.vn.dlab.controller.RegisterController - "
							+ "Info. new student account created. idstudent=" + idStudent);
				}
			} else {
				redirectAttributes.addFlashAttribute("studentid_exists", "Mã số đã được đăng ký");
				_log.error("ctu.edu.vn.dlab.controller.RegisterController - "
						+ "Error. student id exists. idstudent=" + idStudent);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("redirect:/register");
		}
		
		mav.setViewName("redirect:/register");
		return mav;
	}
	
	private static final Logger _log = Logger.getLogger(RegisterController.class);
}
