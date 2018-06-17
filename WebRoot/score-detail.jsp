<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="tags.jsp"%>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <!--  <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script> -->
    <script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
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
         <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>学生成绩:
              </label>
               <div class="layui-input-inline">
                  <input type="text" id="studentname" name="studentname" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${score2.studentname}">
              </div>
          </div>
          <input type="hidden" id="studentid" name="studentid" value="${score2.studentid}"/>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>课程:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="coursename" name="coursename" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${score2.coursename}">
              </div>
          </div>
          <input type="hidden" id="courseid" name="courseid" value="${score2.courseid}"/>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>成绩:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="score" name="score" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
           
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  class="layui-btn" lay-filter="add" lay-submit="">保存</button>
          </div>
      </form>
    </div>
    <script>
        layui.use('form' , function(){
          var form = layui.form;
   
          //监听提交
          form.on('submit(add)', function(data){
        	  $.ajax({
					url : 'ScoreServlet.action?op=addScore',
					method : 'post',
					data:{
					    "studentid":$("#studentid").val(),
					    "courseid":$("#courseid").val(),
					    "score":$("#score").val()
					},
					success : function(data) {
						if (data == -1) {
							  layer.open({
                           title: '信息'
                           ,content: '创建失败'
                        });   
						}
						if (data == 1) {
							  layer.open({
		                           title: '信息'
		                           ,content: '保存成功'
		                        });   
							//var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
						   
							//parent.layer.close(index); // 关闭layer
						}
					}
				});
            
            return false;
          });       
        });
        
      
    </script>
  </body>

</html>