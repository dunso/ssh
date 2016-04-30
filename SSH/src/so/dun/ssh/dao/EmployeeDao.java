package so.dun.ssh.dao;

import java.util.List;

import org.hibernate.Query;

import so.dun.ssh.po.Employee;

public class EmployeeDao extends BaseDao{
	
	@SuppressWarnings("unchecked")
	public List<Employee> getAll() {
		String hql = "FROM Employee e LEFT OUTER JOIN FETCH e.department";
		return getSession().createQuery(hql).list();
	}
	
	public void delete(Integer id){
		String hql = "DELETE FROM Employee e WHERE e.id = ?";
		getSession().createQuery(hql).setInteger(0, id).executeUpdate();
	}
	
	public void saveOrUpdate(Employee employee){
		getSession().saveOrUpdate(employee);
	}
	
	public Employee getEmployeeByLastName(String lastName){
		String hql = "FROM Employee e WHERE e.lastName = ?";
		Query query = getSession().createQuery(hql).setString(0, lastName);
		return  (Employee) query.uniqueResult();
	}
	
	public Employee getEmployeeById(Integer id){
		return getSession().get(Employee.class, id);
	}
}
