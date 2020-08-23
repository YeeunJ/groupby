package com.group.by;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@SpringBootApplication
public class TogetherApplication {
	
	@RequestMapping("/")
    String home() {        
        return "dashboard";
    }
	
	@RequestMapping("/login")
    String login() {        
        return "login";
    }
	
	@RequestMapping("/all")
    String all() {        
        return "all";
    }
	@RequestMapping("/my")
    String my() {        
        return "my";
    }
	@RequestMapping("/heeju")
    String heeju() {        
        return "createBoard";
    }
	@RequestMapping("/heeju2")
    String heeju2() {        
        return "allBoard";
    }
	
	public static void main(String[] args) {
		SpringApplication.run(TogetherApplication.class, args);
	}

}
