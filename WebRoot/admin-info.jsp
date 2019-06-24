<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
    
<%@include file="tags.jsp"%>    
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>管理员信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
  </head>
  
  <body>
    <div class="x-body">
 <form class="layui-form">
 		  <input type="hidden" id="adminid" name="adminid"  value="${sessionScope.login.adminid }">
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>用户名
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="username" name="username" required="" lay-verify="required" disabled="disabled"
                  autocomplete="off"  class="layui-input"  value="${sessionScope.login.username }">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>将会成为您唯一的登入名
              </div>
          </div>
         <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>手机
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="phone" name="phone" required=""   lay-verify="phone"
                  autocomplete="off" class="layui-input" value="${sessionScope.login.phone }">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>邮箱
              </label>
              <div class="layui-input-inline">
                  <input type="text"  id="email" name="email" required="" lay-verify="email"
                  autocomplete="off" class="layui-input" value="${sessionScope.login.email }">
              </div>
               
          </div>
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>旧密码
              </label>
              <div class="layui-input-inline">
                  <input type="password" id="oldpass" name="oldpass" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" onblur="checkPass(${sessionScope.login.adminid })">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>新密码
              </label>
              <div class="layui-input-inline">
                  <input type="password" id="pass" name="pass" required="" lay-verify="pass"
                  autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  6到16个字符
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
                  <span class="x-red">*</span>确认新密码
              </label>
              <div class="layui-input-inline">
                  <input type="password" id="repass" name="repass" required="" lay-verify="repass"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> </label>
				<input	type="submit" class="layui-btn" lay-filter="add" lay-submit=""	value="修改个人信息">
		  </div>
      </form>
    </div>
    
    
    <script>
    	layui.use([ 'form', 'layer' ], function() {
			$ = layui.jquery;
			var form = layui.form, layer = layui.layer;
        
          //自定义验证规则
          form.verify({
            nikename: function(value){
              if(value.length < 3){
                return '昵称至少得3个字符啊';
              }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,repass: function(value){
                if($('#pass').val()!=$('#repass').val()){
                    return '两次密码不一致';
                }
            }
          });
          
          

          //监听提交
          form.on('submit(add)', function(data) {
            $.ajax({
						url : 'AdminServlet.action?op=update',
						method : 'post',
						data : {
							"adminid" : $("#adminid").val(),
							"phone" : $("#phone").val(),
							"email" : $("#email").val(),
							"oldpass" : $("#oldpass").val(),
							"password" : $("#repass").val()
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
         
         
         
          function checkPass(id) {
				$.post("AdminServlet.action?op=checkPass", //请求的URL地址
				{
					id : id,
					password:$("#oldpass").val()
				}, //向服务器提交的数据
				function(data) { //从服务器返回的数据
					if (data == -1) {
						layer.alert('原密码不对!', {icon : 5}, function() {
							window.location.reload(true); //刷新父页面
						});
					}
				});
			}
    </script>
   
  </body>

</html>