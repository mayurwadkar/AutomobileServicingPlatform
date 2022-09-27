package com.app.service;

import java.util.List;
import java.util.Set;

import com.app.entities.Address;
import com.app.entities.Appointment;
import com.app.entities.Mechanic;
import com.app.entities.MechanicAddress;
import com.app.entities.Payment;
import com.app.entities.Role;
import com.app.entities.Service;
import com.app.entities.Status;
import com.app.entities.User;
import com.app.entities.Vehicle;

public interface IUserService {

	User addNewUser(User user);

	Mechanic addNewMechanic(Mechanic mechanic);

	String linkAddress(int id, Address address);

	String linkMechanicAddress(int id, MechanicAddress address);

	User getUserDetails(int id);
	
	Mechanic getMechanicDetails(int id);

	Address getAddress(int id);
	
	MechanicAddress getMechanicAddress(int id);

	Vehicle addNewVehicle(Vehicle vehicle, int id);

	User validateUser(String email, String pass);
	
	Mechanic validateMechanic(String email, String pass);

	void updateUserDetails(Integer id, User user, Address address);
	
	void updateMechanicDetails(Integer id, Mechanic user, MechanicAddress address);

	void forgetPassword(User user);
	
	void forgetMechanicPassword(Mechanic user);

	List<Vehicle> getVehicles(User id);

	Vehicle getVehiclesById(int vehicleId);

	com.app.entities.Service getServiceById(int serviceId);

	void bookTheAppointment(Appointment appointment, int[] services);

	List<Appointment> getAllAppoinments(User user);

	List<Appointment> getAppointmentsByStatusAndUser(Status status, User user);
	
	List<Appointment> getAppointmentsByStatusAndMechanic(Status status, Mechanic user);

	List<User> getActiveCustomers(Status status, Role role);

	List<Mechanic> getActiveMechanics(Status status, Role role);
	
	List<Mechanic> getActiveMechanicsByWork(Status status, Role role, String workingStatus);

	void inactiveUser(int id);
	
	void inactiveMechanic(int id);

	User getUserByEmail(String email);

	void deleteUser(int id);

	void activateUser(int id);

	List<Appointment> getAppoinments();

	List<Appointment> getAppoinmentsByStatus(Status status);

	Appointment getAppoinmentDetails(int id);

	void assignMechanicToAppointment(int appId, int mechId);

	void updateAppStatus(int id);
	
	void deleteAppointment(int id);

	void addNewService(String service, double amount);

	Set<Service> getServicesByAppointment(int appointmentId);

	Payment addPaymentDetails(int appId, Payment payment);
	
	Payment updatePaymentDetails(int appId, Payment payment);

	Payment getPaymentDetailById(int appId);

	void changeWorkingStatus(int mechId, String workingStatus);

}
