<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="tags.jsp"%>
<!DOCTYPE html>
<html>  
  <head>
    <meta charset="UTF-8">
    <title>课程列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
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
    <div class="x-nav">
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" id="formid">
        	<input type="text" name="classname"  placeholder="小班名称" autocomplete="off" class="layui-input">
        	<input type="text" name="collegename"  placeholder="所属教学点" autocomplete="off" class="layui-input">
        <div class="layui-input-inline">
            <select name="status">
              <option>小班状态</option>
              <option>正常状态</option>
              <option>已停用</option>
            </select>
         </div>
          <input class="layui-input" placeholder="开始时间" name="start" id="start">
          <input class="layui-input" placeholder="结束时间" name="end" id="end">
          <input onclick="mysearch(1)" type="button" value="查询" class="layui-btn">
        </form>
      </div>
      <xblock>
        
        <button class="layui-btn" onclick="x_admin_show('创建小班','ClassInfoServlet.action?op=classView',600,400)"><i class="layui-icon"></i>创建小班</button>
        <span class="x-right" style="line-height:40px" id="total"></span>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>序号</th>
            <th>教学点名称</th>
            <th>小班名称</th>
            <th>学生人数</th>
            <th>创建时间</th>
            <th>小班状态</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody id="tbody">
          <!--  <tr>
            <td>1</td>
            <td>营口路教学点</td>
            <td>营口一班</td>
            <td>20</td>
            <td>017-01-01 11:11:42</td>
            <td class="td-status">
              <span class="layui-btn layui-btn-normal layui-btn-mini">正常状态</span></td>
            <td class="td-manage">
              <a onclick="member_stop(this,'10001')" href="javascript:;"  title="启用">
                <i class="layui-icon">&#xe601;</i>
              </a>
              <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
                <i class="layui-icon">&#xe640;</i>
              </a>
            </td>
          </tr>
          -->
        </tbody>
      </table>
      <center style="color:red; font-size: 16px;" id="error"></center>
      <div class="page" id="paging">
        <!--<div>
          <a class="prev" href="">&lt;&lt;</a>
          <a class="num" href="">1</a>
          <span class="current">2</span>
          <a class="num" href="">3</a>
          <a class="num" href="">4</a>
          <a class="next" href="">&gt;&gt;</a>
        </div>
          -->
      </div>
    </div>
    <script>
	 mysearch(1);
	 
	function mysearch(pagenumber){
		
		
		goPage(pagenumber,$("#formid").serialize());
		//console.log($("#formid").serialize());
		
	}
	
	 //分页函数
		function goPage(cp,params) {
			    var s ;
			    if(params == ""){
			    	s="ClassInfoServlet.action?&op=findClassInfoByPage&cp="+cp;
			    }else{
			    	 s="ClassInfoServlet.action?op=findClassInfoByPage&cp="+cp+"&"+params;
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
					tabData += '<td>'+list[i].collegename+'</td>';
					tabData += '<td>'+list[i].classname+'</td>';
					tabData += '<td>'+list[i].total+'</td>';
					tabData += '<td>'+jsonDateFormat(list[i].createtime)+'</td>';
					 
						if(list[i].status=='正常状态'){
							tabData += '<td class="td-status"><span class="layui-btn layui-btn-normal layui-btn-mini">'+list[i].status+'</span></td>';
							//注意转义字符
							tabData += '<td class="td-manage"><a id="flag" onclick="member_stop(this,'+data.currentPage+','+list[i].classid+')" href="javascript:;" title="停用"><i class="layui-icon">&#xe601;</i></a><a title="删除" onclick="member_del(this,'+data.currentPage+','+list[i].classid+')" href="javascript:;"><i class="layui-icon">&#xe640;</i></a><a title="查看成绩" onclick="x_admin_show(\'学生成绩表\',\'PageTransServlet.action?op=pageTrans2&classid='+list[i].classid+'\',900,400)" href="javascript:;"> <i class="layui-icon">&#xe63c;</i></a></td>';
						}else{
							tabData += '<td class="td-status"><span class="layui-btn layui-btn-normal layui-btn-mini layui-btn-disabled">'+list[i].status+'</span></td>';
							//注意转义字符
							tabData += '<td class="td-manage"><a id="flag" onclick="member_stop(this,'+data.currentPage+','+list[i].classid+')" href="javascript:;" title="启用"><i class="layui-icon">&#xe62f;</i></a><a title="删除" onclick="member_del(this,'+data.currentPage+','+list[i].classid+')" href="javascript:;"><i class="layui-icon">&#xe640;</i></a><a title="查看成绩" onclick="x_admin_show(\'学生成绩表\',\'PageTransServlet.action?op=pageTrans2&classid='+list[i].classid+'\',900,400)" href="javascript:;"> <i class="layui-icon">&#xe63c;</i></a></td>';
						}
					 
				 
					
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
						url : 'ClassInfoServlet.action?op=updateClassStatus',
						method : 'post',
						data : {
							"flag" : 1,
							"classid" : id
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
							"classid" : id
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