package com.pcwk.ehr.match.dao;

import java.sql.SQLException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.user.dao.UserDaoImpl;
import com.pcwk.ehr.user.domain.MatchVO;
import com.pcwk.ehr.user.domain.UserVO;

@Repository
public class MatchDaoImpl implements MatchDao{
	
	final Logger LOG = LogManager.getLogger(getClass());

	final String NAMESPACE = "com.pcwk.ehr.match";
	final String DOT = ".";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public MatchDaoImpl() {}
	
	@Override
	public int doSaveMatch(MatchVO inVO) throws SQLException {
		int flag = 0;
		String statement = this.NAMESPACE + this.DOT + "doSaveMatch";

		LOG.debug("1. statement  \n" + statement);
		LOG.debug("2. param \n" + inVO.toString());

		flag = this.sqlSessionTemplate.insert(statement, inVO);

		LOG.debug("3. flag: " + flag);

		return flag;
	}
	
	@Override
	public int doFinishMatch(UserVO inVO) throws SQLException {
		int flag = 0;
		String statement = this.NAMESPACE + this.DOT + "doFinishMatch";

		LOG.debug("1. statement  \n" + statement);
		LOG.debug("2. param \n" + inVO.toString());

		flag = this.sqlSessionTemplate.insert(statement, inVO);

		LOG.debug("3. flag: " + flag);

		return flag;
	}
	
	@Override
	public Integer doFindChatValue(UserVO inVO) throws SQLException {
		Integer chat = 0;
		String statement = this.NAMESPACE + this.DOT + "doFindChatValue";

		LOG.debug("1. statement  \n" + statement);
		LOG.debug("2. param \n" + inVO.toString());

		chat = this.sqlSessionTemplate.selectOne(statement, inVO);

		LOG.debug("3. chatValue: " + chat);

		return chat;
	}
	
	private static final int MAX_SEARCH_USER_TIME = 30000;
	@Override
	public String doMatch(UserVO inVO) throws SQLException {
		String flag = "";
		long startTime = System.currentTimeMillis();
		long maxTime = startTime + MAX_SEARCH_USER_TIME;
		String statement = this.NAMESPACE + this.DOT + "doMatch";
		LOG.debug("1. statement  \n" + statement);
		LOG.debug("2. param \n" + inVO.toString());
		
		while(System.currentTimeMillis() < maxTime) {
			flag = this.sqlSessionTemplate.selectOne(statement, inVO);
			if(flag != null) {
				break;
			}
			else {
				System.out.println("매칭된 유저가 없습니다. 다시 검색합니다.");
			}
			
			try {
				Thread.sleep(1500);
			} catch(InterruptedException e) {}
		}

		LOG.debug("3. flag \n" + flag);

		return flag;
	}

	@Override
	public String doFindLolNickname(UserVO inVO) throws SQLException {
		String flag = "";
		String statement = this.NAMESPACE + this.DOT + "doFindLolNickname";
		
		LOG.debug("1. statement  \n" + statement);
		LOG.debug("2. param \n" + inVO.toString());
		
		flag = this.sqlSessionTemplate.selectOne(statement, inVO);

		LOG.debug("3. flag \n" + flag);

		return flag;
	}

	@Override
	public String doFindValNickname(UserVO inVO) throws SQLException {
		String flag = "";
		String statement = this.NAMESPACE + this.DOT + "doFindValNickname";
		
		LOG.debug("1. statement  \n" + statement);
		LOG.debug("2. param \n" + inVO.toString());
		
		flag = this.sqlSessionTemplate.selectOne(statement, inVO);

		LOG.debug("3. flag \n" + flag);

		return flag;
	}

	@Override
	public String doFindLolcheNickname(UserVO inVO) throws SQLException {
		String flag = "";
		String statement = this.NAMESPACE + this.DOT + "doFindLolcheNickname";
		
		LOG.debug("1. statement  \n" + statement);
		LOG.debug("2. param \n" + inVO.toString());
		
		flag = this.sqlSessionTemplate.selectOne(statement, inVO);

		LOG.debug("3. flag \n" + flag);

		return flag;
	}
}
