package member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.memberdao.MemberDAO;
import member.memberdto.MemberDTO;
import util.Action;

public class UpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		dto.setEmail(request.getParameter("email"));
		dto.setTel1(request.getParameter("tel1"));
		dto.setTel2(request.getParameter("tel2"));
		dto.setTel3(request.getParameter("tel3"));
		
		boolean check = MemberDAO.getInstance().updateMember(dto);
		
		String msg = null;
		String url = null;
		
		if(check){
			session.setAttribute("login", dto);
			msg = "수정완료!!MyPage로...";
			url = "/MyHome/member/myPage.me";
		}else{
			msg = "수정실패!!이전페이지로...";
			url = "/MyHome/member/updateForm.me";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
	}

}
