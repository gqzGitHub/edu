<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="404.jsp"%>
    
  <!-- 添加标签库 -->
<%@include file="tags.jsp"%>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>工资页面-X-admin2.0</title>
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

	//分页函数
	function goPage(cp, params) {
		var s;
		if (params == "") {
			s = "TeacherWageServlet.action?&op=findTeacherWageByPage&cp=" + cp;
		} else {
			s = "TeacherWageServlet.action?op=findTeacherWageByPage&cp=" + cp + "&"	+ params;
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
								tabData += '<td>' + list[i].teacherid + '</td>';
								tabData += '<td>' + list[i].teachername	+ '</td>';
								tabData += '<td>' + list[i].tsubjectname + '</td>';
								tabData += '<td>' + list[i].idcard + '</td>';
								tabData += '<td>' + list[i].period + '</td>';
								tabData += '<td>' + list[i].fine + '</td>';
								tabData += '<td>' + list[i].wage + '</td>';
								tabData += '<td>' + list[i].totalwage + '</td>';
								tabData += '<td>' + jsonDateFormat(list[i].month)+ '</td>';
								//注意转义字符  操作
								tabData += '<td class="td-manage">'
										+ '<a title="详情" onclick="x_admin_show(\'详情\',\'TeacherWageServlet.action?op=findTeacherWageById&id='
										+ list[i].teacherid
										+ '\',700,600)" href="javascript:;"> <i class="layui-icon">&#xe63c;</i></a>'
										+ '</td>';
										
										
								tabData += '</tr>';
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
			var hours = date.getHours();
			var minutes = date.getMinutes();
			var seconds = date.getSeconds();
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
        <a href="">人事管理</a>
        <a>
          <cite>教师工资</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row">
      	<!-- query -->
        <!-- 查询表单 start -->
			<form class="layui-form layui-col-md12 x-so" id="formid" method="post">
				<input type="text" name="teachername" placeholder="姓名"		autocomplete="off" class="layui-input">
				<div class="layui-input-inline">	
					<select name="tsubjectname">
						<option>课程</option>
						<option>语文</option>
						<option>数学</option>
						<option>英语</option>
						<option>物理</option>
						<option>化学</option>
						<option>生物</option>
						<option>政治</option>
						<option>历史</option>
						<option>地理</option>
						<option>奥数</option>
						<option>美术</option>
						<option>音乐</option>
						<option>心理学</option>
						<option>体育</option>
						<option>出国游</option>
						<option>社会</option>
						<option>剑桥英语</option>
						<option>英语听说课</option>
						<option>奥英</option>
						<option>其他</option>
					</select>
				</div>
				<!-- 查询按钮 -->
				<input onclick="mysearch(1)" type="button" value="查询" class="layui-btn">
			</form>
			<!-- 查询表单 end -->
      </div>
      <xblock>
        <!-- <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button> -->
       	<!--  <span class="x-right" style="line-height:40px">共有数据：88 条</span> -->
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
            <th>工号</th>
            <th>姓名</th>
            <th>课程</th>
            <th>身份证号</th>
            <th>授课小时</th>
            <th>罚款</th>
            <th>小时工资</th>
            <th>合计工资</th>
            <th>结算日期</th>
            <th>操作</th>
          </tr>
        </thead>
        <!-- ajax 异步请求加载数据 -->
		<tbody id="tbody"></tbody>
        <!-- <tbody>
          <tr>
            <td>
              <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
            </td>
           <td>1</td>
           <td>1001</td>
            <td>韩梅梅</td>
            <td>营口路教学点</td>
            <td>421127198509131013</td>
            <td>10010</td>
            <td>6000</td>
            <td>0</td>
            <td>8000</td>
            <td>2018-03-25 14:01:38</td>
            <td class="td-manage">
              <a title="查看明细"  onclick="x_admin_show('明细','salary-detail.html')" href="javascript:;">
                <i class="layui-icon">&#xe63c;</i>
              </a>
            </td>
          </tr>
        </tbody> -->
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
 	</script>

  </body>

</html>