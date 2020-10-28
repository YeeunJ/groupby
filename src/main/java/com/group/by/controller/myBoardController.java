package com.group.by.controller;
import java.io.*;
import java.util.*;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.group.by.board.boardDAO;
import com.group.by.board.myBoard.myBoardDAO;
import com.group.by.dto.missionDTO;
import com.group.by.dto.participationDTO;
import com.group.by.dto.groupinfoDTO;
import com.group.by.dto.progressDTO;
import com.group.by.board.myBoard.*;


@RestController
public class myBoardController {
	myBoardDAO dao = new myBoardDAO();

	
	@RequestMapping("/myBoard/{id}")
	public ModelAndView my(@PathVariable("id") int id, HttpServletRequest request, HttpSession session) throws SQLException {        
		ModelAndView model = new ModelAndView("myBoard");
		
		ArrayList<progressDTO> _list = null;
		groupinfoDTO info = dao.GroupInfo(id);
		model.addObject("groupinfo", info);
		try {
			_list = dao.getRightsideInfo(id);
			System.out.println("Isitwork?");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList<missionDTO> list = dao.MissionList(id);
		ArrayList<String> mlist = dao.MissionComplete(id);
		ArrayList<Integer> userlist = dao.completeYN();
		model.addObject("groupid", id);
		model.addObject("list", list);
		model.addObject("mlist", mlist);
		model.addObject("userlist", userlist);
		model.addObject("_list", _list);
		
		ArrayList<participationDTO> plist = dao.waitStudent(id);
		model.addObject("plist", plist);
		return model;
	}
	
	
	@RequestMapping("/deleteMission")
	public void deleteMission(HttpServletRequest request) throws UnsupportedEncodingException { 
		myBoardDAO dao = new myBoardDAO();
		int missionID = Integer.parseInt(request.getParameter("missionID"));
		//System.out.println("in controller: "+missionID);
		
		try {
			dao.missionDelete(missionID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/missionTrue")
	public void missionTrue(HttpServletRequest request) throws UnsupportedEncodingException { 
		request.setCharacterEncoding("UTF-8");
		myBoardDAO dao = new myBoardDAO();
		int userID = Integer.parseInt(request.getParameter("userID"));
		int missionID = Integer.parseInt(request.getParameter("missionID"));
		//System.out.print("in True: "+userID + " / "+missionID);
		
		try {
			dao.missionTrue(userID, missionID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	@RequestMapping("/missionFalse")
	public void missionFalse(HttpServletRequest request) throws UnsupportedEncodingException { 
		request.setCharacterEncoding("UTF-8");
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
	
	
	@RequestMapping(value= "/mymissionAdd/{id}", produces = "application/text; charset=utf8")

	public ModelAndView myupload(@PathVariable("id") int id, HttpServletRequest request) throws UnsupportedEncodingException {        
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

	    return new ModelAndView("redirect:/myBoard/"+id);
	}
	

	
	
	@RequestMapping("/missionEdit/{id}")
	public ModelAndView missionEdit(@PathVariable("id") int id, HttpServletRequest request) throws UnsupportedEncodingException {  
		myBoardDAO dao = new myBoardDAO();
		
		request.setCharacterEncoding("UTF-8");
		
		String [] missionID = request.getParameterValues("missionID");
	    String [] title = request.getParameterValues("title");
	    String [] content = request.getParameterValues("content");
	    int length = missionID.length;
	    for(int i=0 ; i<length ; i++) {
	      dao.updateMission(Integer.parseInt(missionID[i]), title[i], content[i]);
	    }
	    
	    return new ModelAndView("redirect:/myBoard/"+id);
	}
	

	@RequestMapping("/updateGroup/{id}")
	public ModelAndView updateGroup(@PathVariable("id") int id, HttpServletRequest req) {

		myBoardDAO dao = new myBoardDAO();
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
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
		
		return new ModelAndView("redirect:/myBoard/"+id);
	}
	
	@RequestMapping(value = "/duplicateCheck", method=RequestMethod.POST)
	public boolean duplicateCheck(String link) throws SQLException {
		boardDAO bd = new boardDAO();
		if(bd.isDuplicateLink(link)) {
			return true;
		}
		return false;
	}
	
	@RequestMapping("/createGroup")
	public String createGroup() {
		return "redirect:/";
	}
}
