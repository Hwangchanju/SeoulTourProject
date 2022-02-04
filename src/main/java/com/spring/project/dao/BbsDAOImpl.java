package com.spring.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project.model.BbsVO;

@Repository //@Repository 애노테이션으로 스프링에 DAOImpl 이라는것을 인식하게한다.
public class BbsDAOImpl implements BbsDAO {

	@Autowired //자동 의존성 주입
	private SqlSession sqlSession; //sqlSession 은 mybatis쿼리문 수행 

	@Override
	public void insertBbs(BbsVO b) {
		this.sqlSession.insert("bbs_in",b); //mybatis에서 insert()메서드는 레코드를 저장시킴. bbs_indms bbs.xml에서 저장할 유일한 insert 아이디명
		
	}//자료실 저장

	@Override
	public int getTotalCount(BbsVO b) {
		return this.sqlSession.selectOne("bbs_count",b); //mybatis에서 selectone()메서드는 단 한개의 레코드 값만 반환
	}//총레코드 개수

	@Override
	public List<BbsVO> getBbsList(BbsVO b) {
		return this.sqlSession.selectList("bbs_list",b); //mybatis에서 selectList()메서드는 하나이상의 레코드를 검색해서 컬렉션 list로 반환
	}//자료실 목록

	@Override
	public void updateHit(int bbs_no) {
		sqlSession.update("bbs_hi",bbs_no);
	}//조회수 증가

	@Override
	public BbsVO getBbsCont(int bbs_no) {
		return this.sqlSession.selectOne("bbs_co",bbs_no);
	}//내용보기

	@Override
	public void updateLevel(BbsVO rb) {
		this.sqlSession.update("level_up",rb);
	}//답변 레벨 증가

	@Override
	public void replyBbs(BbsVO rb) {
		this.sqlSession.insert("reply_in2",rb);	
	}//답변 저장

	@Override
	public void editBbs(BbsVO b) {
		this.sqlSession.update("bbs_edit",b);
	}//자료실 수정

	@Override
	public void delBbs(int bbs_no) {
		this.sqlSession.delete("bbs_del",bbs_no);
	}//자료실 삭제
	

	@Override
	public void insertBbs2(BbsVO b) {
		this.sqlSession.insert("bbs2_in",b);
	}

	@Override
	public int getTotalCount2(BbsVO b) {
		return this.sqlSession.selectOne("bbs2_count",b);
	}

	@Override
	public List<BbsVO> getBbs2List(BbsVO b) {
		return this.sqlSession.selectList("bbs2_list",b);
	}

	@Override
	public BbsVO getBbs2Cont(int bbs_no) {
		return this.sqlSession.selectOne("bbs2_co",bbs_no);
	}

	@Override
	public void editBbs2(BbsVO b) {
		this.sqlSession.update("bbs2_edit",b);
	}

	@Override
	public void delBbs2(int bbs_no) {
		this.sqlSession.delete("bbs2_del",bbs_no);
	}
	
}
