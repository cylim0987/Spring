package com.oracle.oBootMybatis03.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.oBootMybatis03.dao.EmpDao;
import com.oracle.oBootMybatis03.model.Emp;

@Service
public class EmpServiceImpl implements EmpService {
	@Autowired
	private EmpDao ed;
	
	@Override
	public int total() {
		System.out.println("EmpServiceImpl Start total.. ..");
		int totCnt = ed.total();
		System.out.println("EmpServiceImpl total totCnt->" + totCnt);
		return totCnt;
	
	}

	@Override
	public List<Emp> listEmp(Emp emp) {
		List<Emp> empList = null;
		System.out.println("EmpServiceImpl listEmp Start... ..");
		empList = ed.listEmp(emp);
		System.out.println("EmpServiceImpl listEmp empList.size()->" + empList.size());
		
		return empList;
		
	}

	@Override
	public Emp detail(int empno) {
		System.out.println("EmpServiceImpl detail ...");
		Emp emp = null;
		emp = ed.detail(empno);
		return emp;
	}

	@Override
	public int update(Emp emp) {
		System.out.println("EmpServiceImpl update ...");	
		int kkk = 0;
		kkk = ed.update(emp);
		return kkk;
	}

	@Override
	public List<Emp> listManager() {
		//empList = ed.listManager();
													//mapper
		//Dao ------>empList = session.selectList("tkSelectManager");
	
		// 						관리자만 Get
		List<Emp> empList = null;
		System.out.println("EmpServiceImpl listManager Start .. ...");
		empList = ed.listManager();
		System.out.println("EmpServiceImpl listEmp empList.size()->" + empList.size());
		return empList;
		
	}

}
