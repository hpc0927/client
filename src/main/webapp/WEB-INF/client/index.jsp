<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery-1.9.1.js"></script>
<script
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="${APP_PATH}/static/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
<link
	href="${APP_PATH}/static/bootstrapvalidator/css/bootstrapValidator.min.css"
	rel="stylesheet">
</head>

<script type="text/javascript">
	//添加客户表单校验
	$(function() {
		$(".clientForm")
				.bootstrapValidator(
						{
							feedbackIcons : {
								valid : 'glyphicon glyphicon-ok',
								invalid : 'glyphicon glyphicon-remove',
								validating : 'glyphicon glyphicon-refresh',
							},
							fields : {
								clientName : {
									validators : {
										notEmpty : {
											message : '客户名不能为空'
										},
									}
								},
								clientPhone : {
									validators : {
										notEmpty : {
											message : '客户手机不能为空'
										},
										regexp : {
											regexp : /^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/,
											message : '请正确输入手机号'
										}
									}
								},
								address : {
									validators : {
										notEmpty : {
											message : '客户地址不能为空'
										}
									}
								},
								linkmanPhone : {
									validators : {
										regexp : {
											regexp : /^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/,
											message : '请正确输入手机号'
										}
									}
								}
							}

						});
/* 点击编辑查询员工信息 */
		$("button[clientId]").click(
				function() {
					var clientId = $(this).attr("clientId");
					$.ajax({
						url : "${APP_PATH}/client/updateUiAndfindById/"
								+ clientId,
						type : "GET",
						success : function(data) {
							$("#clientNameInput")
									.val(data.clientMap.clientName);
							$("#clientPhoneInput").val(
									data.clientMap.clientPhone);
							$("#addressInput").val(data.clientMap.address);
							$("#linkmanInput").val(data.clientMap.linkman);
							$("#linkmanPhoneInput").val(
									data.clientMap.linkmanPhone);
							$("#linkmanAddressInput").val(
									data.clientMap.linkmanAddres==s);
							$("#descriptionInput").val(
									data.clientMap.description);
							$("#clientIdInput").val(data.clientMap.clientId);
						}
					});

				})
/* 删除用户 */
	$("button[name]").click(function() {
			var cid = $(this).attr("name")
			$("#yes").attr("href","${APP_PATH}/client/deleteClient/"+cid)
		})
	});
</script>
<body>

	<div class="modal fade deleteClient" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<h4 class="modal-title"></h4>
				<button class="close" data-dismiss="modal">&times;</button>
				<div class="modal-body">
					<span>你确定要删除吗？</span>
				</div>
				<div class="modal-footer" style="align-content: center;">
					<a id="yes" href="#"><button type="submit" class="btn btn-default" id="deleteClient">确定</button></a>
					<button class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 修改客户的模态框 -->
	<div class="modal fade updateModel" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">客户修改</h4>
					<button class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<form class="clientForm" action="${APP_PATH}/client/updateClient" method="post">
						<input type="hidden" id="clientIdInput" name="clientId" />
						<input type="hidden" name="_method" value="PUT"/>
						<div class="form-group">
							<label for="exampleInputEmail1">客户名</label> <input type="text"
								class="form-control" id="clientNameInput"
								placeholder="clientName" name="clientName" readonly="readonly">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">客户手机号</label> <input
								type="text" class="form-control" id="clientPhoneInput"
								placeholder="clientPhone" name="clientPhone">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">客户地址</label> <input
								type="text" class="form-control" id="addressInput"
								placeholder="address" name="address">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">联系人</label> <input type="text"
								class="form-control" id="linkmanInput" placeholder="linkman"
								name="linkman">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">联系人电话</label> <input
								type="text" class="form-control" id="linkmanPhoneInput"
								placeholder="linkmanPhone" name="linkmanPhone">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">联系人地址</label> <input
								type="text" class="form-control" id="linkmanAddressInput"
								placeholder="linkmanAddress" name="linkmanAddress">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">描述</label> <input type="text"
								class="form-control" id="descriptionInput"
								placeholder="description" name="description">
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-default">修改</button>
							<button class="btn btn-default" data-dismiss="modal">关闭</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>












	<!-- 添加客户的模态框 -->
	<div class="modal fade addmodel" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">客户添加</h4>
					<button class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<form class="clientForm" action="${APP_PATH}/client/saveClient"
						method="post">
						<input type="hidden" name="clientId" />
						<div class="form-group">
							<label for="exampleInputEmail1">客户名</label> <input type="text"
								class="form-control" id="exampleInputEmail1"
								placeholder="clientName" name="clientName">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">客户手机号</label> <input
								type="text" class="form-control" id="exampleInputPassword1"
								placeholder="clientPhone" name="clientPhone">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">客户地址</label> <input
								type="text" class="form-control" id="exampleInputPassword1"
								placeholder="address" name="address">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">联系人</label> <input type="text"
								class="form-control" id="exampleInputPassword1"
								placeholder="linkman" name="linkman">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">联系人电话</label> <input
								type="text" class="form-control" id="exampleInputPassword1"
								placeholder="linkmanPhone" name="linkmanPhone">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">联系人地址</label> <input
								type="text" class="form-control" id="exampleInputPassword1"
								placeholder="linkmanAddress" name="linkmanAddress">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">描述</label> <input type="text"
								class="form-control" id="exampleInputPassword1"
								placeholder="description" name="description">
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-default">Submit</button>
							<button class="btn btn-default" data-dismiss="modal">关闭</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>












	<div style="align-content: center;">
		<form class="navbar-form navbar-left" role="search"
			action="${APP_PATH }/client/finAllClient" method="get">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="请输入客户名字"
					name="clientName" value="">
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="请输入客户手机"
					name="clientPhone">
			</div>
			<input type="submit" class="btn btn-default" value="搜索" />
		</form>
	</div>

	<div class="row">
		<div class="col-md-10">
			<table class="table table-hover" id="all">
				<tr>
					<th>客户名</th>
					<th>客户手机号</th>
					<th>客户地址</th>
					<th>联系人名</th>
					<th>联系人电话</th>
					<th>联系人地址</th>
					<th>是否可用</th>
					<th>描述</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${pageInfo.list}" var="client">
					<tr>
						<th>${client.clientName}</th>
						<th>${client.clientPhone }</th>
						<th>${client.address }</th>
						<th>${client.linkman }</th>
						<th>${client.linkmanPhone }</th>
						<th>${client.linkmanAddress }</th>
						<c:if test="${client.userable ==0 }">
							<th>不可用</th>
						</c:if>
						<c:if test="${client.userable ==1 }">
							<th>可用</th>
						</c:if>
						<th>${client.description }</th>
						<th>


							<button id="updateClient" class="btn btn-primary btn-sm"
								data-toggle="modal" data-target=".updateModel"
								clientId="${client.clientId }">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true">编辑</span>
							</button>

							<button class="btn btn-primary btn-sm" id="addBtn"
								data-toggle="modal" data-target=".addmodel">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true">新增</span>
							</button>
							<button class="btn btn-danger btn-sm" id="deleteClientBtn"  name="${client.clientId }">
								<span class="glyphicon glyphicon-trash" aria-hidden="true"
									data-toggle="modal" data-target=".deleteClient">删除</span>
							</button>
						</th>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${empty pageInfo.list}">
				<span>抱歉！没有查询到你想要的</span>
			</c:if>
			<div class="col-lg-6">
				<span>当前${pageInfo.pageNum }页,总共${pageInfo.pages }页,总共${pageInfo.total}条</span>
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<li><a href="${APP_PATH}/client/finAllClient?pn=1">首页</a></li>
						<c:if test="${pageInfo.hasPreviousPage }">
							<li><a
								href="${APP_PATH}/client/finAllClient?pn=${pageInfo.pageNum-1}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;上一页</span>
							</a></li>
						</c:if>
						<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
							<c:if test="${pageInfo.pageNum == page_Num }">
								<li class="active"><a
									href="${APP_PATH}/client/finAllClient?pn=${page_Num}">${page_Num}</a></li>
							</c:if>
							<c:if test="${pageInfo.pageNum != page_Num }">
								<li><a
									href="${APP_PATH}/client/finAllClient?pn=${page_Num}">${page_Num}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${pageInfo.hasNextPage }">
							<li><a
								href="${APP_PATH}/client/finAllClient?pn=${pageInfo.pageNum+1}"
								aria-label="Next"> <span aria-hidden="true">&raquo;下一页</span>
							</a></li>
						</c:if>
						<li><a
							href="${APP_PATH}/client/finAllClient?pn=${pageInfo.pages}">末页</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>