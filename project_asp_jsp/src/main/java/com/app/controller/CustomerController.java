package com.app.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.entities.Address;
import com.app.entities.Appointment;
import com.app.entities.Role;
import com.app.entities.Service;
import com.app.entities.Status;
import com.app.entities.User;
import com.app.entities.Vehicle;
import com.app.service.IService;
import com.app.service.IUserService;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	@Autowired
	private IUserService userService;
	@Autowired
	private IService serService;

	public CustomerController() {
		System.out.println("-----in CustomerController-----" + getClass());
	}

	@GetMapping("/home")
	public String showHomePage() {
		return "/customer/home";
	}

	@GetMapping("/address")
	public String showAddressForm() {
		return "/customer/address";
	}

	@PostMapping("/address")
	public String linkUserAddress(@RequestParam String address, @RequestParam String house,
			@RequestParam String landmark, @RequestParam String city, @RequestParam("dist") String district,
			@RequestParam String state, @RequestParam String zipcode, HttpSession session,
			RedirectAttributes flashMap) {
		User user = (User) session.getAttribute("user_details");
		flashMap.addFlashAttribute("msg", "Address linked");
		userService.linkAddress(user.getId(), new Address(address, city, district, zipcode, state, landmark, house));
		return "redirect:/customer/home";
	}

	@GetMapping("/profile")
	public String viewProfile(HttpSession session, Model map) {
		try {
			User user = (User) session.getAttribute("user_details");
			User retrievedUser = userService.getUserDetails(user.getId());
			session.setAttribute("user_details", retrievedUser);
			Address address = userService.getAddress(retrievedUser.getId());
			session.setAttribute("address_details", address);
			return "/customer/profile";
		} catch (Exception e) {
			map.addAttribute("profilemsg", "Please link your address");
			return "/customer/profile";
		}
	}

	@GetMapping("/editprofile")
	public String editProfile(HttpSession session) {
		User user = (User) session.getAttribute("user_details");
		session.setAttribute("user_details", user);
		Address address = userService.getAddress(user.getId());
		session.setAttribute("address_details", address);
		return "/customer/editprofile";
	}

	@PostMapping("/editprofile")
	public String processProfile(@RequestParam String address, @RequestParam String house,
			@RequestParam String landmark, @RequestParam String city, @RequestParam("dist") String district,
			@RequestParam String state, @RequestParam String zipcode, @RequestParam String fname,
			@RequestParam String lname, @RequestParam String email, @RequestParam String mb, @RequestParam String dob,
			HttpSession session, RedirectAttributes flashMap) {

		User user = (User) session.getAttribute("user_details");
		userService.updateUserDetails(user.getId(),
				new User(user.getId(), fname, lname, email, user.getPassword(), mb, Role.CUSTOMER,
						LocalDate.parse(dob)),
				new Address(user.getId(), address, city, district, zipcode, state, landmark, house));
		flashMap.addFlashAttribute("update_msg", "Personal details updated");
		return "redirect:/customer/profile";
	}

	@GetMapping("/newvehicle")
	public String showVehicleForm(Model map) {
		List<String> companies = new ArrayList<>();
		companies.add("Hero");
		companies.add("Honda");
		companies.add("Bajaj");
		companies.add("Yamaha");
		companies.add("TVS");
		companies.add("Eicher");
		companies.add("Suzuki");
		map.addAttribute("companies", companies);
		return "/customer/newvehicle";
	}

	@PostMapping("/newvehicle")
	public String addNewVehicle(@RequestParam String vnumber, @RequestParam String vcompany,
			@RequestParam String vmodel, HttpSession session, RedirectAttributes flashMap) {
		User user = (User) session.getAttribute("user_details");
		userService.addNewVehicle(new Vehicle(vnumber, vcompany, vmodel), user.getId());
		flashMap.addFlashAttribute("vehicle_msg", vnumber + " vehicle registered");
		return "redirect:/customer/home";
	}

	@GetMapping("/changepassword")
	public String changePassForm(HttpSession session) {
		User user = (User) session.getAttribute("user_details");
		session.setAttribute("user_details", user);
		return "/customer/changepassword";
	}

	@PostMapping("/changepassword")
	public String processChangePassForm(@RequestParam String email, @RequestParam String opass,
			@RequestParam String npass, @RequestParam String cnpass, RedirectAttributes map, HttpSession session) {
		User user = userService.validateUser(email, opass);
		if (user != null) {
			if (npass.equals(cnpass)) {
				userService.forgetPassword(new User(email, npass, user.getDob()));
				map.addFlashAttribute("cpmsg", "Password changed");
				return "redirect:/customer/profile";
			} else {
				map.addFlashAttribute("cpmsg", "New password not matched");
				return "redirect:/customer/changepassword";
			}
		} else {
			map.addFlashAttribute("cpmsg", "Old password wrong");
			return "redirect:/customer/changepassword";
		}
	}

	@GetMapping("/viewvehicles")
	public String viewVehicles(HttpSession session, @RequestParam int id, Model map) {
		User user = (User) session.getAttribute("user_details");
		List<Vehicle> vehicles = userService.getVehicles(user);
		if (vehicles != null) {
			session.setAttribute("vehicles", vehicles);
		} else {
			map.addAttribute("vmsg", "Vehicles not added");
		}
		return "/customer/viewvehicles";
	}

	@GetMapping("/bookappointment")
	public String bookAppointment(HttpSession session, Model map) {
		User user = (User) session.getAttribute("user_details");
		session.setAttribute("user_details", user);
		List<Vehicle> vehicles = userService.getVehicles(user);
		if (vehicles != null) {
			session.setAttribute("vehicles", vehicles);
		} else {
			map.addAttribute("vmsg", "Vehicles not added");
		}
		List<Service> services = serService.getAllServices();
		session.setAttribute("service_details", services);
		return "/customer/bookappointments";
	}

	@PostMapping("/bookappointment")
	public String processBookAppointment(HttpSession session, RedirectAttributes flashMap, @RequestParam int userId,
			@RequestParam int vehicleId, @RequestParam int[] services) {
		User u = userService.getUserDetails(userId);
		Vehicle v = userService.getVehiclesById(vehicleId);

		userService.bookTheAppointment(new Appointment(u, v), services);
		flashMap.addFlashAttribute("apmsg", "Appointment booked");
		return "redirect:/customer/home";
	}

	@GetMapping("/appointments")
	public String showAppointmentForm(HttpSession session, Model map) {
		return "/customer/appointments";
	}

//	@GetMapping("/checkajax")
//	public @ResponseBody String checkAjax(HttpSession session, Model map) {
//		User user = (User) session.getAttribute("user_details");
//		List<Appointment> appointments = userService.getAllAppoinments();
//		return "Mayur, u r so smart";
//	}

	@PostMapping("/appointments")
	public String processAppointmentForm(HttpSession session, Model map, @RequestParam String status) {
		User user = (User) session.getAttribute("user_details");
		map.addAttribute("status", status);
		if (status.equals("ALL")) {
			List<Appointment> appointments = userService.getAllAppoinments(user);
			if (appointments.size() != 0) {
				map.addAttribute("appointment_details", appointments);
			} else {
				map.addAttribute("amsg", "No appointments");
			}
		} else {
			List<Appointment> appointments = userService.getAppointmentsByStatusAndUser(Status.valueOf(status), user);
			if (appointments.size() != 0) {
				map.addAttribute("appointment_details", appointments);
			} else {
				map.addAttribute("amsg", "No appointments");
			}
		}
		return "/customer/viewappointments";
	}

}
