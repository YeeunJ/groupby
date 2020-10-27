package com.group.by.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.group.by.board.boardDAO;
import com.group.by.board.allBoard.allBoardDAO;
import com.group.by.board.myBoard.myBoardDAO;
import com.group.by.config.auth.CustomOAuth2UserService;
import com.group.by.dto.groupDTO;
import com.group.by.dto.groupinfoDTO;
import com.group.by.dto.progressDTO;
import com.group.by.dto.usersDTO;
import com.group.by.board.allBoard.*;

@RestController
public class allBoardController {
	@InitBinder
	public void initBinder(WebDataBinder binder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	@RequestMapping("/")
	public ModelAndView home(@ModelAttribute groupDTO groupDTO,
            HttpServletRequest request, HttpSession session) throws ClassNotFoundException, SQLException {
		CustomOAuth2UserService.makeSession(request.getSession());
		int userID = 1;
		int cnt = 1;
		ArrayList<progressDTO> progressInfo;
		ModelAndView model = new ModelAndView("dashboard");
		boardDAO bd = new boardDAO();
		progressInfo = bd.getmyBoardInfo(userID);
		allBoardDAO ad = new allBoardDAO();
		ArrayList<groupinfoDTO> allGroupInfo = ad.getGroupInfo(cnt);
		model.addObject("allgroup", allGroupInfo);
		
		for(progressDTO pd: progressInfo) {
			System.out.println(pd.toString());
		}
		model.addObject("progress", progressInfo);
		usersDTO user = (usersDTO) session.getAttribute("user");
		if(user != null) {
			System.out.println("okok session!!--------------------------------------");
			System.out.println(user.toString());
			model.addObject("user", user);
		}
		return model;
	}
	@RequestMapping(value="/logoutDetail", method=RequestMethod.POST)
	public ModelAndView logoutDetail (HttpServletRequest request, HttpSession session) throws ClassNotFoundException, SQLException {
		session.removeAttribute("user");
		return new ModelAndView("redirect:/");
	}
	@RequestMapping(value="/createGroup", method=RequestMethod.POST)
	public ModelAndView createGroup(groupinfoDTO groupInfo, HttpServletRequest request) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
		int userID = 1;
		groupInfo.setManager(userID);
		System.out.println(groupInfo.toString());
		System.out.println("hello");
		
		
		ModelAndView model = new ModelAndView("myBoard");
		myBoardDAO dao = new myBoardDAO();
		allBoardDAO alldao = new allBoardDAO();
		
		int result = alldao.createGroup(groupInfo);
		if(result == 1 && groupInfo.getName().compareTo("")!=0) {
			request.setCharacterEncoding("UTF-8");
		    String [] name = request.getParameterValues("title");
		    String [] content = request.getParameterValues("description");

		    Date start = null;
		    Date end = null;


		    for(int i=0 ; i<name.length-1; i++) {
		      dao.missionAdd(name[i], content[i], start, end);
		       int result2 = dao.shootMission();
		    }
		    
		}
		return new ModelAndView("redirect:/");
	}
	     
	@RequestMapping(value = "/login")
	public String login() {
		//Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		//System.out.println(auth.toString());
		System.out.println("redirecting to home page");
		return "redirect:/home";
}
	@RequestMapping(value="/joinGroup", method=RequestMethod.POST)
	public ModelAndView joinGroup(groupinfoDTO groupInfo, HttpServletRequest request) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
		
		ModelAndView model = new ModelAndView("allBoard");
		myBoardDAO dao = new myBoardDAO();
		allBoardDAO alldao = new allBoardDAO();
		/*
		int result = alldao.createGroup(groupInfo);
		if(result == 1 && groupInfo.getName().compareTo("")!=0) {
			request.setCharacterEncoding("UTF-8");
		    String [] name = request.getParameterValues("title");
		    String [] content = request.getParameterValues("description");

		    Date start = null;
		    Date end = null;


		    for(int i=0 ; i<name.length-1; i++) {
		      dao.missionAdd(name[i], content[i], start, end);
		       int result2 = dao.shootMission();
		    }
		    
		}*/
		return new ModelAndView("redirect:/");
	}
}