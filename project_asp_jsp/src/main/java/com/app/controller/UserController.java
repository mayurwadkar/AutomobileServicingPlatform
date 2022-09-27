package com.app.controller;

import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.entities.Address;
import com.app.entities.Mechanic;
import com.app.entities.Role;
import com.app.entities.User;
import com.app.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private IUserService userService;

	public UserController() {
		System.out.println("-----in UserController-----" + getClass());
	}

	@GetMapping("/register")
	public String showRegistrationForm() {
		return "/user/register";
	}

	@PostMapping("/register")
	public String processRegistrationForm(@RequestParam String fname, @RequestParam String lname,
			@RequestParam String email, @RequestParam String pass, @RequestParam String cpass, @RequestParam String mb,
			@RequestParam String dob, RedirectAttributes flashMap,@RequestParam String address, @RequestParam String house,
			@RequestParam String landmark, @RequestParam String city, @RequestParam("dist") String district,
			@RequestParam String state, @RequestParam String zipcode, HttpSession session) {
		if (pass.equals(cpass)) {
			User user = userService.addNewUser(new User(fname, lname, email, pass, cpass, mb, Role.CUSTOMER, LocalDate.parse(dob)));
//			User user = (User) session.getAttribute("user_details");
//			flashMap.addFlashAttribute("msg", "Address linked");
			userService.linkAddress(user.getId(), new Address(address, city, district, zipcode, state, landmark, house));
			flashMap.addFlashAttribute("ncmsg", "New customer registered");
			return "redirect:/";
		} else {
			flashMap.addFlashAttribute("errmsg", "Password not matched");
			return "redirect:/user/register";
		}

	}

	@GetMapping("/login")
	public String showLoginForm() {
		return "/user/login";
	}

	@PostMapping("/login")
	public String processLoginForm(HttpSession session, @RequestParam String email, @RequestParam String pass,
			Model map) {
		User user = userService.validateUser(email, pass);
		Mechanic mechanic = userService.validateMechanic(email, pass);
		if (user != null) {
			session.setAttribute("user_details", user);
			if (user.getRole().equals(Role.ADMIN)) {
				return "redirect:/admin/home";
			} else {
				return "redirect:/customer/home";
			}
		}
		if (mechanic != null) {
			session.setAttribute("mechanic_details", mechanic);
			return "redirect:/mechanic/home";
		}
		else {
			map.addAttribute("msg", "Invalid credentials, please try again");
			return "/homepage";
		}
	}

	@GetMapping("/logout")
	public String userLogout(HttpSession session, Model map, HttpServletResponse resp, HttpServletRequest request) {
		map.addAttribute("user_details", session.getAttribute("user_details"));
		map.addAttribute("mechanic_details", session.getAttribute("mechanic_details"));
		session.invalidate();
		resp.setHeader("refresh", "2;url=" + request.getContextPath());
		return "/user/logout";
	}

	@GetMapping("/forget")
	public String showForgetPassForm() {
		return "/user/forget";
	}

	@PostMapping("/forget")
	public String changePass(@RequestParam String email, @RequestParam String pass, @RequestParam String dob,
			RedirectAttributes map) {
		userService.forgetPassword(new User(email, pass, LocalDate.parse(dob)));
		map.addFlashAttribute("password_msg", "Password Updated");
		return "redirect:/";
	}

	@GetMapping("/get_user/{id}")
	public User getUser(@PathVariable int id) {
		System.out.println("-----getUserDetails-----");
		return userService.getUserDetails(id);
	}

	@GetMapping("/get_address/{id}") // it is returning user details also
	public Address getAddress(@PathVariable int id) {
		System.out.println("-----getAddress-----");
		return userService.getAddress(id);
	}

}
