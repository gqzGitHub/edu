<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 添加标签库 -->
<%@include file="tags.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>添加员工-X-admin2.0</title>
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
					class="x-red">*</span>姓名:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="username" name="username" required=""
						lay-verify="required" autocomplete="off" class="layui-input"
						value="${staff.username }">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>性别:
				</label>
				<div class="layui-input-inline">
					<select id="sex" name="sex" class="valid">
						<option>男</option>
						<option>女</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>年龄:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="age" name="age" required=""
						lay-verify="required" autocomplete="off" class="layui-input"  value="${staff.age }">
				</div>
			</div>
<%-- 		<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>工号:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="staffid" name="staffid" required=""
						lay-verify="required" autocomplete="off" class="layui-input" value="${staff.staffid }">
			</div>
			</div> --%>
			
			
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>身份证:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="idcard" name="idcard" required=""
						lay-verify="required" autocomplete="off" class="layui-input" value="${staff.idcard }">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>手机:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="phone" name="phone" required=""
						lay-verify="phone" autocomplete="off" class="layui-input"
						value="${staff.phone }">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>所属教学点:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="collegename" name="collegename" required=""
						lay-verify="required" autocomplete="off" class="layui-input"
						value="${staff.collegename }">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>岗位类型:
				</label>
				<div class="layui-input-inline">
					<select id="posttype" name="posttype" class="valid">
						<option <c:if test="${staff.posttype==''}">selected="selected"</c:if> ></option>
						<option <c:if test="${staff.posttype=='教师助手'}">selected="selected"</c:if> >教师助手</option>
	                    <option <c:if test="${staff.posttype=='财务处'}"> selected="selected"</c:if> >财务处</option>
	                    <option <c:if test="${staff.posttype=='客服人员'}">selected="selected"</c:if> >客服人员</option>
	                    <option <c:if test="${staff.posttype=='后勤人员'}">selected="selected"</c:if> >后勤人员</option>
	                    <option <c:if test="${staff.posttype=='其他'}">selected="selected"</c:if> >其他</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>进入公司时间:
				</label>
				<div class="layui-input-inline">
					<input class="layui-input" name="jointime" id="jointime" lay-verify="required"
						value="${staff.jointime}">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="phone" class="layui-form-label"> <span
					class="x-red">*</span>排课费:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="arrangewage" name="arrangewage" required="" lay-verify="required"
						 autocomplete="off" class="layui-input"
						value="${staff.arrangewage}">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>工龄工资:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="senioritywage" name="senioritywage"
						required="" lay-verify="required" autocomplete="off"
						class="layui-input" value="${staff.senioritywage}">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>预收提成:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="prepay" name="prepay" required=""
						lay-verify="required" autocomplete="off" class="layui-input"
						value="${staff.prepay}">
				</div>
			</div>

			<!-- 			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>是否社保:
				</label>
				<div class="layui-input-inline">
					<select id="shipping" name="contrller">
						<option>否</option>
						<option>是</option>
					</select>
				</div>
			</div> -->
			<!-- 			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>课耗提成:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="username" name="username" required=""
						lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div> -->
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>户口地址:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="regaddress" name="regaddress" required=""
						lay-verify="required" autocomplete="off" class="layui-input"
						value="${staff.regaddress}">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>现居地址:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="liveaddress" name="liveaddress" required=""
						lay-verify="required" autocomplete="off" class="layui-input"
						value="${staff.liveaddress}">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>生日:
				</label>
				<div class="layui-input-inline">
					<input class="layui-input" name="birthday" id="birthday" required=""
						lay-verify="required"		value="${staff.birthday}">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="L_email" class="layui-form-label"> <span
					class="x-red">*</span>合同截止时间:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="contractendtime" name="contractendtime" required="" lay-verify="required"
						 autocomplete="off" class="layui-input"
						value="${staff.contractendtime}">
				</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<label for="desc" class="layui-form-label"> 备注: </label>
				<div class="layui-input-block">
					<textarea placeholder="请输入内容" id="remark" name="remark"
						class="layui-textarea">${staff.remark}</textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> </label>
				<input	type="submit" class="layui-btn" lay-filter="add" lay-submit=""	value="添加">
			</div>
		</form>
	</div>
	<script>
		layui.use('laydate', function() {
			var laydate = layui.laydate;

			//执行一个laydate实例
			laydate.render({
				elem : '#birthday' //指定元素
			});

			laydate.render({
				elem : '#jointime', //指定元素
				type : 'datetime'
			});
			laydate.render({
				elem : '#contractendtime', //指定元素
				type : 'datetime'
			});
			
		});
		
		
		
		
		
		layui.use([ 'form', 'layer' ], function() {
			$ = layui.jquery;
			var form = layui.form, layer = layui.layer;
			
			//自定义验证规则
			form.verify({
				nikename : function(value) {
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
				console.log(data);
				//发异步，把数据提交给服务器
				$.ajax({
						url : 'StaffServlet.action?op=addStaff',
						method : 'post',
						data : {
							"username" : $("#username").val(),
							"sex" : $("#sex").val(),
							"age" : $("#age").val(),
							"idcard" : $("#idcard").val(),
							"phone" : $("#phone").val(),
							"collegename" : $("#collegename").val(),
							"posttype" : $("#posttype").val(),
							"jointime" : $("#jointime").val(),
							"arrangewage" : $("#arrangewage").val(),
							"senioritywage" : $("#senioritywage").val(),
							"prepay" : $("#prepay").val(),
							"regaddress" : $("#regaddress").val(),
							"liveaddress" : $("#liveaddress").val(),
							"birthday" : $("#birthday").val(),
							"contractendtime" : $("#contractendtime").val(),								
							"remark" : $("#remark").val()
						},
						success : function(data) {
							if (data == -1) {
								layer.alert("添加失败", {icon : 5	}, function() {
									var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
									parent.layer.close(index); // 关闭layer
								});
							}
							if (data == 1) {
								layer.alert("添加成功！", {icon : 6	}, function() {
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
	
</body>

</html>