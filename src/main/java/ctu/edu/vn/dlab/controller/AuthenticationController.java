package ctu.edu.vn.dlab.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ctu.edu.vn.dlab.common.MD5Digest;
import ctu.edu.vn.dlab.model.Student;
import ctu.edu.vn.dlab.model.StudentSession;
import ctu.edu.vn.dlab.model.Teacher;
import ctu.edu.vn.dlab.model.TeacherSession;
import ctu.edu.vn.dlab.model.User;
import ctu.edu.vn.dlab.service.StudentService;
import ctu.edu.vn.dlab.service.TeacherService;
import ctu.edu.vn.dlab.service.UserService;

@Controller
public class AuthenticationController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private TeacherService teacherService;
	
	@RequestMapping(value = "/login/action")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes redirectAttributes) throws IOException {
		ModelAndView mav = new ModelAndView();
		
		try {
			String userid = request.getParameter("userid");
			String password = MD5Digest.toMd5(request.getParameter("password"));
			
			Student student = studentService.findById(userid);
			Teacher teacher = teacherService.findById(userid);
			
			User user = null;
			boolean isStudent = false;
			boolean isTeacher = false;
			
			// check student account
			if (student != null) {
				user = userService.findById(student.getIdUser());
				isStudent = true;
			}
			
			// check teacher account
			if (teacher != null) {
				user = userService.findById(teacher.getIdUser());
				isTeacher = true;
			}
			
			// check password account
			if (user != null && password.equals(user.getPassword())) {
				HttpSession httpSession = request.getSession();
				if (isStudent) {
					mav.setViewName("redirect:/student/student-main-page");
					StudentSession studentSession = new StudentSession(student);
					studentSession.setFullName(user.getFullName());
					studentSession.setEmail(user.getEmail());
					httpSession.setAttribute("student", studentSession);
					_log.info("ctu.edu.vn.dlab.controller.AuthenticationController - "
							+ "Info. student account login success. id=" + studentSession.getIdStudent());
				}
				
				if (isTeacher) {
					mav.setViewName("redirect:/teacher/teacher-main-page");
					TeacherSession teacherSession = new TeacherSession(teacher);
					teacherSession.setFullName(user.getFullName());
					teacherSession.setEmail(user.getEmail());
					httpSession.setAttribute("teacher", teacherSession);
					_log.info("ctu.edu.vn.dlab.controller.AuthenticationController - "
							+ "Info. teacher account login success. id=" + teacherSession.getIdTeacher());
				}
			} else {
				redirectAttributes.addFlashAttribute("login_error", "Sai tên đăng nhập hoặc mật khẩu");
				mav.setViewName("redirect:/login");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("redirect:/login");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/logout/action")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		ModelAndView mav = new ModelAndView();
		
		try {
			HttpSession httpSession = request.getSession();
			httpSession.invalidate();
			mav.setViewName("redirect:/index");
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("redirect:/index");
		}
		
		return mav;
	}
	
	private static final Logger _log = Logger.getLogger(AuthenticationController.class);
}
