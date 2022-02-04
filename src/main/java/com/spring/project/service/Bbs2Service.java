package com.spring.project.service;

import java.util.List;

import com.spring.project.model.Bbs2VO;

public interface Bbs2Service {

	void insertBbs2(Bbs2VO b2);

	int getTotalCount2(Bbs2VO b2);

	List<Bbs2VO> getBbsList(Bbs2VO b2);

	Bbs2VO getBbs2Cont(int bbs_no);

	Bbs2VO getBbs2Cont2(int bbs_no);

	void editBbs2(Bbs2VO b2);

	void delBbs(int bbs_no);
	
	List<Bbs2VO> getDistList(String dist_category);

	List<Bbs2VO> getSeasonList(String season_category);

	List<Bbs2VO> getConcertList(String concert_category);

}
