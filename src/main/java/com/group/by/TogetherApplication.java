package com.group.by;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SpringBootApplication
@SessionAttributes("user")
public class TogetherApplication {
	
	
	public static void main(String[] args) {
		SpringApplication.run(TogetherApplication.class, args);
	}

}
