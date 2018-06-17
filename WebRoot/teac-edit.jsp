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
	<title>编辑-教务管理系统</title>
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
					<input type="text" id="teacherid" name="teacherid" required=""
						lay-verify="required" autocomplete="off" class="layui-input"  value="${teacher.teacherid }">
				</div>
			</div>			
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>姓名:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="teachername" name="teachername" required=""
						lay-verify="required" autocomplete="off" class="layui-input"  value="${teacher.teachername }">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>性别:
				</label>
				<div class="layui-input-inline">
					<select id="sex" name="sex" class="valid">
						<option <c:if test="${teacher.sex=='男'}">selected="selected"</c:if> >男</option>
						<option <c:if test="${teacher.sex=='女'}">selected="selected"</c:if>>女</option>
					</select>
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>年龄:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="age" name="age" required=""
						lay-verify="required" autocomplete="off" class="layui-input"  value="${teacher.age }">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>身份证:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="idcard" name="idcard" required=""
						lay-verify="required" autocomplete="off" class="layui-input" value="${teacher.idcard }">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="tsubjectname" class="layui-form-label"> <span
					class="x-red">*</span>课程:
				</label>
				<div class="layui-input-inline">	
					<select name="tsubjectname" id="tsubjectname">
						<option>课程</option>
						<option <c:if test="${teacher.tsubjectname=='语文'}">selected="selected"</c:if> >语文</option>
						<option <c:if test="${teacher.tsubjectname=='数学'}">selected="selected"</c:if> >数学</option>
						<option <c:if test="${teacher.tsubjectname=='英语'}">selected="selected"</c:if> >英语</option>
						<option <c:if test="${teacher.tsubjectname=='物理'}">selected="selected"</c:if> >物理</option>
						<option <c:if test="${teacher.tsubjectname=='化学'}">selected="selected"</c:if> >化学</option>
						<option <c:if test="${teacher.tsubjectname=='生物'}">selected="selected"</c:if> >生物</option>
						<option <c:if test="${teacher.tsubjectname=='政治'}">selected="selected"</c:if> >政治</option>
						<option <c:if test="${teacher.tsubjectname=='历史'}">selected="selected"</c:if> >历史</option>
						<option <c:if test="${teacher.tsubjectname=='地理'}">selected="selected"</c:if> >地理</option>
						<option <c:if test="${teacher.tsubjectname=='奥数'}">selected="selected"</c:if> >奥数</option>
						<option <c:if test="${teacher.tsubjectname=='美术'}">selected="selected"</c:if> >美术</option>
						<option <c:if test="${teacher.tsubjectname=='音乐'}">selected="selected"</c:if> >音乐</option>
						<option <c:if test="${teacher.tsubjectname=='心理学'}">selected="selected"</c:if> >心理学</option>
						<option <c:if test="${teacher.tsubjectname=='体育'}">selected="selected"</c:if> >体育</option>
						<option <c:if test="${teacher.tsubjectname=='出国游'}">selected="selected"</c:if> >出国游</option>
						<option <c:if test="${teacher.tsubjectname=='社会'}">selected="selected"</c:if> >社会</option>
						<option <c:if test="${teacher.tsubjectname=='剑桥英语'}">selected="selected"</c:if> >剑桥英语</option>
						<option <c:if test="${teacher.tsubjectname=='英语听说课'}">selected="selected"</c:if> >英语听说课</option>
						<option <c:if test="${teacher.tsubjectname=='奥英'}">selected="selected"</c:if> >奥英</option>
						<option <c:if test="${teacher.tsubjectname=='其他'}">selected="selected"</c:if> >其他</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>授课年级:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="tgrade" name="tgrade" required=""
						lay-verify="required" autocomplete="off" class="layui-input"  value="${teacher.tgrade }">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>类别:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="rank" name="rank" required=""
						lay-verify="required" autocomplete="off" class="layui-input" value="${teacher.rank }">
				</div>
			</div>
			
			
			
			<div class="layui-form-item">
				<label for="status" class="layui-form-label"> <span
					class="x-red">*</span>授课状态:
				</label>
				<div class="layui-input-inline">
					<select name="status" id="status">
						<option <c:if test="${teacher.status=='正常'}">selected="selected"</c:if> >正常</option>
						<option <c:if test="${teacher.status=='休假'}">selected="selected"</c:if> >休假</option>
						<option <c:if test="${teacher.status=='其他'}">selected="selected"</c:if> >其他</option>
					</select>
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>现居地址:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="address" name="address" required=""
						lay-verify="required" autocomplete="off" class="layui-input"
						value="${teacher.address}">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>进入公司时间:
				</label>
				<div class="layui-input-inline">
					<input class="layui-input" name="jointime" id="jointime" value="${teacher.jointime}" >
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>联系电话:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="phone" name="phone" required=""
						lay-verify="phone" autocomplete="off" class="layui-input" value="${teacher.phone}">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>紧急联系人:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="egcontact" name="egcontact" required=""
						lay-verify="required" autocomplete="off" class="layui-input" value="${teacher.egcontact}">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>紧急联系人电话:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="egphone" name="egphone" required=""
						lay-verify="phone" autocomplete="off" class="layui-input" value="${teacher.egphone}">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="phone" class="layui-form-label"> <span
					class="x-red">*</span>小时工资:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="wage" name="wage" required=""
						lay-verify="" autocomplete="off" class="layui-input" value="${teacher.wage}">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>总课时数:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="thour" name="thour" required="" disable="disable"
						lay-verify="required" autocomplete="off" class="layui-input" value="${teacher.thour}">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>工资卡账号:
				</label>
				<div class="layui-input-inline">
					<input type="text" id="salaryacount" name="salaryacount" required=""
						lay-verify="required" autocomplete="off" class="layui-input" value="${teacher.salaryacount}">
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
						url : 'TeacherServlet.action?op=editTeacherById',
						method : 'post',
						data : {
							"teacherid" : $("#teacherid").val(),
							"teachername" : $("#teachername").val(),
							"sex" : $("#sex").val(),
							"age" : $("#age").val(),
							"idcard" : $("#idcard").val(),
							"phone" : $("#phone").val(),
							"tsubjectname" : $("#tsubjectname").val(),
							"tgrade" : $("#tgrade").val(),
							"rank" : $("#rank").val(),
							"address" : $("#address").val(),
							"jointime" : $("#jointime").val(),
							
							"salaryacount" : $("#salaryacount").val(),
							"egcontact" : $("#egcontact").val(),
							/* "birthday" : $("#birthday").val(),  */
							"egphone" : $("#egphone").val(),								
							"thour" : $("#thour").val(),
							"wage" : $("#wage").val(),
							"status" : $("#status").val()
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
				elem : '#birthday' //指定元素
			});

			//执行一个laydate实例
			laydate.render({
				elem : '#jointime', //指定元素
				type:'datetime'
			});
		});
	</script>
</body>

</html>