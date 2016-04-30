package so.dun.ssh.service;

import java.util.List;

import so.dun.ssh.dao.EmployeeDao;
import so.dun.ssh.po.Employee;

public class EmployeeService {

	private EmployeeDao employeeDao;
	
	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}
	
	public List<Employee> getAll(){
		return employeeDao.getAll();
	}

	public void delete(Integer id) {
		employeeDao.delete(id);
	}
	
	public void saveOrUpdate(Employee employee){
		employeeDao.saveOrUpdate(employee);
	}
	
	public boolean isValid(String lastName){
		return employeeDao.getEmployeeByLastName(lastName) == null;
	}
	
	public Employee getEmployeeById(Integer id){
		return employeeDao.getEmployeeById(id);
	}
}


