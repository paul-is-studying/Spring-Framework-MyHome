package board.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Action;

public class DownloadAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String filename = request.getParameter("filename");
		String folder = request.getServletContext().getRealPath("/storage");
		
		File file = new File(folder,filename);
		
		filename = "attachment;filename=" + new String(URLEncoder.encode(filename, "UTF-8")).replace("//+", " ");
		response.setHeader("Content-Disposition", filename);
		response.setHeader("Content-Length", file.length()+"");
		
		
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		
		byte[] b = new byte[(int)file.length()];
		bis.read(b, 0, b.length);
		bos.write(b);
		
		bis.close();
		bos.close();
		
		request.setAttribute("seq", request.getParameter("seq"));

	}

}
