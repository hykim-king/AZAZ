package com.pcwk.ehr.account.dao;

import java.sql.SQLException;

import com.pcwk.ehr.user.domain.UserVO;

public interface AccountDao {
	
	int changeVal(UserVO inVO) throws SQLException;
	
	int changeLolche(UserVO inVO) throws SQLException;
	
	int changeLol(UserVO inVO) throws SQLException;
	
	int changePw(UserVO inVO) throws SQLException;

	int withdraw(UserVO inVO) throws SQLException;
}
