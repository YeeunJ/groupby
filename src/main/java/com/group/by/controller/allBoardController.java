package com.group.by.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.group.by.board.boardDAO;
import com.group.by.dto.progressDTO;

@RestController
public class allBoardController {
	
	@RequestMapping("/")
	public ModelAndView home() throws ClassNotFoundException, SQLException {
		int userID = 1;
		ArrayList<progressDTO> progressInfo;
		ModelAndView model = new ModelAndView("dashboard");
		boardDAO bd = new boardDAO();
		progressInfo = bd.getmyBoardInfo(userID);
		for(progressDTO pd: progressInfo) {
			System.out.println(pd.toString());
		}
		model.addObject("progress", progressInfo);
		return model;
	}
}
