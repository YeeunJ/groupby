package com.group.by.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class myBoardController {
	//myboard는 나중에 뒤에 링크 넣어서 할거야!! 지금은 일단 이렇게!!
	@RequestMapping("/myBoard")
	public ModelAndView my() {        
		ModelAndView model = new ModelAndView("myBoard");
		model.addObject("여기에다가", "정보담아서 전달 가능해!!");
		return model;
	}
	
	@RequestMapping("/mymissionAdd")
	public ModelAndView insertMission() {
		//ModelAndView model = new ModelAndView("myBoard/mymissionAdd");
		//model.addAttribute("name", name);
		//model.addAttribute("content", content);
		ModelAndView model = new ModelAndView("mymissionAdd");
		
		return model;
	}
	
	@RequestMapping("/missionEdit")
	public ModelAndView missionEdit() {        
		ModelAndView model = new ModelAndView("missionEdit");
//		model.addObject("여기에다가", "정보담아서 전달 가능해!!");
		return model;
	}
	
	@RequestMapping("/updateGroup")
	public ModelAndView updateGroup(HttpServletRequest req) {
		//ModelAndView model = new ModelAndView("myBoard/mymissionAdd");
		//model.addAttribute("name", name);
		//model.addAttribute("content", content);
		ModelAndView model = new ModelAndView("updateGroup");
		String title = req.getParameter("title");
		String startdate = req.getParameter("startdate");
		String enddate = req.getParameter("enddate");
		String reward = req.getParameter("reward");
		String rewardCD = req.getParameter("rewardCD");
		String notice = req.getParameter("notice");
		model.addObject("title", title);
		model.addObject("startdate", startdate);
		model.addObject("enddate", enddate);
		model.addObject("reward", reward);
		model.addObject("rewardCD", rewardCD);
		model.addObject("notice", notice);
		model.setViewName("updateGroup");

		return model;
	}
}
