package com.app.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.custom_exception.ASPException;
import com.app.entities.Address;
import com.app.entities.Appointment;
import com.app.entities.Mechanic;
import com.app.entities.MechanicAddress;
import com.app.entities.Payment;
import com.app.entities.Role;
import com.app.entities.Status;
import com.app.entities.User;
import com.app.entities.Vehicle;
import com.app.repository.IAddressRepository;
import com.app.repository.IAppointmentRepository;
import com.app.repository.IMechanicAddressRepository;
import com.app.repository.IMechanicRepository;
import com.app.repository.IPaymentRepository;
import com.app.repository.IServiceRepository;
import com.app.repository.IUserRepository;
import com.app.repository.IVehicleRepository;

@Service
@Transactional
public class UserServiceImpl implements IUserService {
	@Autowired
	private IUserRepository userRepo;
	@Autowired
	private IAddressRepository addressRepo;
	@Autowired
	private IVehicleRepository vehicleRepo;
	@Autowired
	private IAppointmentRepository appointmentRepo;
	@Autowired
	private IServiceRepository serviceRepo;
	@Autowired
	private IMechanicRepository mechanicRepo;
	@Autowired
	private IMechanicAddressRepository mechanicAddressRepo;
	@Autowired
	private IPaymentRepository paymentRepo;

	@Override
	public User addNewUser(User user) {
		return userRepo.save(user);
	}

	@Override
	public Mechanic addNewMechanic(Mechanic mechanic) {
		return mechanicRepo.save(mechanic);
	}

	@Override
	public String linkAddress(int id, Address address) {
		User user = userRepo.findById(id).orElseThrow(() -> new ASPException("Wrong id"));
		address.setUser(user);
		addressRepo.save(address);
		return "Address linked to user " + user.getLastName();
	}

	@Override
	public String linkMechanicAddress(int id, MechanicAddress address) {
		Mechanic mechanic = mechanicRepo.findById(id).orElseThrow(() -> new ASPException("Wrong id"));
		address.setMechanic(mechanic);
		mechanicAddressRepo.save(address);
		return "Address linked to user " + mechanic.getLastName();
	}

	@Override
	public User getUserDetails(int id) {
		return userRepo.findById(id).orElseThrow(() -> new ASPException("Wrong id"));
	}

	@Override
	public Mechanic getMechanicDetails(int id) {
		return mechanicRepo.findById(id).orElseThrow(() -> new ASPException("Wrong id"));
	}

	@Override
	public Address getAddress(int id) {
		return addressRepo.findById(id).orElseThrow(() -> new ASPException("Wrong id"));
	}

	@Override
	public MechanicAddress getMechanicAddress(int id) {
		return mechanicAddressRepo.findById(id).orElseThrow(() -> new ASPException("Wrong id"));
	}

	@Override
	public Vehicle addNewVehicle(Vehicle vehicle, int id) {
		User user = userRepo.findById(id).orElseThrow(() -> new ASPException("Wrong id"));
		Vehicle veh = vehicleRepo.save(vehicle);
		veh.setUser(user);
		return null;
	}

	@Override
	public User validateUser(String email, String pass) {
		return userRepo.findByEmailAndPassword(email, pass);
	}
	
	@Override
	public Mechanic validateMechanic(String email, String pass) {
		return mechanicRepo.findByEmailAndPassword(email, pass);
	}

	@Override
	public void updateUserDetails(Integer id, User user, Address address) {
		userRepo.save(user);
		addressRepo.save(address);
	}

	@Override
	public void updateMechanicDetails(Integer id, Mechanic user, MechanicAddress address) {
		mechanicRepo.save(user);
		mechanicAddressRepo.save(address);
	}

	@Override
	public void forgetPassword(User user) {
		User u = userRepo.findByEmailAndDob(user.getEmail(), user.getDob());
		u.setPassword(user.getPassword());
	}

	@Override
	public List<Vehicle> getVehicles(User u) {
		return vehicleRepo.findByUser(u);
	}

	@Override
	public Vehicle getVehiclesById(int vehicleId) {
		return vehicleRepo.findById(vehicleId).orElseThrow(() -> new ASPException("Wrong id"));
	}

	@Override
	public com.app.entities.Service getServiceById(int serviceId) {
		return serviceRepo.findById(serviceId).orElseThrow(() -> new ASPException("Wrong id"));
	}

	@Override
	public void bookTheAppointment(Appointment appointment, int[] services) {
		appointmentRepo.save(appointment);
		for (int s : services) {
			com.app.entities.Service ser = getServiceById(s);
			appointment.getServices().add(ser);
		}
	}

	@Override
	public List<Appointment> getAllAppoinments(User user) {
		return appointmentRepo.findByUser(user);
	}

	@Override
	public List<Appointment> getAppointmentsByStatusAndUser(Status status, User user) {
		return appointmentRepo.findByStatusAndUser(status, user);
	}
	
	@Override
	public List<Appointment> getAppointmentsByStatusAndMechanic(Status status, Mechanic user) {
		return appointmentRepo.findByStatusAndMechanic(status, user);
	}

	@Override
	public List<User> getActiveCustomers(Status status, Role role) {
		return userRepo.findByStatusAndRole(status, role);
	}
	
	@Override
	public List<Mechanic> getActiveMechanics(Status status, Role role) {
		return mechanicRepo.findByStatusAndRole(status, role);
	}

	@Override
	public List<Mechanic> getActiveMechanicsByWork(Status status, Role role,  String workingStatus) {
		return mechanicRepo.findByStatusAndRoleAndWorkingStatus(status, role, workingStatus);
	}

	@Override
	public void inactiveUser(int id) {
		User user = userRepo.findById(id).orElseThrow(() -> new ASPException("Wrong id"));
		user.setStatus(Status.INACTIVE);
	}

	@Override
	public void inactiveMechanic(int id) {
		Mechanic user = mechanicRepo.findById(id).orElseThrow(() -> new ASPException("Wrong id"));
		user.setStatus(Status.INACTIVE);
	}

	@Override
	public User getUserByEmail(String email) {
		return userRepo.findByEmail(email);
	}

	@Override
	public void deleteUser(int id) {
		User user = userRepo.findById(id).orElseThrow(() -> new ASPException("Wrong id"));
		Address address = addressRepo.findById(id).orElseThrow(() -> new ASPException("Wrong id"));
		addressRepo.delete(address);
		userRepo.delete(user);
	}

	@Override
	public void activateUser(int id) {
		User user = userRepo.findById(id).orElseThrow(() -> new ASPException("Wrong id"));
		user.setStatus(Status.ACTIVE);
	}

	@Override
	public List<Appointment> getAppoinments() {
		return appointmentRepo.findAll();
	}

	@Override
	public List<Appointment> getAppoinmentsByStatus(Status status) {
		return appointmentRepo.findByStatus(status);
	}

	@Override
	public Appointment getAppoinmentDetails(int id) {
		return appointmentRepo.findById(id).orElseThrow(() -> new ASPException("Wrong id"));
	}

	@Override
	public void assignMechanicToAppointment(int appId, int mechId) {
		Appointment appointment = appointmentRepo.findById(appId).orElseThrow(() -> new ASPException("Wrong id"));
		Mechanic mechanic = mechanicRepo.findById(mechId).orElseThrow(() -> new ASPException("Wrong id"));
		appointment.setMechanic(mechanic);
	}

	@Override
	public void updateAppStatus(int id) {
		Appointment appointment = appointmentRepo.findById(id).orElseThrow(() -> new ASPException("Wrong id"));
		appointment.setStatus(Status.COMPLETED);
		appointment.setCompletedDate(LocalDate.now());
		appointment.setCompletedTime(LocalTime.now());
		appointment.getMechanic().setWorkingStatus("FREE");
	}

	@Override
	public void deleteAppointment(int id) {
		Appointment appointment = appointmentRepo.findById(id).orElseThrow(() -> new ASPException("Wrong id"));
		appointmentRepo.delete(appointment);
	}

	@Override
	public void addNewService(String service, double amount) {
		serviceRepo.save(new com.app.entities.Service(service, amount));		
	}

	@Override
	public Set<com.app.entities.Service> getServicesByAppointment(int appointmentId) {
		Appointment appointment = appointmentRepo.findById(appointmentId).orElseThrow(() -> new ASPException("Wrong id"));
		Set<com.app.entities.Service> services = appointment.getServices();
		return services;
	}

	@Override
	public Payment addPaymentDetails(int appId, Payment payment) {
		Appointment appointment = appointmentRepo.findById(appId).orElseThrow(() -> new ASPException("Wrong id"));
		Payment p = paymentRepo.save(payment);
		payment.setAppointment(appointment);
		return p;
	}

	@Override
	public Payment getPaymentDetailById(int appId) {
		return paymentRepo.findById(appId).orElseThrow(() -> new ASPException("Wrong id"));
	}

	@Override
	public Payment updatePaymentDetails(int appId, Payment payment) {
		Appointment appointment = appointmentRepo.findById(appId).orElseThrow(() -> new ASPException("Wrong id"));
		Payment p = paymentRepo.save(payment);
		p.setAppointment(appointment);
		return p;
	}

	@Override
	public void forgetMechanicPassword(Mechanic user) {
		Mechanic u = mechanicRepo.findByEmailAndDob(user.getEmail(), user.getDob());
		u.setPassword(user.getPassword());
	}

	@Override
	public void changeWorkingStatus(int mechId, String workingStatus) {
		Mechanic user = mechanicRepo.findById(mechId).orElseThrow(() -> new ASPException("Wrong id"));
		user.setWorkingStatus(workingStatus);	
	}

}
