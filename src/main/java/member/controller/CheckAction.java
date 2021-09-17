package member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.memberdao.MemberDAO;
import member.memberdto.MemberDTO;
import util.Action;

public class CheckAction implements Action{
	public void execute(HttpServletRequest request,HttpServletResponse response) {
		MemberDTO dto = new MemberDTO();

		dto.setId(request.getParameter("id"));
		dto.setPassword(request.getParameter("password"));
		
		dto = MemberDAO.getInstance().checkLogin(dto);
		
		boolean check = false;
		String msg = null;
		
		if(dto != null){
			check = true;
			msg = dto.getName() + "님이 로그인 되었습니다.";
			
			HttpSession session = request.getSession();
			
			//로그인 처리...
			session.setAttribute("login", dto);
			
			String ckid = request.getParameter("ckid");
			
			if(ckid != null){
				Cookie ck = new Cookie("ckid",dto.getId());
				ck.setMaxAge(60 * 60 * 24);
				response.addCookie(ck);
			}else{
				Cookie[] cks = request.getCookies();
				
				if(cks != null){
					for(Cookie ck : cks){
						if(ck.getName().equals("ckid")){
							if(ck.getValue().equals(dto.getId())){
								ck.setMaxAge(0);
								response.addCookie(ck);
							}
							break;
						}
					}
				}
			}
			
		}else{
			msg = "아이디 혹은 비밀번호가 잘못되었습니다.";
		}
		
		
		request.setAttribute("check", check);
		request.setAttribute("msg", msg);
	}
}
