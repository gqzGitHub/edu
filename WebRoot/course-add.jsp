<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="tags.jsp"%>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>添加课程</title>
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
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>课程名称:
              </label>
              <div class="layui-input-inline">
                  <input type="text" class="layui-input" name="coursename" id="coursename" required="required" lay-verify="required"  autocomplete="off" >
              </div>
          </div>        
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>学科编号:
              </label>
              <div class="layui-input-inline">
                  <input type="text" class="layui-input" name="subjectid" id="subjectid" required="required"
						lay-verify="number" autocomplete="off" >
              </div>
          </div>  
          
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>课程学时:
              </label>
              <div class="layui-input-inline">
                  <input type="text" class="layui-input" name="schedule" id="schedule" required="required" lay-verify="required">
              </div>
          </div>
          
          <div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> </label>
				<input	type="submit" class="layui-btn" lay-filter="add" lay-submit=""	value="添加">
		  </div>
      </form>
    </div>
    <script>
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
        

          //监听提交
          form.on('submit(add)', function(data){
            //发异步，把数据提交给服务器
				$.ajax({
						url : 'CourseServlet.action?op=addCourse',
						method : 'post',
						data : {
							"coursename" : $("#coursename").val(),
							"subjectid" : $("#subjectid").val(),
							"schedule" : $("#schedule").val()
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