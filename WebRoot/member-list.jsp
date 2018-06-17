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
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">
<!--  <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script> -->
    <script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script></script>
<script type="text/javascript" src="./lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript" src="./js/xadmin.js"></script>
<script type="text/javascript" src="./js/jquery-2.1.4.min.js"></script>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script type="text/javascript">
	 mysearch(1);
	 
	function mysearch(pagenumber){
		
		
		goPage(pagenumber,$("#formid").serialize());
		
		
	}
	
	 //分页函数
		function goPage(cp,params) {
			    var s ;
			    if(params == ""){
			    	s="StudentServlet.action?&op=findPotStudentByPage&cp="+cp;
			    }else{
			    	 s="StudentServlet.action?op=findPotStudentByPage&cp="+cp+"&"+params;
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
					tabData += '<td>'+list[i].studentname+'</td>';
					tabData += '<td>'+list[i].sex+'</td>';
					tabData += '<td>'+list[i].phone+'</td>';
					tabData += '<td>'+list[i].school+'</td>';
					tabData += '<td>'+list[i].grade+'</td>';
					tabData += '<td>'+list[i].address+'</td>';
					tabData += '<td>'+jsonDateFormat(list[i].birthday)+'</td>';
					tabData += '<td>'+jsonDateFormat(list[i].regtime)+'</td>';
					tabData += '<td>'+list[i].guardian+'</td>';
					tabData += '<td>'+list[i].gdphone+'</td>';
					tabData += '<td>'+list[i].infosource+'</td>';
					tabData += '<td>'+list[i].subjectname+'</td>';
					tabData +='<td class="td-status"><span class="layui-btn layui-btn-normal layui-btn-mini">'+list[i].status+'</span></td>';
					//注意转义字符
					tabData += '<td class="td-manage"><a title="报名" onclick="x_admin_show(\'签订合同\',\'StudentServlet.action?op=findStudentById&id='+list[i].studentid+'\',600,400)" href="javascript:;"> <i class="layui-icon">&#xe608;</i></a></td>';
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
	</script>
</head>

<body>
	<div class="x-nav">
		<a class="layui-btn layui-btn-small"
			style="line-height:1.6em;margin-top:3px;float:right"
			href="javascript:location.replace(location.href);" title="刷新"> <i
			class="layui-icon" style="line-height:30px">ဂ</i>
		</a>
	</div>
	<div class="x-body">
		<div class="layui-row">
			<form action="" id="formid" method="post" class="layui-form layui-col-md12 x-so">
				<input type="text" name="studentname" placeholder="学生姓名"
					autocomplete="off" class="layui-input" id="form_studentname">
					 <input type="text"
					name="school" placeholder="学校" autocomplete="off"
					class="layui-input" id="form_school">
				<div class="layui-input-inline">
					<select name="infosource" id="form_infosource">
						<option>信息来源</option>
						<option>电话预约</option>
						<option>网络预约</option>
						<option>门店直访</option>
						<option>市场专员</option>
						<option>家长转介绍</option>
					</select>
				</div>
				<div class="layui-input-inline">
					<select name="relation" id="form_relation">
						<option>监护人关系</option>
						<option>爸 爸</option>
						<option>妈妈</option>
						<option>爷爷</option>
						<option>奶奶</option>
						<option>外公</option>
						<option>外婆</option>
						<option>叔叔</option>
						<option>阿姨</option>
						<option>其他</option>
					</select>
				</div>
				<div class="layui-input-inline">
					<select name="grade" id="form_grade">
						<option>年级</option>
						<option>一年级</option>
						<option>二年级</option>
						<option>三年级</option>
						<option>四年级</option>
						<option>五年级</option>
						<option>六年级</option>
						<option>初一</option>
						<option>初二</option>
						<option>初三</option>
						<option>高一</option>
						<option>高二</option>
						<option>高三</option>
						<option>成人</option>
					</select>
				</div>
				<input class="layui-input" placeholder="开始时间" name="start" id="start">
				<input class="layui-input" placeholder="结束时间" name="end" id="end">
				
				<input onclick="mysearch(1)" type="button" value="查询" class="layui-btn">
				<button type="reset" class="layui-btn" onclick="javascript:window.location.reload(true);">重置</button>
			</form>
		</div>
		<xblock>
		<!--  <button class="layui-btn layui-btn-danger" onclick="delAll()">
			<i class="layui-icon"></i>批量删除
		</button>-->
		<button class="layui-btn"
			onclick="x_admin_show('添加潜在学生','SubjectServlet.action?op=getSubjects&flag=1',600,400)">
			<i class="layui-icon"></i>添加潜在学生
		</button>
		<span class="x-right" style="line-height:40px" id="total"></span></xblock>
		<table class="layui-table">
			<thead>
				<tr>
					<!-- <th>
						<div class="layui-unselect header layui-form-checkbox"
							lay-skin="primary">
							<i class="layui-icon">&#xe605;</i>
						</div>
					</th> -->
					<th>序号</th>
					<th>学生姓名</th>
					<th>性别</th>
					<th>电话</th>
					<th>学校</th>
					<th>年级</th>
					<th>现居住地地址</th>
					<th>出生日期</th>
					<th>创建时间</th>
					<th>监护人</th>
					<th>监护人电话</th>
					<th>信息来源</th>
					<th>所报学科</th>
					<th>报名状态</th>
					<th>签订合同</th>
				</tr>
			</thead>
			<tbody id="tbody">
			<!-- 分页链接 -->
				<!--<c:forEach items="${list}" var="student" varStatus="status">
					<tr>
						<td>
							<div class="layui-unselect layui-form-checkbox"
								lay-skin="primary" data-id='2'>
								<i class="layui-icon">&#xe605;</i>
							</div></td>
						<td>${status.count}</td>
						<td>${student.studentname}</td>
						<td>${student.sex}</td>
						<td>${student.phone}</td>
						<td>${student.school}</td>
						<td>${student.grade}</td>
						<td>${student.address}</td>
						<td><fmt:formatDate value="${student.birthday}"
								pattern="yyyy-MM-dd" var="d" />${d}</td>
						<td><fmt:formatDate value="${student.regtime}"
								pattern="yyyy-MM-dd hh:mm:ss" var="d" />${d}</td>
						<td>${student.guardian}</td>
						<td>${student.gdphone}</td>
						<td>${student.infosource}</td>
						<td>${student.subjectid}</td>
						<td class="td-status"><span
							class="layui-btn layui-btn-normal layui-btn-mini">${student.status}</span>
						</td>
						<td class="td-manage"><a onclick="member_stop(this,'10001')"
							href="javascript:;" title="签单"> <i class="layui-icon">&#xe601;</i>
						</a> <a title="修改"
							onclick="x_admin_show('修改','member-edit.jsp',600,400)"
							href="javascript:;"> <i class="layui-icon">&#xe642;</i> </a> <a
							title="删除" onclick="member_del(this,'要删除的id')"
							href="javascript:;"> <i class="layui-icon">&#xe640;</i> </a></td>
					</tr>
				</c:forEach>
				  -->
			</tbody>
		</table>
		 <center style="color:red; font-size: 16px;" id="error"></center>
		<div class="page" id="paging">
			<!-- <div>
			 
				<a class="prev" href="">&lt;&lt;</a> 
				<span class="current">1</span>
				<span class="current">2</span>
				<a class="num" href="">3</a>
				<a class="num" href="">4</a> 
				<a class="next" href="">&gt;&gt;</a>
				
			</div>--> 
		</div>

	</div>
	
	<script>
		layui.use('laydate', function() {
			var laydate = layui.laydate;

			//执行一个laydate实例
			laydate.render({
				elem : '#start' //指定元素
			});

			//执行一个laydate实例
			laydate.render({
				elem : '#end' //指定元素
			});
		});
	</script>
</body>

</html>