package com.oracle.oBootMybatis03.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.oBootMybatis03.model.Dept;
import com.oracle.oBootMybatis03.model.Emp;
import com.oracle.oBootMybatis03.service.EmpService;
import com.oracle.oBootMybatis03.service.Paging;

@Controller
public class EmpController {
	@Autowired
	private EmpService es;
	
	@RequestMapping(value="list")
	public String list(Emp emp, String currentPage, Model model) {
		System.out.println("EmpController Start list.. .. .");
		int total = es.total(); //Emp Count ->14
		System.out.println("EmpController total=>" + total);
		System.out.println("currentPage=>" + currentPage);
		//						14		NULL(0,1 ...)
		//리스트작업, 페이징 작업(게시판 작업 페이징 작업) 먼저 서비스.Paging으로.
		Paging pg = new Paging(total, currentPage);
		emp.setStart(pg.getStart()); //시작시 1
		emp.setEnd(pg.getEnd());	 //시작시 10

		List<Emp> listEmp = es.listEmp(emp);
		System.out.println("EmpController list listEmp.size()=>" + listEmp.size());
		model.addAttribute("listEmp", listEmp);
		model.addAttribute("pg", pg);
		model.addAttribute("total", total);
		
		return "list";
		
	}
	
	@GetMapping(value="detail")
	public String detail(int empno, Model model) {
		
		//Emp emp = es.detail(emp)
		//Dao -> 	ed.detail(emp)
		//mapper --> tkEmpSelOne  , empno

		System.out.println("EmpController Start detail.......");
		Emp emp = es.detail(empno);
		model.addAttribute("emp", emp);
		return "detail";
		
	}
	@GetMapping(value="updateForm")
	public String updateForm(int empno, Model model) {
		System.out.println("EmpController Start updateForm.......");
		Emp emp = es.detail(empno);
		model.addAttribute("emp", emp);
		
		return "updateForm";
	}

	@PostMapping(value="update")
	public String update(Emp emp, Model model) {
		System.out.println("EmpController Start update.. .. .");
		// int k = es.update(emp);
		//Dao -> kkk = session.update("TKempUpdate", emp);
		//mapper --> TKempUpdate
		int uptCnt = es.update(emp);
		System.out.println("es.update(emp) Count-->" + uptCnt);
		model.addAttribute("uptCnt", uptCnt);	//
		model.addAttribute("kk3", "Message Test"); //
		
		//return "redirect:list"; //..없어짖ㄷ
		return "forward:list";	//이삿짐.'.ㅏㄷ.'ㄱ
		
	}
	
	@RequestMapping(value="writeForm")
	public String writeForm(Model model) {
		//Emp emp = null;
		//관리자 사번만 Get
		List<Emp> emplist = es.listManager();
		System.out.println("EmpController writeForm emplist.size->" + emplist.size());
		model.addAttribute("empMngList", emplist);	//emp Manager List
//		List<Dept> deptList = es.deptSelect();
//		model.addAttribute("deptList", deptList); //dept
		return "writeForm";
	}
	
	
	
}
	   
	   
	 		   

	   
	   
	   
	   
	 		   

