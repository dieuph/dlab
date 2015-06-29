package ctu.edu.vn.dlab.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ctu.edu.vn.dlab.dto.Message;
import ctu.edu.vn.dlab.dto.OutputMessage;
import ctu.edu.vn.dlab.model.Student;
import ctu.edu.vn.dlab.model.Teacher;

@Controller
public class ChatroomController {

	private Logger logger = LoggerFactory.getLogger(getClass());

	private org.jboss.logging.Logger _log = org.jboss.logging.Logger.getLogger(ChatroomController.class);
			
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping(value = "/chat")
	public ModelAndView chatroom() {
		try {
			HttpSession httpSession = request.getSession();
			Student student = (Student) httpSession.getAttribute("student");
			Teacher teacher = (Teacher) httpSession.getAttribute("teacher");
			
			if (student != null || teacher != null) {
				return new ModelAndView("pages/common/chat");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("redirect:/index");
		}
		return new ModelAndView("redirect:/login");
	}

	@MessageMapping("/chat")
	@SendTo("/topic/message")
	public OutputMessage sendMessage(Message message) {
		logger.info("Message sent");
		_log.info("Message sent");

		return new OutputMessage(message, new Date());
	}
}
