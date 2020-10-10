package com.group.by.controller;

import org.springframework.web.bind.annotation.RequestMapping;
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
}
