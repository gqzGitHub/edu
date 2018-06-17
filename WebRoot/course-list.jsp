<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="tags.jsp"%>
<!DOCTYPE html>
<html>  
  <head>
    <meta charset="UTF-8">
    <title>课程管理-X-admin2.0</title>
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
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="index.jsp">首页</a>
        <a href="">排课管理</a>
        <a>
          <cite>课程</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" id="formid">
        	<input type="text" name="coursename"  placeholder="课程名称" autocomplete="off" class="layui-input">
          <input onclick="mysearch(1)" type="button" value="查询" class="layui-btn">
        </form>
      </div>
      <xblock>
        
        <button class="layui-btn" onclick="x_admin_show('增加课程','course-add.jsp',600,400)"><i class="layui-icon"></i>增加课程</button>
        <span class="x-right" style="line-height:40px" id="total"></span>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>序号</th>
            <th>课程名称</th>
            <th>所属学科编号</th>
            <th>课程学时</th>
            <th>小班状态</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody id="tbody">
        </tbody>
      </table>
      <center style="color:red; font-size: 16px;" id="error"></center>
      <div class="page" id="paging">
      </div>
    </div>
    <script>
	 mysearch(1);
	 
	function mysearch(pagenumber){
		goPage(pagenumber,$("#formid").serialize());
		//console.log($("#formid").serialize());
	}
	/*Ajax 服务器的异步请求  删除staff*/
	function deleteTeacher(id) {
		$.post("CourseServlet.action?op=deleteById", //请求的URL地址
		{
			id : id
		}, //向服务器提交的数据
		function(data) { //从服务器返回的数据
			layer.alert('已删除!', {icon : 1}, function() {
				window.location.reload(true); //刷新父页面
			});
		});
	};
	 //分页函数
		function goPage(cp,params) {
			    var s ;
			    if(params == ""){
			    	s="CourseServlet.action?&op=findCourseByPage&cp="+cp;
			    }else{
			    	 s="CourseServlet.action?op=findCourseByPage&cp="+cp+"&"+params;
			    }
			    
	    	    $.post(s,function(data){
	    	    $("#total").html("共有数据："+data.totalNum+"条");
	    		var list = data.list;
				var tabData = '';
				//对集合遍历
				for(var i = 0; i<list.length;i++){
					tabData += '<tr>';
					//tabData += '<td><div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id="2"><i class="layui-icon">&#xe605;</i></div></td>';
					tabData += '<td>'+(i+1)+'</td>';
					tabData += '<td>'+list[i].coursename+'</td>';
					tabData += '<td>'+list[i].subjectid+'</td>';
					tabData += '<td>'+list[i].schedule+'</td>';
					tabData += '<td class="td-status"><span class="layui-btn layui-btn-normal layui-btn-mini">'
										+ list[i].status + '</span></td>';
					tabData += '<td class="td-manage"><a title="删除" href="javascript:deleteTeacher('+ list[i].courseid +');"> <i class="layui-icon">&#xe640;</i></a></td>';
					tabData += '</tr>';
				}
				if(data.totalNum=='0'){
				   $('#error').html("没有找到符合你查询条件的的记录,请检查你的查询条件是否输入正确");
				}
				$(".layui-btn").on('click', function() {
					 $("#error").html("");
				});
				$('#tbody').get(0).innerHTML = tabData;
				genPageLink(data);
			},'json');  

		}
		function jsonDateFormat(jsonDate) {//json日期格式转换为正常格式
		    		 try {
		    		  jsonDate = '/Date('+jsonDate+')/';
		    		  var date = new Date(parseInt(jsonDate.replace("/Date(", "").replace(")/", ""), 10));
		    		  var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
		    		  var day = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
		    		  var hours = date.getHours();
		    		  var minutes = date.getMinutes();
		    		  var seconds = date.getSeconds();
		    		  var milliseconds = date.getMilliseconds();
		    		  if(hours==0 && minutes==0 && seconds==0){
		    		   return date.getFullYear() + "-" + month + "-" + day;
		    		  }else{
		    		      return date.getFullYear() + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds ;
		    		  }
		    		 } catch (ex) {
		    		  return "";
		    		 }
		    		}
		//页码链接
		function genPageLink(pb){
		   var ul = '<div>';
		   if(pb.currentPage <=1){
						ul += '<a class="prev" href="javascript:mysearch('+1+')">&lt;&lt;</a>';	
					}else{
					  ul += '<a class="prev" href="javascript:mysearch('+pb.pre+')">&lt;&lt;</a>';
					}
		      if(pb.totalPage<4){
			 for(var i =1 ;i<= pb.totalPage;i++){
						//如果当前遍历到的页码数等于当前页,则当前页码被激活
						if(pb.currentPage == i){
							ul += '<span class = "current">'+i+'</span>';
						}else{
							ul += '<a class="num" href="javascript:mysearch('+i+')">'+i+'</a>';
						}
								
					} 
		      }else{
		          for(var i =1 ;i<=4;i++){
						//如果当前遍历到的页码数等于当前页,则当前页码被激活
						if(pb.currentPage == i){
							ul += '<span class="current">'+i+'</span>';
						}else{
							ul += '<a class="num" href="javascript:mysearch('+i+')">'+i+'</a>'	;
						}
								
					} 
		      }
			 if(pb.currentPage >= pb.totalPage){
						ul += '<a class="next" href="javascript:mysearch('+pb.totalPage+')">&gt;&gt;</a>';
					}else{
						ul += '<a class="next" href="javascript:mysearch('+pb.next+')">&gt;&gt;</a>';
					}
					ul += '</div>';
					$('#paging').get(0).innerHTML = ul;
		}
		
      layui.use('laydate', function(){
        var laydate = layui.laydate;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
      });

       /*用户-停用*/
      function member_stop(obj,pb, id){
          layer.confirm('确认停用/启用该小班？',function(index){

              if($(obj).attr('title')=='停用'){
            	  $.ajax({
						url : 'CourseServlet.action?op=updateCourseStatus',
						method : 'post',
						data : {
							"flag" : 1,
							"courseid" : id
						},
						success : function(data) {
							if (data == 1) {
								//发异步把用户状态进行更改
				                $(obj).attr('title','启用');
				                $(obj).find('i').html('&#xe62f;');
				                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
				                layer.msg('停用!',{icon: 5,time:1000});
				              }
							if (data == -1) {
								layer.open({
									  title: '信息'
									  ,content: '停用失败！'
									});   
							}
						}
					});
              }else{
            	  $.ajax({
						url : 'ClassInfoServlet.action?op=updateClassStatus',
						method : 'post',
						data : {
							"flag" : 2,
							"courseid" : id
						},
						success : function(data) {
							if (data == 1) {
								 $(obj).attr('title','停用')
					                $(obj).find('i').html('&#xe601;');
					                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('正常状态');
					                layer.msg('启用!',{icon: 5,time:1000});

							}
							if (data == -1) {
								layer.open({
									  title: '信息'
									  ,content: '启用失败！'
									});    
							}
						}
					});
               
              }
              
          });
      }

      /*用户-删除*/
      function member_del(obj,pb,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              $.ajax({
					url : 'ClassInfoServlet.action?op=delClassInfoById',
					method : 'post',
					data : {
						"classid" : id
					},
					success : function(data) {
						if(data==1){
							  $(obj).parents("tr").remove();
				              layer.msg('已删除!',{icon:1,time:1000});
				              mysearch(pb);
						}
						else{
							layer.msg('删除失败!',{icon:1,time:1000});
						}
					}
				});
          });
      }
      //批量删除
      function delAll (argument) {

        var data = tableCheck.getData();
  
        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
      }
      
    </script>
  </body>

</html>