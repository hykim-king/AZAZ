package com.pcwk.ehr.user.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;

import com.pcwk.ehr.user.domain.MatchVO;
import com.pcwk.ehr.user.domain.UserVO;

public interface UserService {

	public int doCheckPassword(UserVO inVO) throws SQLException;

	public int doCheckEmail(UserVO inVO) throws SQLException;

	public int doCheckId(UserVO inVO) throws SQLException;

	public List<UserVO> doRetrieve(UserVO inVO) throws SQLException;

	public int doSave(UserVO inVO) throws SQLException;

	public UserVO doSelectOne(UserVO inVO) throws SQLException, EmptyResultDataAccessException;

	public int doDelete(final UserVO inVO) throws SQLException;

	public int doUpdate(UserVO inVO) throws SQLException;
}