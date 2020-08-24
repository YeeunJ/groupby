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
	@RequestMapping("/login/register")
    String register() {        
        return "signup";
    }
	@RequestMapping("/login/idCheck")
    String idCheck() {        
        return "idCheck";
    }
	@RequestMapping("/login/pwCheck")
    String pwCheck() {        
        return "pwCheck";
    }
	
	//myboard는 나중에 뒤에 링크 넣어서 할거야!! 지금은 일단 이렇게!!
	@RequestMapping("/myBoard")
    String my() {        
        return "myBoard";
    }
	
	public static void main(String[] args) {
		SpringApplication.run(TogetherApplication.class, args);
	}

}
