package ctu.edu.vn.dlab.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ctu.edu.vn.dlab.model.Course;
import ctu.edu.vn.dlab.model.Lab;
import ctu.edu.vn.dlab.model.LabNotify;
import ctu.edu.vn.dlab.model.LabResource;
import ctu.edu.vn.dlab.model.RegistrationLab;
import ctu.edu.vn.dlab.model.RegistrationLabStudent;
import ctu.edu.vn.dlab.model.Student;
import ctu.edu.vn.dlab.model.Teacher;
import ctu.edu.vn.dlab.model.User;
import ctu.edu.vn.dlab.service.CourseService;
import ctu.edu.vn.dlab.service.LabNotifyService;
import ctu.edu.vn.dlab.service.LabResourceService;
import ctu.edu.vn.dlab.service.LabService;
import ctu.edu.vn.dlab.service.RegistrationLabService;
import ctu.edu.vn.dlab.service.TeacherService;
import ctu.edu.vn.dlab.service.UserService;

@Controller
@RequestMapping(value = "/student")
public class StudentController {
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private RegistrationLabService registrationLabService;

	@Autowired
	private LabService labService;
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private TeacherService teacherService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private LabNotifyService labNotifyService;
	
	@Autowired
	private LabResourceService labResourceService;
	
	@RequestMapping(value = "/student-main-page")
	public ModelAndView studentMainPage() {
		try {
			HttpSession httpSession = request.getSession();
			Student student = (Student) httpSession.getAttribute("student");
			
			if (student != null) {
				List<RegistrationLabStudent> registedList = registrationLabService.findRegistedLabByIdStudent(student.getIdStudent());
				
				if (registedList != null) {
					request.setAttribute("registedList", registedList);
				}
				
				return new ModelAndView("pages/student/list_lab");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("redirect:/index");
		}
		
		return new ModelAndView("redirect:/login");
	}
	
	@RequestMapping(value = "/list-lab-no-registed")
	public ModelAndView listLabNoRegisted() {
		try {
			HttpSession httpSession = request.getSession();
			Student student = (Student) httpSession.getAttribute("student");
			if (student != null) {
				List<RegistrationLabStudent> noRegistedList = registrationLabService.findNoRegistedLabByIdStudent(student.getIdStudent());
				List<RegistrationLabStudent> noRegistedListWithTotal = new ArrayList<RegistrationLabStudent>();
				
				if (noRegistedList != null) {
					Long totalRegisted = 0L;
					RegistrationLabStudent reg = null;
					for (RegistrationLabStudent regItem : noRegistedList) {
						totalRegisted = registrationLabService.getTotalByIdLab(Integer.parseInt(regItem.getIdLab()));
						
						reg = regItem;
						reg.setTotalRegisted(totalRegisted.toString());
						
						noRegistedListWithTotal.add(reg);
					}
					request.setAttribute("noRegistedList", noRegistedListWithTotal);
				}
				
				return new ModelAndView("pages/student/register_lab");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("redirect:/index");
		}
		
		return new ModelAndView("redirect:/login");
	}
	
	@RequestMapping(value = "/register-lab")
	public ModelAndView registerLab(@RequestParam("idLab") String idLab,
			RedirectAttributes redirectAttributes) throws Exception {
		
		try {
			HttpSession httpSession = request.getSession();
			Student student = (Student) httpSession.getAttribute("student");
			
			if (student != null) {
				if (idLab != null && Integer.parseInt(idLab) > 0) {
					Lab lab = labService.findById(Integer.parseInt(idLab));				
					
					RegistrationLab createdReg = null;
					
					if (lab != null) {
						Long totalRegisted = registrationLabService.getTotalByIdLab(lab.getIdLab());
						RegistrationLab reg = registrationLabService.getByIdStudent(lab.getIdLab(), student.getIdStudent());
						
						if (reg == null && totalRegisted < lab.getAmount()) {
							reg = new RegistrationLab();
							reg.setIdLab(Integer.parseInt(idLab));
							reg.setIdStudent(student.getIdStudent());
							
							createdReg = registrationLabService.create(reg);
						} else {
							redirectAttributes.addFlashAttribute("add_reglab_limited", "Lớp thực hành đã đăng ký đủ số lượng");
						}
					}
					
					
					if (createdReg != null) {
						redirectAttributes.addFlashAttribute("add_reglab_success", "Đăng ký lớp thực hành thành công");
						
						_log.info("ctu.edu.vn.dlab.controller.StudentController - "
			        			+ "Info. reg lab added. idRegistrationLab=" + createdReg.getIdRegistrationLab());
					} else {
						redirectAttributes.addFlashAttribute("add_reglab_error", "Có lỗi xảy ra. Xin vui lòng thử lại");
						
						_log.error("ctu.edu.vn.dlab.controller.StudentController - "
			        			+ "Error. failed to delete reg lab.");
					}
				}
				
				return new ModelAndView("redirect:/student/list-lab-no-registed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("redirect:/index");
		}
		
		return new ModelAndView("redirect:/login");
	}
	
	@RequestMapping(value = "/un-register-lab")
	public ModelAndView unRegisterLab(@RequestParam("idLab") String idLab,
			RedirectAttributes redirectAttributes) throws Exception {
		
		HttpSession httpSession = request.getSession();
		Student student = (Student) httpSession.getAttribute("student");
		if (student != null && Integer.parseInt(idLab) > 0) {
			RegistrationLab reg = registrationLabService.getByIdStudent(Integer.parseInt(idLab), student.getIdStudent());
			
			if (reg != null) {
				RegistrationLab deletedReg = registrationLabService.delete(reg.getIdRegistrationLab());
				
				if (deletedReg != null) {
					redirectAttributes.addFlashAttribute("delete_reglab_success", "Hủy đăng ký lớp thực hành thành công");
					
					_log.info("ctu.edu.vn.dlab.controller.StudentController - "
		        			+ "Info. reg lab deleted. idRegistrationLab=" + deletedReg.getIdRegistrationLab());
				} else {
					redirectAttributes.addFlashAttribute("delete_reglab_error", "Có lỗi xảy ra. Xin vui lòng thử lại");
					
					_log.error("ctu.edu.vn.dlab.controller.StudentController - "
		        			+ "Error. failed to delete reg lab.");
				}
				
				return new ModelAndView("redirect:/student/student-main-page");
			}
		}
		
		return new ModelAndView("redirect:/login");
	}
	
	@RequestMapping(value = "/detail-lab")
	public ModelAndView detailLab(@RequestParam("idLab") String idLab) {
		try {
			HttpSession httpSession = request.getSession();
			Student student = (Student) httpSession.getAttribute("student");
					
			if (student != null) {
				// for check if student registed in lab
				RegistrationLab reg = registrationLabService.getByIdStudent(Integer.parseInt(idLab), student.getIdStudent());
				
				if (idLab != null && Integer.parseInt(idLab) != 0 && reg != null) {
					Lab labRequest = labService.findById(Integer.parseInt(idLab));
					request.setAttribute("lab", labRequest);
					
					if (labRequest != null) {
						// get info for "thong tin chung" collapse
						Course courseRequest = courseService.findById(labRequest.getIdCourse());
						Teacher teacherRequest = teacherService.findById(labRequest.getIdTeacher());
						User userRequest = userService.findById(teacherRequest.getIdUser());

						request.setAttribute("course", courseRequest);
						request.setAttribute("user", userRequest);

						//get info for "thong bao" collapse
						List<LabNotify> labNotifyListRequest = labNotifyService.findAllByIdLab(labRequest.getIdLab());
						if (labNotifyListRequest != null && labNotifyListRequest.size() > 0) {
							request.setAttribute("labNotifyList", labNotifyListRequest);
						}

						//get info for "bai thuc hanh" collapse
						List<LabResource> labResourceListRequest = labResourceService.findAllByIdLab(labRequest.getIdLab());
						if (labResourceListRequest != null && labResourceListRequest.size() > 0) {
							request.setAttribute("labResourceList", labResourceListRequest);
						}
					}
				}

				return new ModelAndView("pages/student/detail_lab");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("redirect:/index");
		}

		return new ModelAndView("redirect:/login");
	}
	
	@RequestMapping(value = "/load-file-vpn")
	public void loadFileVPN(HttpServletResponse response) {
		try {
			String fileVPN = request.getParameter("fileVPN");

			if (fileVPN != null) {
				File pdfFile = new File(fileVPN);
				String pdfPath = pdfFile.getAbsolutePath();
				String pdfName = pdfPath.substring(pdfPath.lastIndexOf("\\") + 1, pdfPath.length());

				response.setContentType("application/pdf");
				// attachment or inline
				response.addHeader("Content-Disposition", "inline; filename=" + pdfName);
				response.setContentLength((int) pdfFile.length());

				try {
					FileInputStream fis = new FileInputStream(pdfFile);
					ServletOutputStream sos = response.getOutputStream();
					
					int bytes;
					while ((bytes = fis.read()) != -1) {
						sos.write(bytes);
					}
					
					sos.flush();
					fis.close();
					sos.close();
					
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static final Logger _log = Logger.getLogger(StudentController.class);
}
