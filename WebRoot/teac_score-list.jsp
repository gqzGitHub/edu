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
   <!-- <div class="x-nav">
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i>
      </a>
    </div>
    <div class="x-body">
      <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" id="formid">
        	<input type="text" name="studentname"  placeholder="学生姓名" autocomplete="off" class="layui-input">
          <input onclick="mysearch(1)" type="button" value="查询" class="layui-btn">
        </form>
      </div>
        -->
        <span class="x-right" style="line-height:40px" id="total"></span>
    
      <table class="layui-table">
        <thead>
          <tr>
            <th>序号</th>
            <th>学生姓名</th>
            <th>课程</th>
            <th>分数</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody id="tbody">
          <!--  <c:forEach items="${list}" var="score" varStatus="status">
             <tr>
            <td>${status.index+1}</td>
            <td>${score.studentname}</td>
            <td>${score.coursename}</td>
            <td>${score.score}</td>
            <td class="td-manage">
              <a href="javascript:;"  title="删除">
                <i class="layui-icon">&#xe640;</i>
              </a>
            </td>
          </tr>
           </c:forEach>   -->
        </tbody>
      </table>
      <script type="text/javascript">
      
           $.ajax({
        	   url:"ScoreServlet.action?op=findAll&classid="+${classid},
        	   dataType:"json",
        	   success:function(data){
        		   console.log(data);
        		   var tabData = '';
        		   for(var i=0;i<data.length;i++){
        			   tabData += '<tr>';
        			   tabData += '<td>'+(i+1)+'</td>';
   					   tabData += '<td>'+data[i].studentname+'</td>';
   					   tabData += '<td>'+data[i].coursename+'</td>';
   					   tabData += '<td>'+data[i].score+'</td>';
   					   tabData += '<td class="td-manage"><a title="删除" onclick="member_del(this,'+data[i].scoreid+')" href="javascript:;"><i class="layui-icon">&#xe640;</i></a></td>';
   					   tabData += '</tr>';
        		   }
        		   $('#tbody').get(0).innerHTML = tabData;
        	   }
           });
           
           function member_del(obj,id){
               layer.confirm('确认要删除吗？',function(index){
                   //发异步删除数据
                   $.ajax({
     					url : 'ScoreServlet.action?op=delByCourseId',
     					method : 'post',
     					data : {
     						"scoreid" : id
     					},
     					success : function(data) {
     						if(data==1){
     				              layer.msg('删除成功!',{icon:1,time:1000});
     				              window.location.reload(true);
     						}
     						if(data==0){
     							layer.msg('删除失败!',{icon:1,time:1000});
     						}
     					}
     				});
               });
           }
      </script> 
  </body>
</html>