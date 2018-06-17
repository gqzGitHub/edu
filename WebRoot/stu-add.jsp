<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="tags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加学生-X-admin2.0</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">
<!--  <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script> -->
    <script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="./lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript" src="./js/xadmin.js"></script>
<script type="text/javascript" src="./js/jquery-2.1.4.min.js"></script>

</head>

<body>
	<div class="x-body">
		<form class="layui-form">
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>学生姓名: </label>
				<div class="layui-input-inline">
					<input type="text" id="studentname" name="studentname" required=""
						lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>学生性别: </label>
				<div class="layui-input-inline">
					<select id="sex" name="sex" class="valid">
						<option>男</option>
						<option>女</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>出生日期: </label>
				<div class="layui-input-inline">
					<input class="layui-input" name="birthday" id="start">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="phone" class="layui-form-label"> <span
					class="x-red">*</span>电话: </label>
				<div class="layui-input-inline">
					<input type="text" id="phone" name="phone" required=""
						lay-verify="phone" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>现居住地址: </label>
				<div class="layui-input-inline">
					<input type="text" id="address" name="address" required=""
						lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>信息来源: </label>
				<div class="layui-input-inline">
					<select id="infosource" name="infosource">
						<option>电话预约</option>
						<option>网络预约</option>
						<option>门店直访</option>
						<option>市场专员</option>
						<option>家长转介绍</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>监护人: </label>
				<div class="layui-input-inline">
					<input type="text" id="guardian" name="guardian" required=""
						lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>监护人电话: </label>
				<div class="layui-input-inline">
					<input type="text" id="gdphone" name="gdphone" required=""
						lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>与学员关系: </label>
				<div class="layui-input-inline">
					<select id="relation" name="relation">
						<option>爸 爸</option>
						<option>妈妈</option>
						<option>爷爷</option>
						<option>奶奶</option>
						<option>外公</option>
						<option>外婆</option>
						<option>叔叔</option>
						<option>阿姨</option>
						<option>其他</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>年级: </label>
				<div class="layui-input-inline">
					<select id="grade" name="grade">
						<option>一年级</option>
						<option>二年级</option>
						<option>三年级</option>
						<option>四年级</option>
						<option>五年级</option>
						<option>六年级</option>
						<option>初一</option>
						<option>初二</option>
						<option>初三</option>
						<option>高一</option>
						<option>高二</option>
						<option>高三</option>
						<option>成人</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>学校: </label>
				<div class="layui-input-inline">
					<input type="text" id="school" name="school" required=""
						lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>所报学科: </label>
				<div class="layui-input-inline" id="subjects">
					<select name='subjectid' id='subjectid'>
						<c:forEach items="${list}" var="subject">
							<option value="${subject.subjectid}">${subject.subjectname}</option>
						</c:forEach>
					</select>

				</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<label for="desc" class="layui-form-label"> 备注: </label>
				<div class="layui-input-block">
					<textarea placeholder="请输入内容" id="remark" name="remark"
						class="layui-textarea"></textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> </label> <input
					type="submit" class="layui-btn" lay-filter="add" lay-submit=""
					value="添加">
			</div>
		</form>
	</div>
	<script type="text/javascript">
		$(function() {
		  layui.use('laydate', function() {
				var laydate = layui.laydate;

				//执行一个laydate实例
				laydate.render({
					elem : '#start' //指定元素
				});
			});
		});
		
          //表单提交
			layui.use('form', function() {
				var form = layui.form;
				form.on('submit(add)', function(data) {
					$.ajax({
						url : 'StudentMemberServlet.action?op=StudentMemberServlet',
						method : 'post',
						data : {
							"studentname" : $("#studentname").val(),
							"sex" : $("#sex").val(),
							"birthday" : $("#start").val(),
							"phone" : $("#phone").val(),
							"address" : $("#address").val(),
							"infosource" : $("#infosource").val(),
							"guardian" : $("#guardian").val(),
							"gdphone" : $("#gdphone").val(),
							"relation" : $("#relation").val(),
							"grade" : $("#grade").val(),
							"school" : $("#school").val(),
							"subjectid" : $("#subjectid").val(),
							"remark" : $("#remark").val()

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
								window.parent.location.reload(); //刷新父页面

								var index = parent.layer
										.getFrameIndex(window.name); //获取窗口索引
								parent.layer.close(index); // 关闭layer
							}
						}
					});
					return false;
				});
			});
	</script>

</body>

</html>