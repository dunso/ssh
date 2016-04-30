package so.dun.ssh.dao;

import java.util.List;

import so.dun.ssh.po.Department;

public class DepartmentDao extends BaseDao{

	@SuppressWarnings("unchecked")
	public List<Department> getAll(){
		String hql = "FROM Department";
		return getSession().createQuery(hql).list();
	}
}
