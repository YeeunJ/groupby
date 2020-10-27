package com.group.by.config.auth;

import com.group.by.dto.usersDTO;
import com.group.by.users.usersDAO;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Collection;
import java.util.Collections;


@Service
public class CustomOAuth2UserService implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {
   private usersDAO userRepository;
   private static HttpSession httpSession;
   
   public static void makeSession(HttpSession session) {
	   httpSession = session;
   }

   @Override
   public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
       OAuth2UserService delegate = new DefaultOAuth2UserService();
       OAuth2User oAuth2User = delegate.loadUser(userRequest);
       
       String registrationId = userRequest.getClientRegistration().getRegistrationId();
       String userNameAttributeName = userRequest.getClientRegistration()
               .getProviderDetails().getUserInfoEndpoint().getUserNameAttributeName();

       usersDTO user = OAuthAttributes.
               of(registrationId, userNameAttributeName, oAuth2User.getAttributes());
       System.out.println("hello");
       System.out.println(user.toString());
       httpSession.setAttribute("user", user);

       return oAuth2User;
   }
/*
   private usersDTO saveOrUpdate(OAuthAttributes attributes) {
       usersDTO user = userRepository.getUserInfo(attributes.getEmail())
               .map(entity -> entity.update(attributes.getName(),attributes.getPicture()))
               .orElse(attributes.toEntity());

       return userRepository.save(user);
   }*/
}