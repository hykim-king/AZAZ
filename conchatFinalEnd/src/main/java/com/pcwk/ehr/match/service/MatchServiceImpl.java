package com.pcwk.ehr.match.service;

import java.sql.SQLException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.match.dao.MatchDao;
import com.pcwk.ehr.user.domain.MatchVO;
import com.pcwk.ehr.user.domain.UserVO;

@Service("matchServiceImpl")
public class MatchServiceImpl implements MatchService{

	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	private MatchDao matchDao;
	
	public MatchServiceImpl() {}
	
	@Override
	public int doSaveMatch(MatchVO inVO) throws SQLException {
		return matchDao.doSaveMatch(inVO);
	}
	
	@Override
	public int doFinishMatch(UserVO inVO) throws SQLException {
		return matchDao.doFinishMatch(inVO);
	}
	
	@Override
	public Integer doFindChatValue(UserVO inVO) throws SQLException {
		return matchDao.doFindChatValue(inVO);
	}
	
	@Override
	public String doMatch(UserVO inVO) throws SQLException {
		return matchDao.doMatch(inVO);
	}

	@Override
	public String doFindLolNickname(UserVO inVO) throws SQLException {
		return matchDao.doFindLolNickname(inVO);
	}

	@Override
	public String doFindValNickname(UserVO inVO) throws SQLException {
		return matchDao.doFindValNickname(inVO);
	}

	@Override
	public String doFindLolcheNickname(UserVO inVO) throws SQLException {
		return matchDao.doFindLolcheNickname(inVO);
	}
}
