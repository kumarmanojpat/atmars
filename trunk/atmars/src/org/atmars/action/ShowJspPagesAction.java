package org.atmars.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

public class ShowJspPagesAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private int hisId;

	public String ShowHomePage()
	{
		InitAction();
		
		ActionContext ctx = ActionContext.getContext();
		Map<String, Object> session = ctx.getSession();
		session.put("user",
				u_service.getUserInfo(current_usr_from_session.getUserId()));
		return "success";
	}
	public String ShowUserPage()
	{
		InitAction();
		
		ActionContext ctx = ActionContext.getContext();
		Map<String, Object> session = ctx.getSession();
		session.put("user",
				u_service.getUserInfo(current_usr_from_session.getUserId()));
		return "success";
	}
	public int getHisId() {
		return hisId;
	}
	public void setHisId(int hisId) {
		this.hisId = hisId;
	}
	
}