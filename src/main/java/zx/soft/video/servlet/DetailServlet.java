package zx.soft.video.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.googlecode.objectify.impl.Session;

import info.hb.video.sample.core.dao.FrameSample;
import info.hb.video.sample.core.domain.FrameTextSample;
import info.ub.video.sample.core.common.MybatisConfig;
import zx.soft.video.Impl.DetailDao;
import zx.soft.video.model.Details;
import zx.soft.video.model.Users;

public class DetailServlet extends HttpServlet {

	private static final long serialVersionUID = -6718499963140222139L;
	FrameSample frameSample = new FrameSample(MybatisConfig.ServerEnum.video);
	int totalcount = 0;
	int pageindex = 1;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		List<Details> list = new DetailDao().getDetails();
		
		Users users = (Users)request.getSession().getAttribute("users");
		String name = users.getUname();
		List<FrameTextSample> list = frameSample.selectFrameSamplesLastUserEditCount(name, 0, 2);
		
		if(request.getParameter("pageindex") == null) {
			pageindex = 1;
		}else {
			pageindex = Integer.parseInt(request.getParameter("pageindex"));
		}
		totalcount = list.size();
		
		request.setAttribute("pageindex", pageindex);
		request.setAttribute("totalcount", totalcount);
		request.setAttribute("list", list);
		request.getRequestDispatcher("table.jsp").forward(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
