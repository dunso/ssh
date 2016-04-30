package so.dun.ssh.service;

import java.util.List;

import so.dun.ssh.dao.DepartmentDao;
import so.dun.ssh.po.Department;

public class DepartmentService {
	private DepartmentDao departmentDao;
	
	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}
	
	public List<Department> getAll(){
		return departmentDao.getAll();
	}

}
