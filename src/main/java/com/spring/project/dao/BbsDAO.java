package com.spring.project.dao;

import java.util.List;

import com.spring.project.model.BbsVO;

public interface BbsDAO {

	void insertBbs(BbsVO b);

	int getTotalCount(BbsVO b);

	List<BbsVO> getBbsList(BbsVO b);

	void updateHit(int bbs_no);

	BbsVO getBbsCont(int bbs_no);

	void updateLevel(BbsVO rb);

	void replyBbs(BbsVO rb);

	void editBbs(BbsVO b);

	void delBbs(int bbs_no);


	void insertBbs2(BbsVO b);

	int getTotalCount2(BbsVO b);

	List<BbsVO> getBbs2List(BbsVO b);

	BbsVO getBbs2Cont(int bbs_no);

	void editBbs2(BbsVO b);

	void delBbs2(int bbs_no);
	
}
