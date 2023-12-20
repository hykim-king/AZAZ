package com.pcwk.ehr.match.service;

import java.sql.SQLException;

import com.pcwk.ehr.user.domain.MatchVO;
import com.pcwk.ehr.user.domain.UserVO;

public interface MatchService {
	
	public String doFindValNickname(UserVO inVO) throws SQLException;
	
	public String doFindLolcheNickname(UserVO inVO) throws SQLException;
	
	public String doFindLolNickname(UserVO inVO) throws SQLException;
	
	public int doSaveMatch(MatchVO inVO)  throws SQLException;
	
	public int doFinishMatch(UserVO inVO) throws SQLException;
	
	public Integer doFindChatValue(UserVO inVO) throws SQLException;
	
	public String doMatch(UserVO inVO) throws SQLException;

}
