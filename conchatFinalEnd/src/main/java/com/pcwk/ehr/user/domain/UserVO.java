package com.pcwk.ehr.user.domain;

import com.pcwk.ehr.cmn.DTO;

public class UserVO extends DTO {
	// ctrl + shift + y : 소문자로 바꾸기
	// ctrl + shift + x : 대문자로 바꾸기

	private int no;
	private String nm;
	private String birth;
	private String id;
	private String pw;
	private String lolnick;
	private String lolchenick;
	private String valnick;
	private String email;
	private String reg_ymd;
	private int chat;
	private int act;
	private int tier;
	private int click;
	private double pop_scr;

	public UserVO() {
		super();
	}

	public UserVO(String nm, String birth, String id, String pw, String lolnick, String lolchenick, String valnick,
			String email, int chat, int act) {
		super();
		this.nm = nm;
		this.birth = birth;
		this.id = id;
		this.pw = pw;
		this.lolnick = lolnick;
		this.lolchenick = lolchenick;
		this.valnick = valnick;
		this.email = email;
		this.chat = chat;
		this.act = act;
	}

	public String getLolnick() {
		return lolnick;
	}

	public void setLolnick(String lolnick) {
		this.lolnick = lolnick;
	}

	public String getLolchenick() {
		return lolchenick;
	}

	public void setLolchenick(String lolchenick) {
		this.lolchenick = lolchenick;
	}

	public String getValnick() {
		return valnick;
	}

	public void setValnick(String valnick) {
		this.valnick = valnick;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getNm() {
		return nm;
	}

	public void setNm(String nm) {
		this.nm = nm;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getReg_ymd() {
		return reg_ymd;
	}

	public void setReg_ymd(String reg_ymd) {
		this.reg_ymd = reg_ymd;
	}

	public int getChat() {
		return chat;
	}

	public void setChat(int chat) {
		this.chat = chat;
	}

	public int getAct() {
		return act;
	}

	public void setAct(int act) {
		this.act = act;
	}

	public int getTier() {
		return tier;
	}

	public void setTier(int tier) {
		this.tier = tier;
	}

	public int getClick() {
		return click;
	}

	public void setClick(int click) {
		this.click = click;
	}

	public double getPop_scr() {
		return pop_scr;
	}

	public void setPop_scr(double pop_scr) {
		this.pop_scr = pop_scr;
	}

	@Override
	public String toString() {
		return "UserVO [no=" + no + ", nm=" + nm + ", birth=" + birth + ", id=" + id + ", pw=" + pw + ", lolnick="
				+ lolnick + ", lolchenick=" + lolchenick + ", valnick=" + valnick + ", email=" + email + ", reg_ymd="
				+ reg_ymd + ", chat=" + chat + ", act=" + act + ", tier=" + tier + ", click=" + click + ", pop_scr="
				+ pop_scr + "]";
	}

}