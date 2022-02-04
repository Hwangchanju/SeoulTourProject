package com.spring.project.service;

import java.beans.Transient;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.project.commons.SearchVO;
import com.spring.project.dao.user.IUserMapper;
import com.spring.project.model.ContVO;
import com.spring.project.model.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private IUserMapper mapper;

	@Transactional
	@Override
	public int u_join(UserVO vo) {

		List<UserVO> check = mapper.u_selectPhoneEmail(vo);
		if (check.size() == 0) {
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			String securePW = encoder.encode(vo.getUser_pwd());

			vo.setUser_pwd(securePW);
			int result = mapper.u_join(vo);
			return result;
		} else {
			return 0;
		}

	}

	@Override
	public List<UserVO> u_selectPhoneEmail(UserVO vo) {
		return mapper.u_selectPhoneEmail(vo);
	}

	@Override
	public int u_checkIdDuplicate(String user_id) {
		return mapper.u_checkIdDuplicate(user_id);
	}

	@Override
	public UserVO u_selectOne(String user_id) {
		return mapper.u_selectOne(user_id);
	}

	/*
	 * @Override public List<UserVO> u_findAll() { return mapper.u_findAll(); }
	 */

	// -----------------

	@Override
	public UserVO u_findId(UserVO vo, String find_by) {
		return mapper.u_findId(vo, find_by);
	}

	@Transactional
	@Override
	public UserVO u_findPw(UserVO vo, String find_by) {
		// System.out.println(vo.toString());

		int leftLimit = 48; // 0
		int rightLimit = 122; // z
		int targetStringLength = 10;

		Random random = new Random();

		String generatedString = random.ints(leftLimit, rightLimit + 1) // 시작과 끝범위 지정
				.filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97)).limit(targetStringLength) // 최종 길이 설정
				.collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append).toString();

		// ClassName::new의 형식으로 생성자를 나타낼 수 있음
		// StringBuilder : A mutable sequence of characters

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePW = encoder.encode(generatedString);

		// System.out.println("id : " + vo.getUser_id());
		UserVO r;

		r = mapper.u_selectOne(vo.getUser_id());
		System.out.println(r.toString());

		if (find_by.equals("byEmail")) {
			if (r.getUser_mail_id().equals(vo.getUser_mail_id())
					&& r.getUser_mail_domain().equals(vo.getUser_mail_domain())
					&& r.getUser_id().equals(vo.getUser_id()) && r.getUser_name().equals(vo.getUser_name())) {
				r.setUser_pwd(securePW);
				mapper.u_updatePw(r);

				r.setUser_pwd(generatedString);

				return r;
			} else {
				return null;
			}
		} else {
			if (r.getUser_phone().equals(vo.getUser_phone()) && r.getUser_id().equals(vo.getUser_id())
					&& r.getUser_name().equals(vo.getUser_name())) {
				r.setUser_pwd(securePW);
				mapper.u_updatePw(r);

				r.setUser_pwd(generatedString);

				return r;
			} else {
				return null;
			}
		}

	}

	@Transactional
	@Override
	public int u_updateMyPage(UserVO vo) {

		// 비밀번호가 수정된 경우
		if (!vo.getUser_pwd().equals("")) {

			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			String securePW = encoder.encode(vo.getUser_pwd());
			vo.setUser_pwd(securePW);

			int pwSave = mapper.u_updatePw(vo);
			if (pwSave != 1) {
				return 0;
			}

			return mapper.u_updateMyPage(vo);
		} else {
			// 비밀번호가 수정되지 않은 경우
			UserVO pwd = mapper.u_selectOne(vo.getUser_id());
			vo.setUser_pwd(pwd.getUser_pwd());
			return mapper.u_updateMyPage(vo);
		}

	}

	@Override
	public int u_delete(UserVO vo) {
		return mapper.u_delete(vo);
	}

	// --------------------------------//

	@Override
	public int u_insertCont(ContVO vo) {
		return mapper.u_insertCont(vo);
	}

	@Transactional
	@Override
	public ContVO u_selectCont(int content_no) {
		mapper.u_updateHit(content_no);
		return mapper.u_selectCont(content_no);
	}

	@Override
	public List<ContVO> u_ListCont(SearchVO search) {

		List<ContVO> list = mapper.u_ListCont(search);
		// 1일 이내 신규글 new마크 처리 로직
		for (ContVO article : list) {
			// 현재 시간 읽어오기
			long now = System.currentTimeMillis(); // 현재 시간을 밀리초로 리턴하는 메서드

			// 각 게시물들의 작성 시간을 밀리초로 읽어오기
			long regTime = article.getContent_regdate().getTime();

			if (now - regTime < 60 * 60 * 24 * 1000) {
				article.setNewCont(true);
			}

		}
		return list;
	}

	@Override
	public List<ContVO> u_HitListCont(SearchVO search) {
		List<ContVO> list = mapper.u_HitListCont(search);
		// 1일 이내 신규글 new마크 처리 로직
		for (ContVO article : list) {
			// 현재 시간 읽어오기
			long now = System.currentTimeMillis(); // 현재 시간을 밀리초로 리턴하는 메서드

			// 각 게시물들의 작성 시간을 밀리초로 읽어오기
			long regTime = article.getContent_regdate().getTime();

			if (now - regTime < 60 * 60 * 24 * 1000) {
				article.setNewCont(true);
			}

		}
		return list;
	}

	@Override
	public int u_ContTotalCount(SearchVO search) {
		return mapper.u_ContTotalCount(search);
	}

	@Override
	public int u_editCont(ContVO vo) {
		return mapper.u_editCont(vo);
	}

	@Override
	public int u_deleteCont(int content_no) {
		return mapper.u_deleteCont(content_no);
	}

	@Transactional
	@Override
	public int u_insertReply(ContVO vo) {
		vo.setContent_name(mapper.u_selectOne(vo.getContent_id()).getUser_name());
		return mapper.u_insertReply(vo);
	}

	@Transactional
	@Override
	public ContVO u_editReply(ContVO vo) {

		int result = mapper.u_editReply(vo);
		if (result == 1) {
			ContVO cont = mapper.u_selectReply(vo.getContent_no());
			return cont;
		} else {
			return null;
		}
	}

	@Override
	public List<ContVO> u_selectReplies(int content_no, int content_step) {
		ContVO vo = new ContVO();
		vo.setContent_no(content_no);
		vo.setContent_step(content_step);

		List<ContVO> replies = mapper.u_selectReplies(vo);
		for (ContVO r : replies) {
			// 현재 시간 읽어오기
			long now = System.currentTimeMillis(); // 현재 시간을 밀리초로 리턴하는 메서드

			// 각 게시물들의 작성 시간을 밀리초로 읽어오기
			long regTime = r.getContent_regdate().getTime();

			if (now - regTime < 60 * 60 * 24 * 1000) {
				r.setNewCont(true);
			}

		}
		return replies;
	}

	@Override
	public List<ContVO> u_mypageListCont(SearchVO search) {
		return mapper.u_mypageListCont(search);
	}

	@Override
	public int u_mypageContTotalCount(SearchVO search) {
		return mapper.u_mypageContTotalCount(search);
	}
}
