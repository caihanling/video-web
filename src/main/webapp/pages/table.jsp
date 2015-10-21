<%@page import="zx.soft.video.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>视频关键帧样本录入</title>

<!-- Bootstrap Core CSS -->
<link
	href="<%=request.getContextPath()%>/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="<%=request.getContextPath()%>/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="<%=request.getContextPath()%>/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="<%=request.getContextPath()%>/bower_components/datatables-responsive/css/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/dist/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="<%=request.getContextPath()%>/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>


    <![endif]-->

<style type="text/css">
#side-menu li {
	border: none;
}
$("tableModal").modal().css({
                 width:'auto',
                 'margin-left':function() {
                  	return -($(this).width()/2);
                  }
             });
            
、、

</style>





</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0;background-color:rgba(176,226,255,0.2);">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="servlet">视频检索库</a>
		</div>
		<!-- /.navbar-header -->

		<ul class="nav navbar-top-links navbar-right">

			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#" onclick="demo()"> 
				<i class="fa fa-tasks fa-fw"></i>
				<i class="fa fa-caret-down"></i>
				</a>
			</li>
				
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
				<i class="fa fa-user fa-fw"></i>
				<i class="fa fa-caret-down"></i>
				</a>
				<ul class="dropdown-menu dropdown-user">
					<li><a href="#" ><i class="fa fa-user fa-fw"></i> <span id="username">${users.uname }</span></a></li>
					<li class="divider"></li>
					<li><a href="login.jsp"><i class="fa fa-sign-out fa-fw"></i>退出登录</a></li>
				</ul> <!-- /.dropdown-user --></li>

		</ul>
		<!-- /.navbar-top-links --> </nav>

		<!--去掉id="page-wrapper"，改变布局,左边无菜单栏 -->
		<div style="margin-left: 3%; margin-right: 3%">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header" style="border: none">视频关键帧</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-2 col-md-offset-10">
					<div class="input-group">
				      <input type="text" class="form-control" placeholder="查找用户已编辑的信息" id="getname">
				      <span class="input-group-btn">
				        <button class="btn btn-default" type="button" onclick="findByName(this)">Go!</button>
				      </span>
				    </div><!-- /input-group -->
				</div>
			</div>
			
			
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default" style="border: none">
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<table class="table table-striped table-bordered table-hover" >
									<thead>
										<tr>
											<th width="10%"  style="text-align:center;">图片id</th>
											<th width="15%" style="text-align:center;">图片</th>
											<th style="text-align:center;">图片描述</th>
											<th width="8%" style="text-align:center;">用户</th>
											<th width="14%" style="text-align:center;">可选操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="detail" begin="${10*(pageindex-1)}" end="${10*pageindex-1}">
										<c:if test="${detail.edit_count < 3 }">
											<tr>
												<td>${detail.id}</td>
												<td align="center"><a id="imgClick" href="#"> <img
														src="${detail.frame_url}" id="imageresource" width="70px"
														height="70px" onclick="imagePreview(this)">
												</a></td>
												<c:if test="${detail.edit_count==0 }">
													<td><span style="background-color: #5cb85c">${detail.frame_content}</span></td>
												</c:if>
												<c:if test="${detail.edit_count==1 }">
													<td><span style="background-color: #C0EFFA">${detail.frame_content}</span></td>
												</c:if>
												<c:if test="${detail.edit_count==2 }">
													<td><span style="background-color: #CEF6C4">${detail.frame_content}</span></td>
												</c:if>
												<td align="center" style="padding-top: 2%">${detail.edit_user_last}</td>
												<td align="center" style="padding-top: 2%">
												 	<c:if test="${fn:indexOf(detail.edit_users, users.uname) == -1 }">
														<a href="#" class="btn btn-info btn-xs" data-toggle="modal" data-target="#basicModal" onclick="update(this);"> 
														<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>更新</a> 
												 	</c:if>
												 	<c:if test="${fn:indexOf(detail.edit_users, users.uname) > 0}">
														<a href="#" class="btn btn-info btn-xs" data-toggle="modal" data-target="#basicModal" disabled="disabled"> 
														<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>更新</a> 
												 	</c:if>
													<c:if test="${users.state == '1'}">
														<a href="#" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteModal" onclick="deleteObj(this);"> 
														<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除</a>
													</c:if>
													<c:if test="${users.state == '0'}">
														<a href="#" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteModal"  disabled="disabled"> 
														<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除</a>
													</c:if>
												</td>
											</tr>
										</c:if>
										</c:forEach>
									</tbody>
								</table>
								<nav>
								  <ul class="pager">
								  	<c:if test="${pageindex ==1 }">
								    <li class="previous disabled"><a href="#"><span aria-hidden="true">&larr;</span> 上一页</a></li>
								  	</c:if>
								  	<c:if test="${pageindex !=1 }">
								  	<li class="previous"><a href="servlet?pageindex=${pageindex-1}"><span aria-hidden="true">&larr;</span> 上一页</a></li>
								  	</c:if>
								  	<c:if test="${(10*pageindex-1) < totalcount}">
								    <li class="next"><a href="servlet?pageindex=${pageindex+1}">下一页 <span aria-hidden="true">&rarr;</span></a></li>
								    </c:if>
								    <c:if test="${(10*pageindex-1) >= totalcount}">
								    <li class="next disabled"><a href="">下一页 <span aria-hidden="true">&rarr;</span></a></li>
								    </c:if>
								  </ul>
								</nav>

							</div>

						</div>

					</div>
					
					<!--demoShow Modal begin -->
					<div id="demoShow" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="demoShow">
						<div class="modal-dialog">
							<div class="modal-content">
								<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th width="30%">图片</th>
												<th width="70%">描述</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><img src="img/1.png" width="150px"
													height="210px"></td>
												<td><textarea class="form-control" rows="10" disabled="disabled">
												第一次描述：aaaaaaaa；第二次描述：bbbbbbbbbbbb；第三次描述：ccccccccccc</textarea></td>
											</tr>
										</tbody>
									</table>
								<div class="modal-footer">
									<a href="#" class="btn btn-primary" data-dismiss="modal" aria-hidden="true">OK</a>
								</div>
							</div>
						</div>
					</div>


					<!-- image Modal begin -->
					<div id="imagemodal" class="modal fade" id="myModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header" style="border: none">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div align="center">
										<img src="" id="imagepreview" width="550px" height="300px">
									</div>
								</div>

							</div>
						</div>
					</div>

					<!--delete Modal begin -->
					<div id="delete" class="modal fade" tabindex="-1" role="dialog"
						aria-labelledby="deleteModal">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-body">
									<h3>确定要删除嘛...?</h3>
								</div>
								<div class="modal-footer">
									<a href="#" class="btn btn-primary" name='yes'>Yes</a> <a
										href="#" class="btn" data-dismiss="modal" aria-hidden="true">No</a>
								</div>
							</div>
						</div>
					</div>
					
					<!--table modal begin -->
					<div class="modal fade" id="tableModal" tabindex="-1" role="dialog"
						aria-labelledby="basicModal" aria-hidden="true" >
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel">添加描述</h4>
								</div>
								<div class="modal-body">
									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th width="65%">图片</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><img src="" id="imageshow" width="550px" height="300px"></td>
												
											</tr>
										</tbody>
										<tr><td><input type="text" name="id" id="number" hidden></td></tr>
										<thead>
											<tr>
												<th width="35%">图片描述</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><textarea class="form-control" id="describe" name="frame_content" rows="3"></textarea></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="modal-footer">
									<a href="#" class="btn btn-primary" name='save'>确定</a> <a
										href="#" class="btn" data-dismiss="modal" aria-hidden="true">取消</a>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->

	</div>
	<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script
		src="<%=request.getContextPath()%>/bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="<%=request.getContextPath()%>/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script
		src="<%=request.getContextPath()%>/bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script
		src="<%=request.getContextPath()%>/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="<%=request.getContextPath()%>/dist/js/sb-admin-2.js"></script>



	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script type="text/javascript">
	
	var page = 1;
	
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});

		});


		//样例展示
		function demo(){
			$('#demoShow').modal('show');
		}
		
		//图片预览
		function imagePreview() {
			$('#imagepreview').attr('src', $('#imageresource').attr('src'));
			$('#imagemodal').modal('show');
		}

		//实时修改信息
		function update(obj) {
			var tds = $(obj).parent().parent().find('td');
			$('#number').val(tds.eq(0).text());
			$('#imageshow').attr('src', $('#imageresource').attr('src'));
		//	$('#describe').val(tds.eq(2).text());
			$('#tableModal').modal('show');
			

			$("a[name='save']").click(
					function() {
						var id = $(this).parents("#tableModal").find("input[name='id']").val();
						var frame_content = $(this).parents("#tableModal").find("textarea[name='frame_content']").val();
						<%Users user = (Users)session.getAttribute("users"); %>
						var uname = "<%= user.getUname()%>";
						console.log("frame_content = " +frame_content  );
						window.location = "updateServlet?id=" + id + "&frame_content=" + frame_content + "&uname=" + uname;
						$("#tableModal").modal("hide");
					});

		}

		//删除信息
		function deleteObj(obj) {
			var tds = $(obj).parent().parent().find('td');
			var did = tds.eq(0).text();
			$('#delete').modal('show');

			$("a[name='yes']").click(function() {
				console.log(did);
				window.location = "deleteDetailServlet?did=" + did;
			});
		}
		
		//根据用户名查询已经编辑过的信息
		function findByName(obj) {
			var uname = $('#getname').val();
			//var uname = $('#uname').val();
			window.location = "findBynameServlet?uname=" + uname;
		}
	</script>


</body>

</html>