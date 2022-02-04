package com.spring.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.project.dao.Bbs2DAO;
import com.spring.project.model.Bbs2VO;

@Service
public class Bbs2ServiceImpl implements Bbs2Service {

	@Autowired
	private Bbs2DAO bbs2Dao;

	@Override
	public void insertBbs2(Bbs2VO b2) {
		this.bbs2Dao.insertBbs2(b2);
	}

	@Override
	public int getTotalCount2(Bbs2VO b2) {
		return this.bbs2Dao.getTotalCount2(b2);
	}

	@Override
	public List<Bbs2VO> getBbsList(Bbs2VO b2) {
		return this.bbs2Dao.getBbsList(b2);
	}

	@Transactional
	@Override
	public Bbs2VO getBbs2Cont(int bbs_no) {
		this.bbs2Dao.updateHit(bbs_no);
		return this.bbs2Dao.getBbs2Cont(bbs_no);
	}

	@Override
	public Bbs2VO getBbs2Cont2(int bbs_no) {
		return this.bbs2Dao.getBbs2Cont(bbs_no);
	}

	@Override
	public void editBbs2(Bbs2VO b2) {
		this.bbs2Dao.editBbs2(b2);
	}

	@Override
	public void delBbs(int bbs_no) {
		this.bbs2Dao.delBbs(bbs_no);
	}
	

	@Override
	public List<Bbs2VO> getDistList(String dist_category) {
		return this.bbs2Dao.getDistList(dist_category);
	}

	@Override
	public List<Bbs2VO> getSeasonList(String season_category) {
		return this.bbs2Dao.getSeasonList(season_category);
	}

	@Override
	public List<Bbs2VO> getConcertList(String concert_category) {
		return this.bbs2Dao.getConcertList(concert_category);
	}

}
