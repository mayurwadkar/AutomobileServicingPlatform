package com.app.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.entities.Appointment;
import com.app.entities.Mechanic;
import com.app.entities.MechanicAddress;
import com.app.entities.Role;
import com.app.entities.Service;
import com.app.entities.Status;
import com.app.service.IService;
import com.app.service.IUserService;

@Controller
@RequestMapping("/mechanic")
public class MechanicController {
	@Autowired
	private IUserService userService;
	@Autowired
	private IService serService;

	public MechanicController() {
		System.out.println("-----in MechanicController-----" + getClass());
	}

	@GetMapping("/home")
	public String showHomePage() {
		return "/mechanic/home";
	}

	@GetMapping("/profile")
	public String showProfile(Model map, HttpSession session) {
		try {
			Mechanic user = (Mechanic) session.getAttribute("mechanic_details");
			Mechanic retrievedUser = userService.getMechanicDetails(user.getId());
			session.setAttribute("mechanic_details", retrievedUser);
			MechanicAddress address = userService.getMechanicAddress(retrievedUser.getId());
			session.setAttribute("mechaddress_details", address);
			return "/mechanic/profile";
		} catch (Exception e) {
			map.addAttribute("profilemsg", "Please link your address");
			return "/mechanic/profile";
		}
	}

	@GetMapping("/changepassword")
	public String changePassForm(HttpSession session) {
		Mechanic user = (Mechanic) session.getAttribute("mechanic_details");
		session.setAttribute("mechanic_details", user);
		return "/mechanic/changepassword";
	}

	@PostMapping("/changepassword")
	public String processChangePassForm(@RequestParam String email, @RequestParam String opass,
			@RequestParam String npass, @RequestParam String cnpass, RedirectAttributes map, HttpSession session) {
		Mechanic user = userService.validateMechanic(email, opass);
		if (user != null) {
			if (npass.equals(cnpass)) {
				userService.forgetMechanicPassword(new Mechanic(email, npass, user.getDob()));
				map.addFlashAttribute("cpmsg", "Password changed");
				return "redirect:/mechanic/profile";
			} else {
				map.addFlashAttribute("cpmsg", "New password not matched");
				return "redirect:/mechanic/changepassword";
			}
		} else {
			map.addFlashAttribute("cpmsg", "Old password wrong");
			return "redirect:/mechanic/changepassword";
		}
	}

	@GetMapping("/editprofile")
	public String editProfile(HttpSession session) {
		Mechanic user = (Mechanic) session.getAttribute("mechanic_details");
		session.setAttribute("mechanic_details", user);
		MechanicAddress address = userService.getMechanicAddress(user.getId());
		session.setAttribute("mechaddress_details", address);
		return "/mechanic/editprofile";
	}

	@PostMapping("/editprofile")
	public String processProfile(@RequestParam String address, @RequestParam String house,
			@RequestParam String landmark, @RequestParam String city, @RequestParam("dist") String district,
			@RequestParam String state, @RequestParam String zipcode, @RequestParam String fname,
			@RequestParam String lname, @RequestParam String email, @RequestParam String mb, @RequestParam String dob,
			@RequestParam String ws, HttpSession session, RedirectAttributes flashMap) {

		Mechanic user = (Mechanic) session.getAttribute("mechanic_details");
		userService.updateMechanicDetails(user.getId(),
				new Mechanic(user.getId(), fname, lname, email, user.getPassword(), mb, Role.MECHANIC,
						LocalDate.parse(dob), ws),
				new MechanicAddress(user.getId(), address, city, district, zipcode, state, landmark, house));
		flashMap.addFlashAttribute("update_msg", "Personal details updated");
		return "redirect:/mechanic/profile";
	}

	@GetMapping("/appointments")
	public String viewAppointment(HttpSession session, Model map) {
		Mechanic user = (Mechanic) session.getAttribute("mechanic_details");

		List<Appointment> appointments = userService.getAppointmentsByStatusAndMechanic(Status.PENDING, user);
		if (appointments.size() != 0) {
			map.addAttribute("appointment_details", appointments);
		} else {
			map.addAttribute("amsg", "No appointments");

		}
		return "/mechanic/viewappointments";
	}

	@GetMapping("/appointmentdetails")
	public String showAppointmentDetails(@RequestParam int id, Model map) {
		Appointment appointment = userService.getAppoinmentDetails(id);
		Set<Service> services = userService.getServicesByAppointment(id);
		map.addAttribute("appointment_details", appointment);
		map.addAttribute("services", services);
		return "/mechanic/appointmentdetails";
	}

	@GetMapping("/updateappointmentstatus")
	public String updateAppointmentStatus(@RequestParam int id, RedirectAttributes flashmap) {
		userService.updateAppStatus(id);
		flashmap.addFlashAttribute("status_msg", "Status changed to COMPLETED of appointment id " + id);
		return "redirect:/mechanic/appointments";
	}
}
