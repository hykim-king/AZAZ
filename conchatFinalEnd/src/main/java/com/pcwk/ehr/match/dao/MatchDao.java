package com.pcwk.ehr.match.dao;

import java.sql.SQLException;

import com.pcwk.ehr.cmn.WorkDiv;
import com.pcwk.ehr.user.domain.MatchVO;
import com.pcwk.ehr.user.domain.UserVO;

public interface MatchDao {
	
	String doFindValNickname(UserVO inVO) throws SQLException;
	
	String doFindLolcheNickname(UserVO inVO) throws SQLException;
	
	String doFindLolNickname(UserVO inVO) throws SQLException;

	int doSaveMatch(MatchVO inVO) throws SQLException;
	
	int doFinishMatch(UserVO inVO) throws SQLException;
	
	Integer doFindChatValue(UserVO inVO) throws SQLException;
	
	String doMatch(UserVO inVO) throws SQLException;
}
