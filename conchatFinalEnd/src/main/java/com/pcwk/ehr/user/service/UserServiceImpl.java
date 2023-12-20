package com.pcwk.ehr.user.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.user.dao.UserDao;
import com.pcwk.ehr.user.domain.UserVO;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {

	final Logger LOG = LogManager.getLogger(UserServiceImpl.class);

	@Autowired
	private UserDao userDao;

	public UserServiceImpl() {
	}

	@Override
	public int doCheckEmail(UserVO inVO) throws SQLException {
		return userDao.doCheckEmail(inVO);
	}

	@Override
	public int doCheckId(UserVO inVO) throws SQLException {
		return userDao.doCheckId(inVO);
	}

	@Override
	public int doUpdate(UserVO inVO) throws SQLException {
		return userDao.doUpdate(inVO);
	}

	@Override
	public int doDelete(UserVO inVO) throws SQLException {
		return userDao.doDelete(inVO);
	}

	@Override
	public UserVO doSelectOne(UserVO inVO) throws SQLException, EmptyResultDataAccessException {
		return userDao.doSelectOne(inVO);
	}

	@Override
	public List<UserVO> doRetrieve(UserVO inVO) throws SQLException {
		return userDao.doRetrieve(inVO);
	}

	@Override
	public int doSave(UserVO inVO) throws SQLException {
		return userDao.doSave(inVO);
	}

	@Override
	public int doCheckPassword(UserVO inVO) throws SQLException {
		return userDao.doCheckPassword(inVO);
	}

}
