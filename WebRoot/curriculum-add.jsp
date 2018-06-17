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
    <!--  <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script> -->
    <script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
  </head>
  
  <body>
    <div class="x-body">
                   
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>班级:
              </label>
              <div class="layui-input-inline">
                  <select name="classid" id="classid">
                  	<c:forEach items="${classList }" var="classinfo" >
	                    <option value="${classinfo.classid }">  ${classinfo.classname }</option>
                  	</c:forEach>
                  </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>课程:
              </label>
              <div class="layui-input-inline">
                  <select name="courseinfoid" id="courseinfoid">
                    <c:forEach items="${courseList }" var="course" >
	                    <option value="${course.courseid }"> ${course.coursename}</option>
                  	</c:forEach>
                  </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>星期:
              </label>
              <div class="layui-input-inline">
                  <select id="weekday" name="weekday" class="valid">
                    <option value="一">一</option>
                    <option value="二">二</option>
                    <option value="三">三</option>
                    <option value="四">四</option>
                    <option value="五">五</option>
                    <option value="六">六</option>
                    <option value="日">日</option>
                  </select>
              </div>
          </div>
          <!-- <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>教师:
              </label>
              <div class="layui-input-inline">
                  <select id="shipping" name="shipping" class="valid">
                    <option value="0"></option>
                    <option value="1"></option>
                  </select>
              </div>
          </div> -->
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>第几节课:
              </label>
              <div class="layui-input-inline">
                  <input type="text" class="layui-input" name="classtime" id="classtime" required=""
						lay-verify="required">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>开课时间:
              </label>
              <div class="layui-input-inline">
                  <input class="layui-input" name="curriculumstart" id="curriculumstart">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>结课时间:
              </label>
              <div class="layui-input-inline">
                  <input class="layui-input" name="curriculumend" id="curriculumend" required=""
						lay-verify="required">
              </div>
          </div>
          
          <div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> </label> <input
					type="submit" class="layui-btn" lay-filter="add" lay-submit=""
					value="添加">
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
            console.log(data);
            //发异步，把数据提交给服务器
				$.ajax({
						url : 'CurriculumServlet.action?op=addCurriculum',
						method : 'post',
						data : {
							"classid" : $("#classid").val(),
							"courseinfoid" : $("#courseinfoid").val(),
							"weekday" : $("#weekday").val(),
							"classtime" : $("#classtime").val(),
							"curriculumstart" : $("#curriculumstart").val(),
							"curriculumend" : $("#curriculumend").val(),
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
    <script>
	 layui.use('laydate', function(){
	        var laydate = layui.laydate;
	        
	      //时间选择器
	      laydate.render({
	       elem: '#curriculumstart'
	       
	       });
	        laydate.render({
	          elem: '#curriculumend'  //指定元素
	        });
	      });
    </script>
  </body>

</html>