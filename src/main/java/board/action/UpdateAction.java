package board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.boarddao.BoardDAO;
import board.boarddto.BoardDTO;
import util.Action;

public class UpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		BoardDTO dto = BoardDAO.getInstance().getContent(seq);
		
		dto.setContent(dto.getContent().replaceAll("<br>", "\n"));
		
		request.setAttribute("dto", dto);
	}

}
