<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="tags.jsp"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>课表-X-admin2.0</title>
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
    <script type="text/javascript">
	mysearch(1);

	function mysearch(pagenumber) {
		goPage(pagenumber, $("#formid").serialize());
	}

	/*Ajax 服务器的异步请求  删除staff*/
	function deleteTeacher(id) {
		$.post("TeacherServlet.action?op=deleteById", //请求的URL地址
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
	function goPage(cp, params) {
		var s;
		if (params == "") {
			s = "CurriculumServlet.action?&op=findCurriculumByPage&cp=" + cp;
		} else {
			s = "CurriculumServlet.action?op=findCurriculumByPage&cp=" + cp + "&"	+ params;
		}
		$.post(
				s,//请求地址和参数
				function(data) {
						$("#total").html("共有数据：" + data.totalNum + "条");
						var list = data.list;
						var tabData = '';
						//对集合遍历
						for (var i = 0; i < list.length; i++) {
							tabData += '<tr>';
								//多选框
								tabData += '<td> <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id="2"> <i class="layui-icon">&#xe605;</i> </div></td>';
								tabData += '<td>' + (i + 1) + '</td>';
								tabData += '<td>' + list[i].classname + '</td>';
								tabData += '<td>' + list[i].collegename	+ '</td>';
								tabData += '<td>' + list[i].coursename + '</td>';
								tabData += '<td>' + list[i].weekday + '</td>';
								tabData += '<td>' + list[i].classtime + '</td>';
								tabData += '<td>' + jsonDateFormat(list[i].curriculumstart)+ '</td>';
								tabData += '<td>' + jsonDateFormat(list[i].curriculumend)+ '</td>';
								tabData += '<td>' + list[i].schedule + '</td>';
								tabData += '<td class="td-status"><span class="layui-btn layui-btn-normal layui-btn-mini">'
										+ list[i].status + '</span></td>';
								//注意转义字符  操作
								/* tabData += '<td class="td-manage">'
										+ '<a title="详情" onclick="x_admin_show(\'详情\',\'TeacherServlet.action?op=findTeacherById&id='
										+ list[i].teacherid
										+ '\',700,600)" href="javascript:;"> <i class="layui-icon">&#xe63c;</i></a>'

										+ '&nbsp;<a title="修改" onclick="x_admin_show(\'修改\',\'TeacherServlet.action?op=preEditTeacherById&id='
										+ list[i].teacherid
										+ '\',700,600)" href="javascript:;"> <i class="layui-icon">&#xe642;</i></a>'

										+ '&nbsp;<a title="删除" href="javascript:deleteTeacher('+ list[i].teacherid +');"> <i class="layui-icon">&#xe640;</i></a>'

										+ '&nbsp;<a title="工资档案" onclick="x_admin_show(\'工资档案\',\'TeacherWageServlet.action?op=preEditTeacherWageById&id='
										+ list[i].teacherid
										+ '\',700,600)" href="javascript:;"> <i class="layui-icon">&#xe65e;</i></a>'
										
										+ '</td>';
								tabData += '</tr>'; */
							}
							if (data.totalNum == '0') {
								$('#error').html("没有找到符合你查询条件的数据");
							}

							$(".layui-btn").on('click', function() {
								$("#error").html("");
							});

							$('#tbody').get(0).innerHTML = tabData;
							genPageLink(data);
						}, 'json');

	}

	//json日期格式转换为正常格式
	function jsonDateFormat(jsonDate) {
		try {
			jsonDate = '/Date(' + jsonDate + ')/';
			var date = new Date(parseInt(jsonDate.replace("/Date(", "")
					.replace(")/", ""), 10));
			var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1)
					: date.getMonth() + 1;
			var day = date.getDate() < 10 ? "0" + date.getDate() : date
					.getDate();
			/* var hours = date.getHours();
			var minutes = date.getMinutes();
			var seconds = date.getSeconds();  */
			var hours =0;
			var minutes =0;
			var seconds =0; 
			var milliseconds = date.getMilliseconds();
			if (hours == 0 && minutes == 0 && seconds == 0) {
				return date.getFullYear() + "-" + month + "-" + day;
			} else {
				return date.getFullYear() + "-" + month + "-" + day + " "
						+ hours + ":" + minutes + ":" + seconds;
			} 
		} catch (ex) {
			return "";
		}
	}

	//页码链接
	function genPageLink(pb) {
		var ul = '<div>';
		if (pb.currentPage <= 1) {
			ul += '<a class="prev" href="javascript:mysearch(' + 1
					+ ')">&lt;&lt;</a>';
		} else {
			ul += '<a class="prev" href="javascript:mysearch(' + pb.pre
					+ ')">&lt;&lt;</a>';
		}
		if (pb.totalPage < 5) {
			for (var i = 1; i <= pb.totalPage; i++) {
				//如果当前遍历到的页码数等于当前页,则当前页码被激活
				if (pb.currentPage == i) {
					ul += '<span class = "current">' + i + '</span>';
				} else {
					ul += '<a class="num" href="javascript:mysearch(' + i
							+ ')">' + i + '</a>';
				}

			}
		} else {
			for (var i = 1; i <= 5; i++) {
				//如果当前遍历到的页码数等于当前页,则当前页码被激活
				if (pb.currentPage == i) {
					ul += '<span class="current">' + i + '</span>';
				} else {
					ul += '<a class="num" href="javascript:mysearch(' + i
							+ ')">' + i + '</a>';
				}

			}
		}

		if (pb.currentPage >= pb.totalPage) {
			ul += '<a class="next" href="javascript:mysearch(' + pb.totalPage
					+ ')">&gt;&gt;</a>';
		} else {
			ul += '<a class="next" href="javascript:mysearch(' + pb.next
					+ ')">&gt;&gt;</a>';
		}
		ul += '</div>';
		$('#paging').get(0).innerHTML = ul;
	}
</script>
    
    
  </head>
  
  <body>
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="index.jsp">首页</a>
        <a href="">排课管理</a>
        <a>
          <cite>课表</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row">
      	<!-- 查询表单 start -->
			<form class="layui-form layui-col-md12 x-so" id="formid" method="post">
				<input type="text" name="classname" placeholder="班级名"		autocomplete="off" class="layui-input">
				<input type="text" name="collegename" placeholder="所属教学点"		autocomplete="off" class="layui-input">
				<!-- 查询按钮 -->
				<input onclick="mysearch(1)" type="button" value="查询" class="layui-btn">
			</form>
			<!-- 查询表单 end -->
      </div>
      
      <xblock>
	     <button class="layui-btn"
				onclick="x_admin_show('排课','CurriculumServlet.action?&op=preAddCurriculum',700,600)"><i class="layui-icon"></i>排课
		 </button>
         <!-- 显示数据 总数 count--> 
		 <span class="x-right"	style="line-height:40px;color:red;" id="total"></span> 
      </xblock>
      
      <table class="layui-table">
        <thead>
          <tr>
          	<th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>序号</th>
            <th>班级名</th>
            <th>所属教学点</th>
            <th>课程</th>
            <th>星期</th>
            <th>第几节课</th>
            <th>开课时间</th>
            <th>结课时间</th>
            <th>课程学时</th>
            <th>状态</th>
         <!--    <th>操作</th> -->
          </tr>
        </thead>
         <!-- ajax 异步请求加载数据 -->
		 <tbody id="tbody"></tbody>
      </table>
      <!-- 错误提示 -->
	  <center style="color:red; font-size: 18px; font-weight:bold;"	id="error"></center>

	  <!-- 分页 start -->
	  <div class="page" id="paging"></div>
	  <!-- 分页 end -->

    </div>
    <script>
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

      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              $(obj).parents("tr").remove();
              layer.msg('已删除!',{icon:1,time:1000});
          });
      }



      function delAll (argument) {

        //var data = tableCheck.getData();
  
        layer.confirm('确认要删除吗？',function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
      }
    </script>
  </body>

</html>