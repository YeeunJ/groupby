package com.group.by.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class allBoardController {
	
	@RequestMapping("/")
	public ModelAndView home() {        
		ModelAndView model = new ModelAndView("dashboard");
		model.addObject("여기에다가", "정보담아서 전달 가능해!!");
		return model;
	}
}
