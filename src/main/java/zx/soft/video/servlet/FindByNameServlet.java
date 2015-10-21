package zx.soft.video.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import info.hb.video.sample.core.dao.FrameSample;
import info.hb.video.sample.core.domain.FrameTextSample;
import info.ub.video.sample.core.common.MybatisConfig;

public class FindByNameServlet extends HttpServlet{
	
	FrameSample frameSample = new FrameSample(MybatisConfig.ServerEnum.video);
	int pageindex = 1;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = new String(request.getParameter("uname").toString().getBytes("ISO-8859-1"), "UTF-8"); 
		List<FrameTextSample> list = frameSample.selectFrameSamplesLastUser(uname);
		int totalcount = list.size();
		if(request.getParameter("pageindex") == null) {
			pageindex = 1;
		}else {
			pageindex = Integer.parseInt(request.getParameter("pageindex"));
		}
		
		request.setAttribute("pageindex", pageindex);
		request.setAttribute("totalcount", totalcount);
		request.setAttribute("list", list);
		request.getRequestDispatcher("table.jsp").forward(request, response);
	}

}
