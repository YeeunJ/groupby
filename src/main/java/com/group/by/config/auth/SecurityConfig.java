package com.group.by.config.auth;


import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

   private CustomOAuth2UserService customOAuth2UserService;

   @Override
   protected void configure(HttpSecurity http) throws Exception {
       http
               .csrf().disable()
               .headers().frameOptions().disable() 
               .and()
                   .authorizeRequests()
                   .antMatchers("/", "/css/*", "/js/*", "/images/*").permitAll()
                   //.antMatchers("/api/v1/**").hasRole(Role.USER.name())
                   .anyRequest().authenticated()
               .and()
                   .logout()
                       .logoutSuccessUrl("/logoutDetail")
               .and()
                   .oauth2Login()
                       .userInfoEndpoint();
                           //.userService(customOAuth2UserService);
   }
}