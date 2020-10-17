package com.group.by.controller;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.group.by.board.myBoard.myBoardDAO;

@RestController
public class myBoardController {
	//myboard는 나중에 뒤에 링크 넣어서 할거야!! 지금은 일단 이렇게!!
	
	@RequestMapping("/myBoard")
	public ModelAndView my() {        
		ModelAndView model = new ModelAndView("myBoard");
		//model.addObject("여기에다가", "정보담아서 전달 가능해!!");
		return model;
	}
	
	
	@RequestMapping("/deleteMission")
	public void deleteMission(HttpServletRequest request) throws UnsupportedEncodingException { 
		
		myBoardDAO dao = new myBoardDAO();
		int missionID = Integer.parseInt(request.getParameter("missionID"));
		
		try {
			dao.missionDelete(missionID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	@RequestMapping("/missionTrue")
	public void missionTrue(HttpServletRequest request) throws UnsupportedEncodingException { 
		
		myBoardDAO dao = new myBoardDAO();
		int userID = Integer.parseInt(request.getParameter("userID"));
		int missionID = Integer.parseInt(request.getParameter("missionID"));
		System.out.print("in True: "+userID + " / "+missionID);
		
		try {
			dao.missionTrue(userID, missionID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	@RequestMapping("/missionFalse")
	public void missionFalse(HttpServletRequest request) throws UnsupportedEncodingException { 
		
		myBoardDAO dao = new myBoardDAO();
		int userID = Integer.parseInt(request.getParameter("userID"));
		int missionID = Integer.parseInt(request.getParameter("missionID"));
		try {
			dao.missionFalse(userID, missionID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	
	@RequestMapping("/mymissionAdd")
	public String myupload(HttpServletRequest request) throws UnsupportedEncodingException {        
		ModelAndView model = new ModelAndView("myBoard");
		myBoardDAO dao = new myBoardDAO();
		
		request.setCharacterEncoding("UTF-8");
	    String [] name = request.getParameterValues("title");
	    String [] content = request.getParameterValues("description");

	    Date start = null;
	    Date end = null;


	    for(int i=0 ; i<name.length-1; i++) {
	      dao.missionAdd(name[i], content[i], start, end);
	      // int result = dao.shootMission();
	    }

		return "redirect:/myBoard";
	}
	
	
//	@RequestMapping("/mymissionAdd")
//	public ModelAndView insertMission() {
//		//ModelAndView model = new ModelAndView("myBoard/mymissionAdd");
//		//model.addAttribute("name", name);
//		//model.addAttribute("content", content);
//		ModelAndView model = new ModelAndView("mymissionAdd");
//		
//		return model;
//	}
	
	
	@RequestMapping("/missionEdit")
	public String missionEdit(HttpServletRequest request) {  
		myBoardDAO dao = new myBoardDAO();
		
		String [] missionID = request.getParameterValues("missionID");
	    String [] title = request.getParameterValues("title");
	    String [] content = request.getParameterValues("content");
	    
	    int length = missionID.length;
	    for(int i=0 ; i<length ; i++) {
	      dao.updateMission(Integer.parseInt(missionID[i]), title[i], content[i]);
	    }
	    
		return "redirect:/myBoard";
	}
	
	
	@RequestMapping("/updateGroup")
	public String updateGroup(HttpServletRequest req) {

		myBoardDAO dao = new myBoardDAO();
		
		String title = req.getParameter("title");
		String startdate = req.getParameter("startdate");
		String enddate = req.getParameter("enddate");
		String reward = req.getParameter("reward");
		String rewardCD = req.getParameter("rewardCD");
		String notice = req.getParameter("notice");
		
		try {
			dao.updateGroup(title, null, null, reward, rewardCD, notice);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.print("updateGroup Error");
			e.printStackTrace();
		}
		
		return "redirect:/myBoard";
	}
	
	
	
	@RequestMapping("/createGroup")
	public String createGroup() {
		return "redirect:/";
	}
}
