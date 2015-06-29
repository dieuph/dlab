package ctu.edu.vn.dlab.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ctu.edu.vn.dlab.common.DateTimeFormatImpl;
import ctu.edu.vn.dlab.common.ServerFileImpl;
import ctu.edu.vn.dlab.model.Course;
import ctu.edu.vn.dlab.model.Lab;
import ctu.edu.vn.dlab.model.LabNotify;
import ctu.edu.vn.dlab.model.LabResource;
import ctu.edu.vn.dlab.model.RegistrationLabTeacher;
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
@RequestMapping(value = "/teacher")
public class TeacherController {
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private LabService labService;
	
	@Autowired
	private TeacherService teacherService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private LabNotifyService labNotifyService;
	
	@Autowired
	private LabResourceService labResourceService;
	
	@Autowired
	private RegistrationLabService registrationLabService;
	
	@RequestMapping(value = "/teacher-main-page")
	public ModelAndView teacherMainPage() {
		try {
			// get session
			HttpSession httpSession = request.getSession();
			Teacher teacher = (Teacher) httpSession.getAttribute("teacher");
			
			// check session
			if (teacher != null) {
				List<Lab> labs = labService.findAllByIdTeacher(teacher.getIdTeacher());
				
				if (labs.size() > 0) {
					request.setAttribute("labs", labs);
				}
				
				return new ModelAndView("pages/teacher/list_lab");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// redirect
		return new ModelAndView("redirect:/login");
	}
	
	
	@RequestMapping(value = "/create-lab")
	public ModelAndView createLab() {
		try {
			// get session
			HttpSession httpSession = request.getSession();
			Teacher teacher = (Teacher) httpSession.getAttribute("teacher");
			
			// check session
			if (teacher != null) {
				List<Course> courses = courseService.findAll();
				request.setAttribute("courses", courses);
				
				return new ModelAndView("pages/teacher/create_lab");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// redirect
		return new ModelAndView("redirect:/login");
	}
	
	@RequestMapping(value = "/manager-lab")
	public ModelAndView managerLab(@RequestParam("idLab") String idLab) {
		try {
			// get session
			HttpSession httpSession = request.getSession();
			Teacher teacher = (Teacher) httpSession.getAttribute("teacher");
			
			// get value from another controller if request not from view
			if (idLab == null) {
				idLab = (String) request.getAttribute("idLab");
			}
			
			// check session and get common infomation lab
			if (teacher != null) {
				if (idLab != null) {
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
					
					// get cources for "cap nhat thong tin chung" modal
					List<Course> courses = courseService.findAll();
					request.setAttribute("courses", courses);
				}
				return new ModelAndView("pages/teacher/manager_lab");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// redirect
		return new ModelAndView("redirect:/login");
	}
	
	@RequestMapping(value = "/update-lab")
	public ModelAndView updateLab(RedirectAttributes redirectAttributes,
			@RequestParam("idLab") String idLab,
			@RequestParam("name") String name,
			@RequestParam("amount") String amount,
			@RequestParam("idCourse") String idCourse,
			@RequestParam("fileVPN") MultipartFile fileVPN) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		try {
			// get request and session
			request.setCharacterEncoding("UTF-8");
			HttpSession httpSession = request.getSession();
			Teacher teacher = (Teacher) httpSession.getAttribute("teacher");
		    
			// update lab
			Lab lab = labService.findById(Integer.parseInt(idLab));
			Lab updatedLab = null;
			if (teacher != null && lab != null) {			
				lab.setName(name); 
				lab.setAmount(Integer.parseInt(amount));
				lab.setIdCourse(idCourse);
				lab.setIdTeacher(teacher.getIdTeacher());
				
				if (!fileVPN.isEmpty()) {
					String fileVPNPath = ServerFileImpl.storeFile(fileVPN);
					lab.setFileVPN(fileVPNPath);				
				}
				
				updatedLab = labService.update(lab);
			}
			
			// redirect to manager page
			if (updatedLab != null) {
				redirectAttributes.addFlashAttribute("update_lab_success", "Cập nhật lớp thực hành thành công");
				
				_log.info("ctu.edu.vn.dlab.controller.TeacherController - "
	        			+ "Info. lab updated. idLab=" + lab.getIdLab());
			} else {
				redirectAttributes.addFlashAttribute("update_lab_error", "Có lỗi xảy ra. Xin vui lòng thử lại");
				
				_log.error("ctu.edu.vn.dlab.controller.TeacherController - "
	        			+ "Error. failed to update lab.");
			}
			
			mav.addObject("idLab", idLab);
			mav.setViewName("redirect:/teacher/manager-lab");
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("redirect:/index");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/delete-lab")
	public ModelAndView deleteLab(RedirectAttributes redirectAttributes,
			@RequestParam("idLab") String idLab) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		try {
			// delete lab
			Lab lab = labService.delete(Integer.parseInt(idLab));
			
			if (lab != null) {
				redirectAttributes.addFlashAttribute("delete_lab_success", "Xóa lớp thực hành thành công");
				
				_log.info("ctu.edu.vn.dlab.controller.TeacherController - "
	        			+ "Info. lab deleted. idLab=" + lab.getIdLab());
			} else {
				redirectAttributes.addFlashAttribute("delete_lab_error", "Có lỗi xảy ra. Xin vui lòng thử lại");
				
				_log.error("ctu.edu.vn.dlab.controller.TeacherController - "
	        			+ "Error. failed to delete lab.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// redirect
		mav.setViewName("redirect:/teacher/teacher-main-page");
		return mav;
	}
	
	@RequestMapping(value = "/delete-lab-notify")
	public ModelAndView deleteLabNotify(RedirectAttributes redirectAttributes,
			@RequestParam("idLab") String idLab, 
			@RequestParam("idLabNotify") String idLabNotify) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		try {
			HttpSession httpSession = request.getSession();
			Teacher teacher = (Teacher) httpSession.getAttribute("teacher");
			
			Lab lab = labService.findByIdLabIdTeacher(Integer.parseInt(idLab), teacher.getIdTeacher());
			LabNotify labNotify = null;

			if (lab != null) {
				labNotify = labNotifyService.delete(Integer.parseInt(idLabNotify));
			} 
			
			if (labNotify != null) {
				redirectAttributes.addFlashAttribute("delete_lab_notify_success", "Xóa thông báo thành công");
				
				_log.info("ctu.edu.vn.dlab.controller.TeacherController - "
	        			+ "Info. lab notify deleted. idLabNotify=" + labNotify.getIdLabNotify());
			} else {
				redirectAttributes.addFlashAttribute("delete_lab_notify_error", "Có lỗi xảy ra. Xin vui lòng thử lại");
				
				_log.error("ctu.edu.vn.dlab.controller.TeacherController - "
	        			+ "Error. failed to delete lab notify.");
			}
			
			mav.addObject("idLab", idLab);
			mav.setViewName("redirect:/teacher/manager-lab");
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("redirect:/index");
		}
		return mav;
	}
	
	@RequestMapping(value = "/delete-lab-resource")
	public ModelAndView deleteLabResource(RedirectAttributes redirectAttributes,
			@RequestParam("idLab") String idLab,
			@RequestParam("idLabResource") String idLabResource) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		try {
			HttpSession httpSession = request.getSession();
			Teacher teacher = (Teacher) httpSession.getAttribute("teacher");
			
			Lab lab = labService.findByIdLabIdTeacher(Integer.parseInt(idLab), teacher.getIdTeacher());
			LabResource labResource = null;
			
			if (lab != null) {
				labResource = labResourceService.delete(Integer.parseInt(idLabResource));
			}
			
			if (labResource != null) {
				redirectAttributes.addFlashAttribute("delete_lab_resource_success", "Xóa bài thực hành thành công");
				
				_log.info("ctu.edu.vn.dlab.controller.TeacherController - "
	        			+ "Info. lab resource deleted. idLabResource=" + labResource.getIdLabResource());
			} else {
				redirectAttributes.addFlashAttribute("delete_lab_resource_error", "Có lỗi xảy ra. Xin vui lòng thử lại");
				
				_log.error("ctu.edu.vn.dlab.controller.TeacherController - "
	        			+ "Error. failed to delete lab resource.");
			}
			
			mav.addObject("idLab", idLab);
			mav.setViewName("redirect:/teacher/manager-lab");
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("redirect:/index");
		}
		return mav;
	}
	
	@RequestMapping(value = "/list-reg")
	public ModelAndView listStudentRegisterLab(@RequestParam("idLab") String idLab) {
		// get session attr
		try {
			HttpSession httpSession = request.getSession();
			Teacher teacher = (Teacher) httpSession.getAttribute("teacher");

			if (teacher != null) {
				List<RegistrationLabTeacher> regList = registrationLabService.findByIdLab(Integer.parseInt(idLab));
				if (regList != null) {
					request.setAttribute("regList", regList);
				}
				
				return new ModelAndView("pages/teacher/list_reg");
			}
		} catch (Exception e) {
			e.printStackTrace();
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

	@RequestMapping(value = "/create-lab/action")
	public ModelAndView createLabAction(RedirectAttributes redirectAttributes,
			@RequestParam("name") String name,
			@RequestParam("amount") String amount,
			@RequestParam("idCourse") String idCourse,
			@RequestParam("fileVPN") MultipartFile fileVPN) throws IOException {
		
		ModelAndView mav = new ModelAndView();
		
		try {
			request.setCharacterEncoding("UTF-8");

			// get session attr
			HttpSession httpSession = request.getSession();
			Teacher teacher = (Teacher) httpSession.getAttribute("teacher");
		    
			// create new lab
			Lab lab = null;
			if (teacher != null) {
				String fileVPNPath = ServerFileImpl.storeFile(fileVPN);
				
				lab = new Lab();
				lab.setName(name); 
				lab.setAmount(Integer.parseInt(amount));
				lab.setIdCourse(idCourse);
				lab.setFileVPN(fileVPNPath);
				lab.setIdTeacher(teacher.getIdTeacher());
				
				lab = labService.create(lab);
			}
			
			// redirect
			if (lab != null) {
				redirectAttributes.addFlashAttribute("add_lab_success", "Thêm lớp thực hành mới thành công");
				
				_log.info("ctu.edu.vn.dlab.controller.TeacherController - "
	        			+ "Info. new lab created. idLab=" + lab.getIdLab());
			} else {
				redirectAttributes.addFlashAttribute("add_lab_error", "Có lỗi xảy ra. Xin vui lòng thử lại");
				
				_log.error("ctu.edu.vn.dlab.controller.TeacherController - "
	        			+ "Error. failed to create lab.");
			}
			
			mav.setViewName("redirect:/teacher/create-lab");
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("redirect:/index");
		}
		return mav;
	}
	
	@RequestMapping(value = "/add-lab-notify")
	public ModelAndView addLabNotify() throws IOException {
		ModelAndView mav = new ModelAndView();
		try {
			request.setCharacterEncoding("UTF-8");
			
			// get request param
			String name = request.getParameter("name");
			String content = request.getParameter("content");
			String idLab = request.getParameter("idLab");
			
			// create lab notify
			LabNotify labNotify = new LabNotify(name, content, Integer.parseInt(idLab));
			LabNotify createdLabNotify = labNotifyService.create(labNotify);
			
			if (createdLabNotify != null) {
				_log.info("ctu.edu.vn.dlab.controller.TeacherController - "
	        			+ "Info. new lab notify created. idLabNotify=" + createdLabNotify.getIdLabNotify());
			}
			
			// redirect
			mav.addObject("idLab", idLab);
			mav.setViewName("redirect:/teacher/manager-lab");
		} catch (Exception e) {
			mav.setViewName("redirect:/index");
		}
		return mav;
	}
	
	@RequestMapping(value = "/add-lab-resource")
	public ModelAndView addLabResource() throws IOException {
		ModelAndView mav = new ModelAndView();
		try {
			request.setCharacterEncoding("UTF-8");
			
			// get request param
			String name = request.getParameter("name");
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			String startTime = request.getParameter("startTime");
			String endTime = request.getParameter("endTime");
			String labLink = request.getParameter("labLink");
			String idLab = request.getParameter("idLab");
			
			// create lab resource
			Date startDateTime = DateTimeFormatImpl.getJoinDateTime(startDate, startTime);
			Date endDateTime = DateTimeFormatImpl.getJoinDateTime(endDate, endTime);

			LabResource labResource = new LabResource(name, startDateTime, endDateTime, labLink, Integer.parseInt(idLab));
			LabResource createdLabResource = labResourceService.create(labResource);

			if (createdLabResource != null) {
				_log.info("ctu.edu.vn.dlab.controller.TeacherController - "
	        			+ "Info. new lab resource created. idLabResource=" + createdLabResource.getIdLabResource());
			}
			
			// redirect 
			mav.addObject("idLab", idLab);
			mav.setViewName("redirect:/teacher/manager-lab");
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("redirect:/index");
		}
		return mav;
	}
	
	private static final Logger _log = Logger.getLogger(TeacherController.class);
}
