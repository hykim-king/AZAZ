package com.pcwk.ehr.match.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.pcwk.ehr.cmn.MessageVO;
import com.pcwk.ehr.match.service.MatchService;
import com.pcwk.ehr.user.domain.MatchVO;
import com.pcwk.ehr.user.domain.UserVO;

@Controller
@RequestMapping("match")
public class MatchController {
	
	final Logger LOG = LogManager.getLogger(getClass());

	@Autowired
	MatchService matchService;
	
	@RequestMapping(value = "/doFindValNickname.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody // HTTP 요청 부분의 body 부분이 그대로 브라우저에 전달
	public String doFindValNickname(UserVO inVO) throws SQLException {
		
		LOG.debug("┌───────────────────┐");
		LOG.debug("┃  doFindValNickname()     │ inVO: " + inVO);
		LOG.debug("└───────────────────┘");
		
		String flag = matchService.doFindValNickname(inVO);
		String message = "";

		if (flag != null)
			message = "닉네임을 찾았습니다.";
		else
			message = "닉네임 검색 실패";
		
		return flag;
	}
	
	@RequestMapping(value = "/doFindLolcheNickname.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody // HTTP 요청 부분의 body 부분이 그대로 브라우저에 전달
	public String doFindLolcheNickname(UserVO inVO) throws SQLException {
		
		LOG.debug("┌───────────────────┐");
		LOG.debug("┃  doFindLolcheNickname()     │ inVO: " + inVO);
		LOG.debug("└───────────────────┘");
		
		String flag = matchService.doFindLolcheNickname(inVO);
		String message = "";

		if (flag != null)
			message = "닉네임을 찾았습니다.";
		else
			message = "닉네임 검색 실패";
		
		return flag;
	}
	
	@RequestMapping(value = "/doFindLolNickname.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody // HTTP 요청 부분의 body 부분이 그대로 브라우저에 전달
	public String doFindLolNickname(UserVO inVO) throws SQLException {
		
		LOG.debug("┌───────────────────┐");
		LOG.debug("┃  doFindLolNickname()     │ inVO: " + inVO);
		LOG.debug("└───────────────────┘");
		
		String flag = matchService.doFindLolNickname(inVO);
		String message = "";

		if (flag != null)
			message = "닉네임을 찾았습니다.";
		else
			message = "닉네임 검색 실패";
		
		return flag;
	}
	
	@RequestMapping(value="/doSaveMatch.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public String doSaveMatch(MatchVO inVO) throws Exception {
		
		String jsonString;

		LOG.debug("┌───────────────────┐");
		LOG.debug("┃  doSaveMatch()     │ inVO: " + inVO);
		LOG.debug("└───────────────────┘");

		int flag = matchService.doSaveMatch(inVO);
		
		String message = "";

		if (flag == 1)
			message = "매칭 진행 중";
		else
			message = "매칭 진행 실패";

		MessageVO messageVO = new MessageVO(flag + "", message);
		jsonString = new Gson().toJson(messageVO);
		LOG.debug("jsonString: " + jsonString);

		return jsonString;
	}
	
	@RequestMapping(value="/doFinishMatch.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public String doFinishMatch(UserVO inVO) throws Exception {
		
		String jsonString;

		LOG.debug("┌───────────────────┐");
		LOG.debug("┃  doFinishMatch()     │ inVO: " + inVO);
		LOG.debug("└───────────────────┘");

		int flag = matchService.doFinishMatch(inVO);
		
		String message = "";

		if (flag == 1)
			message = "매칭 시도 종료";
		else
			message = "매칭 시도 종료 실패";

		MessageVO messageVO = new MessageVO(flag + "", message);
		jsonString = new Gson().toJson(messageVO);
		LOG.debug("jsonString: " + jsonString);

		return jsonString;
	}
	
	@RequestMapping(value="/doFindChatValue.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public Integer doFindChatValue(UserVO inVO) throws SQLException {
		LOG.debug("┌───────────────────┐");
		LOG.debug("┃  doFindChatValue()     │ inVO: " + inVO);
		LOG.debug("└───────────────────┘");
		
		Integer flag = matchService.doFindChatValue(inVO);

		return flag;
	}
	
	@RequestMapping(value="/moveToVal_match.do", method = RequestMethod.GET)
	public String moveToVal_match() throws SQLException {
		String view = "match/val_match";
		LOG.debug("┌───────────────────────────────────────────┐");
		LOG.debug("│ moveToVal_match                                 │");
		LOG.debug("└───────────────────────────────────────────┘");	
		
		return view;
	}
	
	@RequestMapping(value="/moveToLolche_match.do", method = RequestMethod.GET)
	public String moveToLolche_match() throws SQLException {
		String view = "match/lolche_match";
		LOG.debug("┌───────────────────────────────────────────┐");
		LOG.debug("│ moveToLolche_match                                 │");
		LOG.debug("└───────────────────────────────────────────┘");	
		
		return view;
	}
	
	@RequestMapping(value="/moveToLol_match.do", method = RequestMethod.GET)
	//http://localhost:8080/ehr/user/moveToMain.do
	public String moveToLol_match() throws SQLException {
		String view = "match/lol_match";
		LOG.debug("┌───────────────────────────────────────────┐");
		LOG.debug("│ moveToLol_match                                 │");
		LOG.debug("└───────────────────────────────────────────┘");	
		
		return view;
	}
	
	// 매칭
	@RequestMapping(value = "/doMatch.do", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/json;charset=UTF-8")
	@ResponseBody // HTTP 요청 부분의 body 부분이 그대로 브라우저에 전달
	public String doMatch(UserVO inVO) throws SQLException {
		String jsonString;
		
		LOG.debug("┌───────────────────┐");
		LOG.debug("┃  doMatch()     │ inVO: " + inVO);
		LOG.debug("└───────────────────┘");
		
		String flag = matchService.doMatch(inVO);
		String message = "";

		if (flag != null)
			message = "매칭 되었습니다.";
		else
			message = "매칭 실패";
		
		return flag;
	}

}
