package zx.soft.video.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import info.hb.video.sample.core.dao.FrameSample;
import info.ub.video.sample.core.common.MybatisConfig;
import zx.soft.video.Impl.DetailDao;
import zx.soft.video.model.Details;

public class UpdateServlet extends HttpServlet {

	private static final long serialVersionUID = 8286758349209283727L;
	FrameSample frameSample = new FrameSample(MybatisConfig.ServerEnum.video);

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		Details detail = new Details();
//		detail.setDid(Integer.parseInt(request.getParameter("id").toString()));
//		detail.setDescribe(request.getParameter("frame_content").toString());
//		detail.setUname(request.getParameter("uname").toString());
//		new DetailDao().updateDescribe(detail);
		
		String id = request.getParameter("id").toString();
		String frame_content = new String(request.getParameter("frame_content").toString().getBytes("ISO-8859-1"), "UTF-8");
		String uname = new String(request.getParameter("uname").toString().getBytes("ISO-8859-1"), "UTF-8"); 
		
		System.err.println("id = " + id + "frame_content = " + frame_content + "uname = " + uname );
		
		frameSample.updateFrameSample(id, frame_content, uname);
		
		response.sendRedirect("servlet");

	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
