package com.newgk.crud.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.newgk.crud.bean.Department;
import com.newgk.crud.bean.Employee;
import com.newgk.crud.dao.DepartmentMapper;
import com.newgk.crud.dao.EmployeeMapper;

/**
 * 	测试dao层工作
 * @author 82019
 *	1、导入 spring test 模块
 *	2、ContextConfiguration指定Spring配置文件的位置
 *	3、直接@Autowired
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
	
	@Autowired
	DepartmentMapper departmentMapper;
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	@Autowired
	SqlSession sqlSession;
	
	@Test
	public void testCRUD() {
		
		System.out.println(departmentMapper);
		
		//1、插入部门
		departmentMapper.insert(new Department(null, "测试部"));
		departmentMapper.insert(new Department(null, "开发部"));
		
		//2、插入员工
		employeeMapper.insert(new Employee(null, "张建国", "M", "820193452@qq.com", 1));
		//3、批量插入，使用可以执行批量操作的sqlSession
		EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
		for (int i = 0; i < 1000; i++) {
			String uid = UUID.randomUUID().toString().substring(0, 5) + i;
			mapper.insert(new Employee(null, uid, "M", uid + "@newgk.com", 1));
		}
		System.out.println("批量完成！！");
	}
	
}
