package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.action.CheckJoinAction;
import member.action.DeleteAction;
import member.action.UpdateAction;
import member.controller.action.CheckAction;
import member.controller.action.LoginAction;
import member.controller.action.LogoutAction;
import util.Action;
import util.ActionForward;

public class MemberController extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Action action = null;
		ActionForward actionForward = null;
		
		String requestURL = request.getRequestURL().toString();
		
		int lastIndex = requestURL.lastIndexOf("/");
		int lastIndex2 = requestURL.lastIndexOf(".me");
		
		String path = requestURL.substring(lastIndex + 1,lastIndex2);
		
		switch(path) {
		case "mypage":
			actionForward = new ActionForward("/member/myPage.jsp", false);
			break;
		case "join":
			actionForward = new ActionForward("/MyHome/member/join.jsp", true);
			break;
		case "checkJoin":
			action = new CheckJoinAction();
			actionForward = new ActionForward("/member/result.jsp", false);
			break;
		case "updateForm":
			actionForward = new ActionForward("/MyHome/member/updateForm.jsp", true);
			break;
		case "deleteForm":
			actionForward = new ActionForward("/MyHome/member/deleteForm.jsp", true);
			break;
		case "checkUpdate":
			action = new UpdateAction();
			actionForward = new ActionForward("/member/result.jsp", false);
			break;
		case "checkDelete":
			action = new DeleteAction();
			actionForward = new ActionForward("/member/result.jsp", false);
			break;
		}
		
		if(action != null) {
			action.execute(request, response);
		}
		
		if(actionForward.isRedirect()) {
			response.sendRedirect(actionForward.getNextPath());
		}else {
			request.getRequestDispatcher(actionForward.getNextPath()).forward(request, response);
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		this.doGet(request, response);
		
	}
}
