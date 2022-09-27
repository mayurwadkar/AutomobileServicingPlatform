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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.entities.Address;
import com.app.entities.Appointment;
import com.app.entities.Mechanic;
import com.app.entities.MechanicAddress;
import com.app.entities.Payment;
import com.app.entities.Role;
import com.app.entities.Service;
import com.app.entities.Status;
import com.app.entities.User;
import com.app.service.IService;
import com.app.service.IUserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private IUserService userService;
	@Autowired
	private IService serviceService;

	public AdminController() {
		System.out.println("-----in AdminController-----" + getClass());
	}

	@GetMapping("/home")
	public String showHomePage() {
		return "/admin/home";
	}

	@PostMapping("/add_service")
	public String addNewService(@RequestBody Service service) {
		System.out.println("-----addNewService-----");
		serviceService.addNewService(service);
		return "New service added";
	}

	@GetMapping("/viewcustomers")
	public String viewCustomers() {
		return "/admin/viewcustomers";
	}

	@GetMapping("/viewactivecustomers")
	public String viewActiveCustomers(Model map) {
		List<User> users = userService.getActiveCustomers(Status.ACTIVE, Role.CUSTOMER);
		if (users.size() != 0) {
			map.addAttribute("active_customers", users);
		} else {
			map.addAttribute("nocustmsg", "No Active Customer");
		}

		return "/admin/viewactivecustomers";
	}

	@GetMapping("/viewinactivecustomers")
	public String viewInactiveCustomers(Model map) {
		List<User> users = userService.getActiveCustomers(Status.INACTIVE, Role.CUSTOMER);
		if (users.size() != 0) {
			map.addAttribute("inactive_customers", users);
		} else {
			map.addAttribute("nocustmsg", "No Inactive Customer");
		}
		return "/admin/viewinactivecustomers";
	}

	@GetMapping("/profile")
	public String viewProfile(HttpSession session, Model map, @RequestParam int id) {
		try {
			User retrievedUser = userService.getUserDetails(id);
			map.addAttribute("user_details", retrievedUser);
			Address address = userService.getAddress(retrievedUser.getId());
			map.addAttribute("address_details", address);
			return "/admin/profile";
		} catch (Exception e) {
			map.addAttribute("profilemsg", "Please link address");
			return "/admin/profile";
		}
	}

	@GetMapping("/editprofile")
	public String editProfile(HttpSession session, Model map, @RequestParam int id) {
		User retrievedUser = userService.getUserDetails(id);
		map.addAttribute("user_details", retrievedUser);
		Address address = userService.getAddress(retrievedUser.getId());
		map.addAttribute("address_details", address);
		return "/admin/editprofile";
	}

	@PostMapping("/editprofile")
	public String processProfile(@RequestParam int id, @RequestParam String address, @RequestParam String house,
			@RequestParam String landmark, @RequestParam String city, @RequestParam("dist") String district,
			@RequestParam String state, @RequestParam String zipcode, @RequestParam String fname,
			@RequestParam String lname, @RequestParam String email, @RequestParam String mb, @RequestParam String dob,
			HttpSession session, RedirectAttributes flashMap) {

		User user = userService.getUserDetails(id);
		userService.updateUserDetails(user.getId(),
				new User(user.getId(), fname, lname, email, user.getPassword(), mb, Role.CUSTOMER,
						LocalDate.parse(dob)),
				new Address(user.getId(), address, city, district, zipcode, state, landmark, house));
		flashMap.addFlashAttribute("update_msg", "Personal details updated");
		return "redirect:/admin/profile?id=" + user.getId();
	}

	@GetMapping("/address")
	public String showAddressForm(Model map, @RequestParam int id) {
		User user = userService.getUserDetails(id);
		map.addAttribute("user_details", user);
		return "/admin/address";
	}

	@PostMapping("/address")
	public String linkUserAddress(@RequestParam int id, @RequestParam String address, @RequestParam String house,
			@RequestParam String landmark, @RequestParam String city, @RequestParam("dist") String district,
			@RequestParam String state, @RequestParam String zipcode, HttpSession session,
			RedirectAttributes flashMap) {
		User user = userService.getUserDetails(id);
		flashMap.addFlashAttribute("msg", "Address linked");
		userService.linkAddress(user.getId(), new Address(address, city, district, zipcode, state, landmark, house));
		return "redirect:/admin/profile?id=" + user.getId();
	}

	@GetMapping("/inactivecustomer")
	public String inactiveCustomer(@RequestParam int id, RedirectAttributes flashMap) {
		userService.inactiveUser(id);
		flashMap.addFlashAttribute("deletemsg", "Customer with id " + id + " deactivated");
		return "redirect:/admin/viewactivecustomers";
	}

	@GetMapping("/registercustomer")
	public String showRegistrationForm() {
		return "/admin/registercustomer";
	}

	@PostMapping("/registercustomer")
	public String processRegistrationForm(@RequestParam String fname, @RequestParam String lname,
			@RequestParam String email, @RequestParam String pass, @RequestParam String cpass, @RequestParam String mb,
			@RequestParam String dob, RedirectAttributes flashMap,@RequestParam String address, @RequestParam String house,
			@RequestParam String landmark, @RequestParam String city, @RequestParam("dist") String district,
			@RequestParam String state, @RequestParam String zipcode, HttpSession session) {
		if (pass.equals(cpass)) {
			User user = userService.addNewUser(new User(fname, lname, email, pass, cpass, mb, Role.CUSTOMER, LocalDate.parse(dob)));
			flashMap.addFlashAttribute("msg", "New customer registered");
			userService.linkAddress(user.getId(), new Address(address, city, district, zipcode, state, landmark, house));
			return "redirect:/admin/viewcustomers";
		} else {
			flashMap.addFlashAttribute("errmsg", "Password not matched");
			return "redirect:/admin/registercustomer";
		}

	}

	@GetMapping("/changepassword")
	public String changePassForm(@RequestParam int id, Model map) {
		User user = userService.getUserDetails(id);
		map.addAttribute("user_details", user);
		return "/admin/changepassword";
	}

	@PostMapping("/changepassword")
	public String processChangePassForm(@RequestParam String email, @RequestParam String opass,
			@RequestParam String npass, @RequestParam String cnpass, RedirectAttributes map, HttpSession session) {
		User u = userService.getUserByEmail(email);
		User user = userService.validateUser(email, opass);
		if (user != null) {
			if (npass.equals(cnpass)) {
				userService.forgetPassword(new User(email, npass, user.getDob()));
				map.addFlashAttribute("cpmsg", "Password changed");
				return "redirect:/admin/profile?id=" + user.getId();
			} else {
				map.addFlashAttribute("cpmsg", "New password not matched");
				return "redirect:/admin/changepassword?id=" + user.getId();
			}
		} else {
			map.addFlashAttribute("cpmsg", "Old password wrong");
			return "redirect:/admin/changepassword?id=" + u.getId();
		}
	}

	@GetMapping("/deletecustomer")
	public String deleteCustomer(@RequestParam int id, RedirectAttributes flashMap) {
		userService.deleteUser(id);
		flashMap.addFlashAttribute("deletemsg", "Customer with id " + id + " deleted permanently");
		return "redirect:/admin/viewinactivecustomers";
	}

	@GetMapping("/inactiveprofile")
	public String inactiveProfile(HttpSession session, Model map, @RequestParam int id) {
		try {
			User retrievedUser = userService.getUserDetails(id);
			map.addAttribute("user_details", retrievedUser);
			Address address = userService.getAddress(retrievedUser.getId());
			map.addAttribute("address_details", address);
			return "/admin/inactiveprofile";
		} catch (Exception e) {
			map.addAttribute("profilemsg", "Please link address");
			return "/admin/inactiveprofile";
		}
	}

	@GetMapping("/activatecustomer")
	public String activateCustomer(@RequestParam int id, RedirectAttributes flashMap) {
		userService.activateUser(id);
		flashMap.addFlashAttribute("actmsg", "Customer with id " + id + " activated");
		return "redirect:/admin/viewinactivecustomers";
	}

	@GetMapping("/registermechanic")
	public String registerMechanic() {
		return "/admin/registermechanic";
	}

	@PostMapping("/registermechanic")
	public String processProfile(@RequestParam String address, @RequestParam String house,
			@RequestParam String landmark, @RequestParam String city, @RequestParam("dist") String district,
			@RequestParam String state, @RequestParam String zipcode, @RequestParam String fname,
			@RequestParam String lname, @RequestParam String email, @RequestParam String pass,
			@RequestParam String cpass, @RequestParam String mb, @RequestParam String dob, HttpSession session,
			RedirectAttributes flashmap) {

		if (pass.equals(cpass)) {
			Mechanic mechanic = userService.addNewMechanic(
					new Mechanic(fname, lname, email, pass, cpass, mb, Role.MECHANIC, LocalDate.parse(dob)));
			userService.linkMechanicAddress(mechanic.getId(),
					new MechanicAddress(address, city, district, zipcode, state, landmark, house));
			flashmap.addFlashAttribute("mechanic_msg", "New mechanic registered");
			return "redirect:/admin/home";
		} else {
			flashmap.addFlashAttribute("errmsg", "Password not matched");
			return "redirect:/admin/registermechanic";
		}

	}

	@GetMapping("/viewmechanics")
	public String viewMechanics(Model map) {
		List<Mechanic> mechanics = userService.getActiveMechanics(Status.ACTIVE, Role.MECHANIC);
		if (mechanics.size() != 0) {
			map.addAttribute("mechanic_details", mechanics);
		} else {
			map.addAttribute("nomechmsg", "No mechanics available");
		}
		return "/admin/viewmechanics";
	}

	@GetMapping("/mechanicprofile")
	public String viewMechanicProfile(HttpSession session, Model map, @RequestParam int id) {
		try {
			Mechanic retrievedUser = userService.getMechanicDetails(id);
			map.addAttribute("user_details", retrievedUser);
			MechanicAddress address = userService.getMechanicAddress(retrievedUser.getId());
			map.addAttribute("address_details", address);
			return "/admin/mechanicprofile";
		} catch (Exception e) {
			map.addAttribute("profilemsg", "Please link address");
			return "/admin/mechanicprofile";
		}
	}

	@GetMapping("/inactivemechanic")
	public String inactiveMechanicDetails(@RequestParam int id, RedirectAttributes flashMap) {
		userService.inactiveMechanic(id);
		flashMap.addFlashAttribute("deletemsg", "Mechanic with id " + id + " deactivated");
		return "redirect:/admin/viewmechanics";
	}

	@GetMapping("/editmechanicprofile")
	public String editMechanicProfile(HttpSession session, Model map, @RequestParam int id) {
		Mechanic retrievedUser = userService.getMechanicDetails(id);
		map.addAttribute("user_details", retrievedUser);
		MechanicAddress address = userService.getMechanicAddress(retrievedUser.getId());
		map.addAttribute("address_details", address);
		return "/admin/editmechanicprofile";
	}

	@PostMapping("/editmechanicprofile")
	public String processMechanicProfile(@RequestParam int id, @RequestParam String address, @RequestParam String house,
			@RequestParam String landmark, @RequestParam String city, @RequestParam("dist") String district,
			@RequestParam String state, @RequestParam String zipcode, @RequestParam String fname,
			@RequestParam String lname, @RequestParam String email, @RequestParam String mb, @RequestParam String dob,
			HttpSession session, RedirectAttributes flashMap, @RequestParam String ws) {

		Mechanic user = userService.getMechanicDetails(id);
		userService.updateMechanicDetails(user.getId(),
				new Mechanic(user.getId(), fname, lname, email, user.getPassword(), mb, Role.MECHANIC,
						LocalDate.parse(dob), ws),
				new MechanicAddress(user.getId(), address, city, district, zipcode, state, landmark, house));
		flashMap.addFlashAttribute("update_msg", "Personal details updated");
		return "redirect:/admin/mechanicprofile?id=" + user.getId();
	}

	@GetMapping("/viewappointments")
	public String viewAppointments() {
		return "/admin/viewappointments";
	}

	@GetMapping("/viewallappointments")
	public String processAppointmentForm(Model map) {
		List<Appointment> appointments = userService.getAppoinments();
		if (appointments.size() != 0) {
			map.addAttribute("appointment_details", appointments);
		} else {
			map.addAttribute("noappmsg", "No appoitments");
		}
		return "/admin/viewallappointments";
	}

	@GetMapping("/viewpendingappointments")
	public String pendingAppointmentForm(Model map) {
		List<Appointment> appointments = userService.getAppoinmentsByStatus(Status.PENDING);
		if (appointments.size() != 0) {
			map.addAttribute("appointment_details", appointments);
		} else {
			map.addAttribute("noappmsg", "No appoitments");
		}
		return "/admin/viewpendingappointments";
	}

	@GetMapping("/viewcompletedappointments")
	public String completedAppointmentForm(Model map) {
		List<Appointment> appointments = userService.getAppoinmentsByStatus(Status.COMPLETED);
		if (appointments.size() != 0) {
			map.addAttribute("appointment_details", appointments);
		} else {
			map.addAttribute("noappmsg", "No appoitments");
		}
		return "/admin/viewcompletedappointments";
	}

	@GetMapping("/appointmechanic")
	public String appointMechanic(@RequestParam int id, Model map) {
		String workingStatus = "FREE";
		List<Mechanic> mechanics = userService.getActiveMechanicsByWork(Status.ACTIVE, Role.MECHANIC, workingStatus);
		Appointment appointment = userService.getAppoinmentDetails(id);
		map.addAttribute("appointment_details", appointment);
		if (mechanics.size() != 0) {
			map.addAttribute("mechanic_details", mechanics);
		} else {
			map.addAttribute("nomechmsg", "No mechanics available");
		}
		return "/admin/appointmechanic";
	}

	@PostMapping("/appointmechanic")
	public String processAppointMechanic(@RequestParam("appointment_id") int appId,
			@RequestParam("mechanic_id") int mechId, RedirectAttributes flashmap) {
		userService.assignMechanicToAppointment(appId, mechId);
		String workingStatus = "BUSY";
		userService.changeWorkingStatus(mechId,workingStatus);
		flashmap.addFlashAttribute("mechassign", "Mechanic with id " + mechId + " assigned to appointment id " + appId);
		return "redirect:/admin/viewallappointments";
	}

	@GetMapping("/updateappointmentstatus")
	public String updateAppointmentStatus(@RequestParam int id, RedirectAttributes flashmap) {
		userService.updateAppStatus(id);
//		String workingStatus = "FREE";
//		userService.changeWorkingStatus(mechId,workingStatus);
		flashmap.addFlashAttribute("status_msg", "Status changed to COMPLETED of appointment id " + id);
		return "redirect:/admin/viewallappointments";
	}

	@GetMapping("/deleteappointment")
	public String deleteApp(@RequestParam int id, RedirectAttributes flashmap) {
		userService.deleteAppointment(id);
		flashmap.addFlashAttribute("delete_msg", "Appointment with id " + id + " deleted");
		
		return "redirect:/admin/viewallappointments";
	}

	@GetMapping("/addservices")
	public String showServiceForm() {
		return "/admin/addservices";
	}

	@PostMapping("/addservices")
	public String processServiceForm(@RequestParam String service, @RequestParam double amount,
			RedirectAttributes flashmap) {
		userService.addNewService(service, amount);
		flashmap.addFlashAttribute("ser_msg", "New service added");
		return "redirect:/admin/home";
	}

	@GetMapping("/generatebill")
	public String showGenerateBillForm(@RequestParam int id, Model map, HttpSession session) {
		Appointment appointment = userService.getAppoinmentDetails(id);
		Set<Service> services = userService.getServicesByAppointment(id);
		map.addAttribute("appointment_details", appointment);
		map.addAttribute("services", services);
		double total = 0, discount = 0, payalableAmount = 0;
		for (Service s : services) {
			total += s.getAmount();
		}
		if (total > 10000) {
			discount = total * 0.2;
		} else if (total > 5000) {
			discount = total * 0.1;
		} else if (total > 1000) {
			discount = total * 0.05;
		}
		payalableAmount = total - discount;
		map.addAttribute("total_amount", total);
		map.addAttribute("discount_amount", discount);
		session.setAttribute("payable_amount", payalableAmount);

		LocalDate date = LocalDate.now();
		map.addAttribute("date", date);
		return "/admin/generatebill";
	}

	@PostMapping("/generatebill")
	public String processGenerateBillForm(@RequestParam("appointment_id") int appId,
			@RequestParam("payment_mode") String paymentMode, @RequestParam("transaction_id") String transId,
			RedirectAttributes flashmap, HttpSession session) {

		double amount = (double) session.getAttribute("payable_amount");
		Payment payment = userService.addPaymentDetails(appId, new Payment(amount, paymentMode, transId));
		flashmap.addAttribute("pmsg", "Payment Successful with payment id " + payment.getId());
		return "redirect:/admin/viewcompletedappointments";
	}
}
