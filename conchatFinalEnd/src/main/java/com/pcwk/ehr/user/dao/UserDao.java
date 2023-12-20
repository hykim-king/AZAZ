package com.pcwk.ehr.user.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;

import com.pcwk.ehr.cmn.WorkDiv;
import com.pcwk.ehr.user.domain.MatchVO;
import com.pcwk.ehr.user.domain.UserVO;

public interface UserDao extends WorkDiv<UserVO> {

	int doCheckPassword(UserVO inVO) throws SQLException;

	int doCheckEmail(UserVO inVO) throws SQLException;

	int doCheckId(UserVO inVO) throws SQLException;

	int doUpdate(UserVO inVO) throws SQLException;

	int doSave(UserVO inVO) throws SQLException;

	UserVO doSelectOne(UserVO inVO) throws SQLException, EmptyResultDataAccessException;

	int doDelete(UserVO inVO) throws SQLException;

}