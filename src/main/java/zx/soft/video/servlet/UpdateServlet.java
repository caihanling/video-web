package zx.soft.video.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zx.soft.video.Impl.DetailDao;
import zx.soft.video.model.Details;

public class UpdateServlet extends HttpServlet {

	private static final long serialVersionUID = 8286758349209283727L;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Details detail = new Details();
		detail.setDid(Integer.parseInt(request.getParameter("did").toString()));
		detail.setDescribe(request.getParameter("describe").toString());
		detail.setUname(request.getParameter("uname").toString());
		new DetailDao().updateDescribe(detail);
//		new DetailServlet().doGet(request, response);
		response.sendRedirect("servlet");

	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
