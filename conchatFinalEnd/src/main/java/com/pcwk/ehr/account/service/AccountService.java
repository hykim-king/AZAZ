package com.pcwk.ehr.account.service;

import java.sql.SQLException;

import com.pcwk.ehr.user.domain.UserVO;

public interface AccountService {
	
	public int changeVal(UserVO inVO) throws SQLException;
	
	public int changeLolche(UserVO inVO) throws SQLException;
	
	public int changeLol(UserVO inVO) throws SQLException;

	public int changePw(UserVO inVO) throws SQLException;
	
	public int withdraw(UserVO inVO) throws SQLException;
	
}
