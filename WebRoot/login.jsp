<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>课外培训事务后台系统管理</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">
<!--  <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script> -->
<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
<script src="./lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="./js/xadmin.js"></script>
<script type="text/javascript" src="./js/jquery-2.1.4.min.js"></script>
</head>
<body class="login-bg">

	<div class="login">
		<div class="message">课外培训事务平台</div>
		<div id="darkbannerwrap"></div>
        <center style="color:red; font-size: 14px;" id="error"></center>
		<form method="post" class="layui-form">
			<input name="username" placeholder="用户名" type="text"
				lay-verify="required" class="layui-input" id="username">
			<hr class="hr15">
			<input name="password" lay-verify="required" placeholder="密码"
				type="password" class="layui-input" id="password">
			<hr class="hr15">
    <div class="">
      <label class="layui-form-label" style="font-size:13px;">管理员类型:</label>
      <input type="radio" id="type1" name="type" value="系统管理员" title="系统管理员" checked="checked">
      <input type="radio" id="type2" name="type" value="教师" title="教师">
    </div>
			<input value="登录" lay-submit lay-filter="login" style="width:100%;"
				type="submit">
			<hr class="hr20">
		</form>
	</div>

	<script>
		$(function() {
			layui.use('form', function() {
				var form = layui.form;
				// layer.msg('玩命卖萌中', function(){
				//   //关闭后的操作
				//   });
				//监听提交
				form.on('submit(login)', function(data) {
					$.ajax({
						url : 'AdminServlet.action?op=login',
						method : 'post',
						data : {
							"username" : $("#username").val(),
							"password" : $("#password").val(),
							"type":$("input:radio:checked").val()
						},
						success : function(data) {
							if (data == -1) {
								$("#error").html("你的用户名和密码不匹配,请检查用户名和密码");
								$("#password").on('click', function() {
									 $("#error").html("");
								})
								$("#username").on('click', function() {
									 $("#error").html("");
								})
							}
							if (data == 1) {
								window.location.href = "index.jsp";
							}
							if(data==2){
								window.location.href = "teacindex.jsp";
							}
						}
					});
					return false;
				});
			});
		})
	</script>


	<!-- 底部结束 -->

</body>
</html>