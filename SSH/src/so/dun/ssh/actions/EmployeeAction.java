package so.dun.ssh.actions;


import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import so.dun.ssh.po.Employee;
import so.dun.ssh.service.DepartmentService;
import so.dun.ssh.service.EmployeeService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class EmployeeAction extends ActionSupport implements RequestAware,ModelDriven<Employee>,Preparable{

	private static final long serialVersionUID = 1L;
	
	private EmployeeService employeeService;
	private DepartmentService departmentService;
	private Map<String, Object> request;
	private Integer id;
	private InputStream inputStream;
	private Employee employeeModel;

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public InputStream getInputStream() {
		return inputStream;
	}
	
	public String delete(){
		
		try {
			employeeService.delete(id);
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (Exception e) {
			e.printStackTrace();
			try {
				inputStream = new  ByteArrayInputStream("0".getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		}
		return "ajax-success";
	}
	
	public String list() {
		List<Employee> list = employeeService.getAll();
		request.put("employees", list);
		return "list";
	}
	
	public void prepareInput(){
		if(id != null){
			employeeModel = employeeService.getEmployeeById(id);
		}
	}
	
	public String input(){
		request.put("departments", departmentService.getAll());
		return INPUT;
	}
	
	public void prepareSave(){
		if(id == null){
			employeeModel = new Employee();
		}else{
			employeeModel = employeeService.getEmployeeById(id);
		}
		
	}
	
	public String save(){
		if(id == null){
			employeeModel.setCreateTime(new Date());			
		}
		System.out.println(employeeModel.getDepartment().getId());
		employeeService.saveOrUpdate(employeeModel);
		return SUCCESS;
	}
	
	String lastName;
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String validateLastName() throws UnsupportedEncodingException{
		if(employeeService.isValid(lastName)){
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		}else{
			inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
		}
		return "ajax-success";
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	
	@Override
	public void prepare() throws Exception {}

	@Override
	public Employee getModel() {
		return employeeModel;
	}



}
