package com.group.by.config.auth;



import java.util.Map;

import com.group.by.dto.usersDTO;


public class OAuthAttributes {
   private Map<String, Object> attributes;
   private String nameAttributeKey;
   private static String name;
   private static String email;
   private String picture;

   public OAuthAttributes(Map<String, Object> attributes,
                          String nameAttributeKey, String name,
                          String email, String picture) {
       this.attributes = attributes;
       this.nameAttributeKey= nameAttributeKey;
       this.name = name;
       this.email = email;
       this.picture = picture;
   }

   public static usersDTO of(String registrationId,
                                    String userNameAttributeName,
                                    Map<String, Object> attributes) {
	   
	   name = (String) attributes.get("name");
	   email = (String) attributes.get("email");
	   usersDTO user = new usersDTO();
	   user.setName(name);
	   user.setEmail(email);
	   
       return user;
   }


   public usersDTO toEntity() {
	   usersDTO user = new usersDTO();
	   user.setName(name);
	   user.setEmail(email);
       return user;
   }

	public Map<String, Object> getAttributes() {
		return attributes;
	}
	
	public void setAttributes(Map<String, Object> attributes) {
		this.attributes = attributes;
	}
	
	public String getNameAttributeKey() {
		return nameAttributeKey;
	}
	
	public void setNameAttributeKey(String nameAttributeKey) {
		this.nameAttributeKey = nameAttributeKey;
	}
	
	public static String getName() {
		return name;
	}
	
	public static void setName(String name) {
		OAuthAttributes.name = name;
	}
	
	public static String getEmail() {
		return email;
	}
	
	public static void setEmail(String email) {
		OAuthAttributes.email = email;
	}
 
}