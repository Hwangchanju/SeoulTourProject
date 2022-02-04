package com.spring.project.service;

import java.util.List;

import com.spring.project.model.BbsVO;

public interface BbsService {

	void insertBbs(BbsVO b);

	int getTotalCount(BbsVO b);

	List<BbsVO> getBbsList(BbsVO b);

	BbsVO getBbsCont(int bbs_no);

	BbsVO getBbs_cont2(int bbs_no);

	void replyBbs(BbsVO rb);

	void editBbs(BbsVO b);

	void delBbs(int bbs_no);

	
	void insertBbs2(BbsVO b);

	int getTotalCount2(BbsVO b);

	List<BbsVO> getBbs2List(BbsVO b);

	BbsVO getBbs2Cont(int bbs_no);

	BbsVO getBbs2_cont2(int bbs_no);

	void editBbs2(BbsVO b);

	void delBbs2(int bbs_no);

}
