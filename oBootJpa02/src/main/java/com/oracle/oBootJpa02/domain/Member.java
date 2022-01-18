package com.oracle.oBootJpa02.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Getter;
import lombok.Setter;

//entity로 되어이쓴 객체들만 관리.
@Entity
//lombok......................
@Getter
@Setter
@SequenceGenerator(name = "member_seq_gen",
					sequenceName = "member_seq_generator", //매핑할 DB에서 사용할  시퀀스 이름
					initialValue = 1,
					allocationSize = 1
					)
@Table(name = "member1") //jpa에서는 없이 해봤는데 진짜 member테이블 찾아가고,,,,팀이 서로 멤버1 멤버2로 했을 때...이것만 바꾸면
public class Member { // 
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, //자동.asdf
					generator = "member_seq_gen" //_seq_객체에서 사용할 seq이름.			
					)
	@Column(name = "member_id", precision = 10)
	private Long id;
	@Column(name = "user_name", length = 50)
	private String name;

	// FK //foriegn key //forieng key가 있는 쪽에서 걸라.
	//다대일. 예측이 안되는 건 쓰지말..
	@ManyToOne 
	@JoinColumn(name = "team_id")
	private Team	team;
	
	//실제 컬럼은 아닌데 ?는 가져갈 필요가 있으 ㄹ때. transient
	@Transient
	private Long teamid;
	@Transient
	private String teamname;
	
	
	
//	public Long getId() {
//		return id;
//	}
//	public void setId(Long id) {
//		this.id = id;
//	}
//	public String getName() {
//		return name;
//	}
//	public void setName(String name) {
//		this.name = name;
//	}
//	
	
}
