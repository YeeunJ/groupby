package com.group.by.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.group.by.board.boardDAO;
import com.group.by.dto.groupDTO;
import com.group.by.dto.progressDTO;

@RestController
public class allBoardController {
	
	@RequestMapping("/")
	public ModelAndView home(@ModelAttribute groupDTO groupDTO,
            HttpServletRequest request) throws ClassNotFoundException, SQLException {
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
