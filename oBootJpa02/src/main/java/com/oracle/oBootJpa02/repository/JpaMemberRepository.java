package com.oracle.oBootJpa02.repository;

import java.util.List;

import javax.persistence.EntityManager;

import com.oracle.oBootJpa02.domain.Member;
import com.oracle.oBootJpa02.domain.Team;

//DAO는 언제든지 부품처럼 교체할 수 있다.
public class JpaMemberRepository implements MemberRepository {
	private final EntityManager em;

	public JpaMemberRepository(EntityManager em) {
		this.em = em;
	}

	@Override
	public Member save(Member member) {
		// 팀 저장
		Team team = new Team();
		team.setName(member.getTeamname());
		em.persist(team);
		// 회원 저장
		member.setTeam(team); // 단방향 연관관계 설정, 참조 저장
		em.persist(member);
		return member; //한꺼번에 만든거임.
	}

	@Override
	public List<Member> findAll() {
		List<Member> memberList = em.createQuery("select m from Member m", Member.class).getResultList(); //멤버형식, 클래스 Member.class. " Member"는 테이블 멤버가 아니었음.
		return memberList;
	}

	@Override
	public Member findByMember(Long id) {
		// Entity PK
		Member member = em.find(Member.class, id);

		return member;
	}

	@Override
	public int updateByMember(Member member) {
		int result = 0;
		System.out.println("JpaMemberRepository updateByMember member.getId()->"
							+ member.getId());
		Member member3 = em.find(Member.class, member.getId());
		if (member3 != null) {
			// 팀 저장
			System.out.println("JpaMemberRepository updateByMember member.getTeamId()->"
								+ member.getTeamid());
			Team team = em.find(Team.class, member.getTeamid());
			if (team != null) {
				System.out.println("JpaMemberRepository updateByMember member.getTeamname()->"
									+ member.getTeamname());
				team.setName(member.getTeamname());
				em.persist(team);
			}
			// 회원 저장
			System.out.println("JpaMemberRepository updateByMember member.getName()->"
								+ member.getName());
			member3.setTeam(team); // 단방향 연관관계 설정, 참조 저장
			member3.setName(member.getName()); // 단방향 연관관계 설정, 참조 저장
			em.persist(member3);
			System.out.println("JpaMemberRepository updateByMember member.getName()->" + member.getName());
			result = 1;

		} else {
			result = 0;
			System.out.println("JpaMemberRepository updateByMember No Exist... #...");
		}

		return result;
	}

}
