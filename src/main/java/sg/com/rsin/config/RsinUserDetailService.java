package sg.com.rsin.config;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import sg.com.rsin.dao.RoleRepository;
import sg.com.rsin.dao.UserRegistrationRepository;
import sg.com.rsin.dao.UserRoleRepository;
import sg.com.rsin.entity.Roles;
import sg.com.rsin.entity.UserRegistration;
import sg.com.rsin.entity.UserRole;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

//import java.util.*;
//
//import com.springboot.in.action.dao.{RoleDao, UserDao, UserRoleDao};
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.{User, UserDetails, UserDetailsService, UsernameNotFoundException};
//import org.springframework.stereotype.Service;
//import org.springframework.util.StringUtils;


/**
  * Verify the user, password and role
  */
@Service
class RsinUserDetailService implements UserDetailsService {

    @Autowired 
    UserRoleRepository userRoleRepository;
    @Autowired
    UserRegistrationRepository userRepository;
    @Autowired 
    RoleRepository roleRepository;

  @Override
  public UserDetails loadUserByUsername(String username) {

    UserRegistration user = userRepository.findByUsername(username);
    if (user == null) {
    	throw new UsernameNotFoundException(username + " not found");
    }

    ArrayList<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();
    List<UserRole> userRoles = userRoleRepository.findByUserId(user.getId());

    for (UserRole userRole : userRoles) {
      Roles role = roleRepository.findById(userRole.getRoleId());
      if (!StringUtils.isEmpty(role.getName())) {
        authorities.add(new SimpleGrantedAuthority(role.getName()));
      }

      System.out.println("username is " + username + ", " + role.getName());
    }

    return new User(username, user.getPassword(), authorities);
  }
}