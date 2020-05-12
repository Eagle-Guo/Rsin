package sg.com.rsin.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;

import sg.com.rsin.handler.RsinAuthenticationSuccessHandler;

@Configuration
@EnableWebSecurity
public class RsinSecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	DataSource dataSource;

	@Autowired
	private RsinAuthenticationSuccessHandler successHandler;
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	// Enable jdbc authentication
	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication().dataSource(dataSource).passwordEncoder(passwordEncoder());
	}

	@Bean
	public JdbcUserDetailsManager jdbcUserDetailsManager() throws Exception {
		JdbcUserDetailsManager jdbcUserDetailsManager = new JdbcUserDetailsManager();
		jdbcUserDetailsManager.setDataSource(dataSource);
		return jdbcUserDetailsManager;
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/register").permitAll()
		       .antMatchers("/api/*").permitAll()
		       .antMatchers("/employees").permitAll()
		       .antMatchers("/assets/**").permitAll()
		       .antMatchers("/userWelcome").hasAnyRole("USER","ADMIN")
		       .antMatchers("/adminWelcome").hasAnyRole("ADMIN")
		       .antMatchers("/getEmployees").hasAnyRole("USER", "ADMIN")
			   .antMatchers("/addNewEmployee").hasAnyRole("ADMIN")
			   .antMatchers("/mybusiness/**").hasAnyRole("USER","ADMIN")
			   .anyRequest().authenticated().and().formLogin().successHandler(successHandler)
			   .loginPage("/login").permitAll().and().logout().permitAll();

		http.csrf().disable();
	}

}