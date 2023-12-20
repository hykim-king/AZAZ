package com.pcwk.ehr;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.google.gson.Gson;
import com.pcwk.ehr.cmn.MessageVO;
import com.pcwk.ehr.user.domain.MatchVO;
import com.pcwk.ehr.user.domain.UserVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class) // 스프링 테스트 컨텍스트 프레임워크의 JUnit 확장기능 지정
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class UserControllerTest {

	final Logger LOG = LogManager.getLogger(getClass());

	@Autowired
	WebApplicationContext webApplicationContext;

	// 브라우저 대역
	MockMvc mockMvc;

	List<UserVO> users;

	UserVO searchVO;

	@Before
	public void setUp() throws Exception {
		LOG.debug("======================================");
		LOG.debug("setUp()");

		mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
	}

	public void doUpdate(UserVO inVO) throws Exception {
		LOG.debug("======================================");
		LOG.debug("doUpdate()");

		MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.post("/user/doUpdate.do")
				.param("tier", inVO.getTier() + "").param("click", inVO.getClick() + "").param("id", inVO.getId() + "");

		ResultActions resultActions = this.mockMvc.perform(requestBuilder).andExpect(status().isOk());

		String result = resultActions.andDo(print()).andReturn().getResponse().getContentAsString();

		LOG.debug("##########################");
		LOG.debug(result);

		MessageVO messageVO = new Gson().fromJson(result, MessageVO.class);
		assertEquals(String.valueOf(1), messageVO.getMsgId());
		LOG.debug("messageVO: " + messageVO);
	}

	public UserVO doSelectOne(UserVO inVO) throws Exception {
		LOG.debug("======================================");
		LOG.debug("doSelectOne()");

		MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.get("/user/doSelectOne.do").param("id",
				inVO.getId());

		ResultActions resultActions = this.mockMvc.perform(requestBuilder).andExpect(status().isOk());

		String result = resultActions.andDo(print()).andReturn().getResponse().getContentAsString();
		LOG.debug("##########################");
		LOG.debug(result);

		UserVO outVO = new Gson().fromJson(result, UserVO.class);
		LOG.debug("##########################");
		LOG.debug("outVO: " + outVO);
		assertNotNull(outVO);

		return outVO;
	}

	public void doDelete(UserVO inVO) throws Exception {
		LOG.debug("======================================");
		LOG.debug("doDelete()");

		// URL + 호출방식(get) + param(userId)
		MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.get("/user/doDelete.do").param("id",
				inVO.getId());

		ResultActions resultActions = this.mockMvc.perform(requestBuilder).andExpect(status().isOk());

		String result = resultActions.andDo(print()).andReturn().getResponse().getContentAsString();
		LOG.debug("##########################");
		LOG.debug(result);

		MessageVO messageVO = new Gson().fromJson(result, MessageVO.class);
		LOG.debug("messageVO: " + messageVO);
	}

	public int doCheckPassword(UserVO inVO) throws Exception {
		int result = 3;

		MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.get("/user/doCheckPassword.do")
				.param("pw", inVO.getPw());

		ResultActions resultActions = this.mockMvc.perform(requestBuilder).andExpect(status().isOk());

		try {
			result = Integer.parseInt(resultActions.andDo(print()).andReturn().getResponse().getContentAsString());
		} catch (NumberFormatException e) {
		}

		return result;
	}

	public int doCheckEmail(UserVO inVO) throws Exception {
		int result = 3;

		MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.get("/user/doCheckEmail.do")
				.param("email", inVO.getEmail());

		ResultActions resultActions = this.mockMvc.perform(requestBuilder).andExpect(status().isOk());

		try {
			result = Integer.parseInt(resultActions.andDo(print()).andReturn().getResponse().getContentAsString());
		} catch (NumberFormatException e) {
		}

		return result;
	}

	public int doCheckId(UserVO inVO) throws Exception {
		int result = 3;

		MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.get("/user/doCheckId.do").param("id",
				inVO.getId());

		ResultActions resultActions = this.mockMvc.perform(requestBuilder).andExpect(status().isOk());

		try {
			result = Integer.parseInt(resultActions.andDo(print()).andReturn().getResponse().getContentAsString());
		} catch (NumberFormatException e) {
		}

		return result;
	}

	public void doSave(UserVO inVO) throws Exception {
		LOG.debug("======================================");
		LOG.debug("doSave()");
		String result = "";

		// MockHttpServletRequestBuilder: param 데이터 저장
		// MockMvc: 호출
		MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.post("/user/doSave.do")
				.param("nm", inVO.getNm()).param("birth", inVO.getBirth()).param("id", inVO.getId())
				.param("pw", inVO.getPw()).param("lolnick", inVO.getLolnick()).param("lolchenick", inVO.getLolchenick())
				.param("valnick", inVO.getValnick()).param("email", inVO.getEmail()).param("chat", inVO.getChat() + "")
				.param("act", inVO.getAct() + "");

		ResultActions resultActions = this.mockMvc.perform(requestBuilder).andExpect(status().isOk());

		result = resultActions.andDo(print()).andReturn().getResponse().getContentAsString();

		LOG.debug("##########################");
		LOG.debug(result);

		MessageVO messageVO = new Gson().fromJson(result, MessageVO.class);
		assertEquals(String.valueOf(1), messageVO.getMsgId());
		LOG.debug("messageVO: " + messageVO);
	}

	@Ignore
	@Test
	public void beans() {
		LOG.debug("======================================");
		LOG.debug("beans()");
		LOG.debug("webApplicationContext: " + webApplicationContext);
		LOG.debug("mockMvc: " + mockMvc);

		assertNotNull(webApplicationContext);
		assertNotNull(mockMvc);
	}

}
