package com.duggu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.duggu.entity.Emp;

//create object for dao-emp and give this object to emp-dao in home controller
@Repository
public class EmpDaoImpl implements EmpDao {
	
	//inject data automatically
	@Autowired
	private HibernateTemplate hiber ;

	@Transactional
	public int saveEmp(Emp emp) {
		
	 int i = (Integer)hiber.save(emp);
		return i;
	}

	public Emp getEmpById(int id) {
	 Emp emp =	hiber.get(Emp.class, id);
		return emp;
	}

	public List<Emp> getAllEmp() {
	 List <Emp> list= hiber.loadAll(Emp.class);
		return list;
	}

	@Transactional
	public void update(Emp emp) {
		hiber.update(emp);
		
	}
	
     @Transactional
	public void deleteEmp(int id) {
		Emp emp =	hiber.get(Emp.class, id);
		hiber.delete(emp);
		
	}

}
