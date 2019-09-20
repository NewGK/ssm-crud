package com.newgk.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newgk.crud.bean.Employee;
import com.newgk.crud.bean.EmployeeExample;
import com.newgk.crud.bean.EmployeeExample.Criteria;
import com.newgk.crud.dao.EmployeeMapper;

@Service
public class EmployeeService {
	
	/**
	 * 查询所有员工
	 */
	@Autowired
	EmployeeMapper employeeMapper;

	public List<Employee> getAll() {
		return employeeMapper.selectByExampleWithDept(null);
		// TODO Auto-generated method stub
		
	}

	public void saveEmp(Employee employee) {
		// TODO Auto-generated method stub
		employeeMapper.insertSelective(employee);
	}
	/**
	 * 	检验用户名是否可用
	 * @param empName
	 * @return
	 */
	public boolean checkUser(String empName) {
		// TODO Auto-generated method stub
		
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long count = employeeMapper.countByExample(example);
		return count == 0;
	}

	public Employee getEmp(Integer id) {
		// TODO Auto-generated method stub
		Employee employee = employeeMapper.selectByPrimaryKey(id);
		return employee;
	}

	public void updateEmp(Employee employee) {
		// TODO Auto-generated method stub
		employeeMapper.updateByPrimaryKeySelective(employee);
	}

	public void deleteEmp(Integer id) {
		// TODO Auto-generated method stub
		employeeMapper.deleteByPrimaryKey(id);
	}

	public void deleteBatch(List<Integer> ids) {
		// TODO Auto-generated method stub
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andDIdIn(ids);
		employeeMapper.deleteByExample(example);
	}

}
