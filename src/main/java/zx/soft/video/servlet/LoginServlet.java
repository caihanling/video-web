package zx.soft.video.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import zx.soft.video.Impl.UserDao;
import zx.soft.video.model.Users;


public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 119906727513793149L;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Users users = new Users();
		users.setUname(new String(request.getParameter("uname").toString().getBytes("ISO-8859-1"), "UTF-8"));
		users.setUpass(request.getParameter("upass").toString());
		
		System.out.println("name = " + new UserDao().login(users));
		
		if (new UserDao().login(users) == null ) {
			// fail
			response.sendRedirect("login.jsp");
		} else {
			// sucess
			Users getuser = new UserDao().login(users);
			HttpSession session = request.getSession(false);
			session.setAttribute("users", getuser);
			response.sendRedirect("servlet");
		}

	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
