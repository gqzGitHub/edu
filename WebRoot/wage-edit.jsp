<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" errorPage="404.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- 添加标签库 -->
<%@include file="tags.jsp"%>	

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>工资-教务管理系统</title>
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
</head>

<body>
	<div class="x-body">
		<form class="layui-form">
			
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>工号:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="teacherid" name="teacherid" required="" disabled="disabled"
						 autocomplete="off" class="layui-input"  value="${wage.teacherid }">
				</div>
			</div>		
			
				<div class="layui-form-item">
					<label for="username" class="layui-form-label"> <span
						class="x-red">*</span>授课学时:
					</label>
					<div class="layui-input-inline">
						<input type="text" id="period" name="period" required=""
							lay-verify="required" autocomplete="off" class="layui-input"  value="${wage.period }">
					</div>
				</div>
			
			
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>罚款:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="fine" name="fine" required=""
						lay-verify="required" autocomplete="off" class="layui-input"  value="${wage.fine }">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>总工资:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="totalwage" name="totalwage" required=""
						lay-verify="required" autocomplete="off" class="layui-input"  value="${wage.totalwage }">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>统计月份:
				</label>
				<div class="layui-input-inline">
					<input class="layui-input" name="month" id="month" value="${wage.month }" >
				</div>
			</div>
			
			
			<div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> </label>
				<input	type="submit" class="layui-btn" lay-filter="add" lay-submit=""	value="修改">
			</div>
		</form>
	</div>
	<script>
		layui.use([ 'form', 'layer' ], function() {
			$ = layui.jquery;
			var form = layui.form, layer = layui.layer;

			//自定义验证规则
			form.verify({
				tearchername : function(value) {
					if (value.length < 5) {
						return '昵称至少得5个字符啊';
					}
				},
				pass : [ /(.+){6,12}$/, '密码必须6到12位' ],
				repass : function(value) {
					if ($('#L_pass').val() != $('#L_repass').val()) {
						return '两次密码不一致';
					}
				}
			});

			//监听提交
			form.on('submit(add)', function(data) {
				/* console.log(data); */
				//发异步，把数据提交给服务器
				$.ajax({
						url : 'TeacherWageServlet.action?op=editTeacherWageById',
						method : 'post',
						data : {
							"teacherid" : $("#teacherid").val(),
							"period" : $("#period").val(),
							"fine" : $("#fine").val(),
							"totalwage" : $("#totalwage").val(),
							"month" : $("#month").val()
						},
						success : function(data) {
							if (data == -1) {
								layer.alert("修改失败！", {icon : 5	}, function() {
									var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
									parent.layer.close(index); // 关闭layer
								});
							}
							if (data == 1) {
								layer.alert("修改成功！", {icon : 6	}, function() {
									window.parent.location.reload(true); //刷新父页面
									//window.location.reload(true);
									var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
									parent.layer.close(index); // 关闭layer
								});
									
							}
						}
					});
				return false;
			});

		});
	</script>
	<script>
		layui.use('laydate', function() {
			var laydate = layui.laydate;
			//执行一个laydate实例
			laydate.render({
				elem : '#month', //指定元素
				type:'datetime'
			});
		});
	</script>
</body>

</html>