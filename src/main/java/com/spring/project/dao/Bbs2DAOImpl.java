package com.spring.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project.model.Bbs2VO;




@Repository
public class Bbs2DAOImpl implements Bbs2DAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertBbs2(Bbs2VO b2) {
		this.sqlSession.insert("bbs2_in",b2);
	}//자료실 저장

	@Override
	public int getTotalCount2(Bbs2VO b2) {
		return this.sqlSession.selectOne("bbs2_count",b2);
	}//총레코드 개수

	@Override
	public List<Bbs2VO> getBbsList(Bbs2VO b2) {
		return this.sqlSession.selectList("bbs2_list",b2);
	}//자료실 목록

	@Override
	public void updateHit(int bbs_no) {
		this.sqlSession.update("bbs2_hi",bbs_no);
	}//조회수 증가

	@Override
	public Bbs2VO getBbs2Cont(int bbs_no) {
		return this.sqlSession.selectOne("bbs2_co",bbs_no);
	}

	@Override
	public void editBbs2(Bbs2VO b2) {
		this.sqlSession.update("bbs2_edit",b2);
	}

	@Override
	public void delBbs(int bbs_no) {
		this.sqlSession.delete("bbs2_del",bbs_no);
	}
	
	@Override
	public List<Bbs2VO> getDistList(String dist_category) {
		return this.sqlSession.selectList("dist_list", dist_category);
	}

	@Override
	public List<Bbs2VO> getSeasonList(String season_category) {
		return this.sqlSession.selectList("sea_list", season_category);
	}

	@Override
	public List<Bbs2VO> getConcertList(String concert_category) {
		return this.sqlSession.selectList("con_list", concert_category);
	}

}
