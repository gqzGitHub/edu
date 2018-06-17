<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!-- 添加标签库 -->
<%@include file="tags.jsp"%>	
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>工资详细-X-admin2.0</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">
<!--  <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script> -->
    <script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="./lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript" src="./js/xadmin.js"></script>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<div class="x-body">
		<form class="layui-form">
			<input type="hidden" value="${staff.staffid}" id="staffid">
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>工号:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="staffid" name="staffid" required="" disabled="disabled"
						lay-verify="required" autocomplete="off" class="layui-input" value="${teacherwage.teacherid }">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>姓名:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="teachername" name="teachername" required=""
						lay-verify="required" autocomplete="off" class="layui-input"
						value="${teacherwage.teachername }">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>性别:
				</label>
				<div class="layui-input-inline">
					<select id="sex" name="sex" class="valid">
						<option <c:if test="${teacherwage.sex=='男'}">selected="selected"</c:if> >男</option>
						<option <c:if test="${teacherwage.sex=='女'}">selected="selected"</c:if>>女</option>
					</select>
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>年龄:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="age" name="age" required=""
						lay-verify="required" autocomplete="off" class="layui-input"  value="${teacherwage.age }">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>课程:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="tsubjectname" name="tsubjectname" required=""
						lay-verify="required" autocomplete="off" class="layui-input" value="${teacherwage.tsubjectname }">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>身份证:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="idcard" name="idcard" required=""
						lay-verify="required" autocomplete="off" class="layui-input" value="${teacherwage.idcard }">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>手机:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="phone" name="phone" required=""
						lay-verify="required" autocomplete="off" class="layui-input" value="${teacherwage.phone }">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>授课年级:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="tgrade" name="tgrade" required=""
						lay-verify="required" autocomplete="off" class="layui-input"  value="${teacherwage.tgrade }">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>授课小时:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="period" name="period" required=""
						lay-verify="required" autocomplete="off" class="layui-input"  value="${teacherwage.period }">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>小时工资:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="wage" name="wage" required=""
						lay-verify="required" autocomplete="off" class="layui-input"  value="${teacherwage.wage }">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>罚款:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="fine" name="fine" required=""
						lay-verify="required" autocomplete="off" class="layui-input"  value="${teacherwage.fine }">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>合计工资:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="fine" name="fine" required=""
						lay-verify="required" autocomplete="off" class="layui-input"  value="${teacherwage.totalwage }">
				</div>
			</div>
						
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>工资结算时间:
				</label>
				<div class="layui-input-inline">
					<input class="layui-input" name="month" id="month" value="${teacherwage.month}">
				</div>
			</div>
		</form>
	</div>
	<script>
		layui.use('laydate', function() {
			var laydate = layui.laydate;

			//执行一个laydate实例
			laydate.render({
				elem : '#month' //指定元素
			});
		});
	</script>
</body>

</html>