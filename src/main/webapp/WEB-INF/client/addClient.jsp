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
<title>添加客户</title>
<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery-1.8.3.js"></script>
<script
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="${APP_PATH}/static/validation/dist/jquery.validate.min.js"></script>
</head>
<body>

<script type="text/javascript">
	$(function() {
		$("#inputEmail3").blur(function() {
			var nameVal= $("#inputEmail3").val();
			alert(nameVal)
			$.ajax({
				url:"chekName",
				data:{"name":nameVal },
				dataType:"json",
				type:"POST",
				contentType:"application/x-www-form-urlencoded",
				success:function(data){
					 if(data.msg){
						 alert("该客户不存在")
					 }else{
						 alert("该客户已存在")
					 }
				}
			})
		})
	})

</script>

	<form class="form-horizontal" id="myform"
		action="${APP_PATH }/client/saveClient" method="post">
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">客户名</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" id="inputEmail3"
					placeholder="clientName" name="clientName">
					<span id="myspan"></span>
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">客户手机号</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" id="inputPassword3"
					placeholder="clientPhone" name="clientPhone">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">客户地址</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" id="inputPassword3"
					placeholder="address" name="address">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">联系人名</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" id="inputPassword3"
					placeholder="linkman" name="linkman">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">联系人电话</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" id="inputPassword3"
					placeholder="linkmanPhone" name="linkmanPhone">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">联系人地址</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" id="inputPassword3"
					placeholder="linkmanAddress" name="linkmanAddress">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">是否可用</label>
			<div class="col-sm-5">
				<select id="inputPassword3" class="form-control">
					<c:if test="${client.userable == 1 }">
						<option value="">可用</option>
					</c:if>
					<c:if test="${client.userable == 0 }">
						<option value="">不可用</option>
					</c:if>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">描述</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" id="inputPassword3"
					placeholder="description" name="description">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<input class="btn btn-default" type="submit" value="提交">
				<button class="btn btn-default">
					<a href="${APP_PATH}/client/finAllClient"
						style="text-decoration: none; color: #000000">回到首页 
				</button>
				</a>
			</div>
		</div>
	</form>
</body>
</html>