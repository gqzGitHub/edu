<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"  errorPage="404.jsp"%>
    
<%@include file="tags.jsp"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>课外培训事务平台</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
	<link rel="stylesheet" href="./css/xadmin.css">
    <!--  <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script> -->
    <script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script></script>
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>

</head>
<body>
    <!-- 顶部开始 -->
    <div class="container">
        <div class="logo"><a href="./index.jsp">课外培训事务平台</a></div>
        <div class="left_open">
            <i title="展开左侧栏" class="iconfont">&#xe699;</i>
        </div>
        <ul class="layui-nav left fast-add" lay-filter="">
          <li class="layui-nav-item">
            <a href="javascript:;">+新增</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
              <dd><a onclick="x_admin_show('资讯','https://www.ganquanzhong.top/mynews/')"><i class="iconfont">&#xe6a2;</i>资讯</a></dd>
              <dd><a onclick="x_admin_show('图片','https://ganquanzhong.top')"><i class="iconfont">&#xe6a8;</i>图片</a></dd>
               <dd><a onclick="x_admin_show('用户','https://ganquanzhong.top/edu/')"><i class="iconfont">&#xe6b8;</i>用户</a></dd>
            </dl>
          </li>
        </ul>
        <ul class="layui-nav right" lay-filter="">
          <li class="layui-nav-item">
            <a href="javascript:;">${sessionScope.login.username }</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
              <dd><a onclick="x_admin_show('修改个人信息','./admin-info.jsp',600,400)">个人信息</a></dd>
              <dd><a href="AdminServlet.action?op=exit">退出</a></dd>
            </dl>
          </li>
        </ul>
        
    </div>
    <!-- 顶部结束 -->
    <!-- 中部开始 -->
     <!-- 左侧菜单开始 -->
    <div class="left-nav">
      <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>学生管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="member-list.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>潜在客户</cite>
                            
                        </a>
                    </li >
                    <li>
                        <a _href="stu-list.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>学生档案</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>班级管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="class-list.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>小班管理</cite>
                            
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>合同管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="order-list.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>合同查询</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>排课管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                	 <li>
                        <a _href="course-list.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>课程管理</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="course-arrange.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>排课</cite>
                        </a>
                    </li >
                   <!--  <li>
                        <a _href="course-records.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>上课记录查询</cite>
                        </a>
                    </li > -->
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe726;</i>
                    <cite>人事管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="staff-list.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>员工档案</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="staffsalary-list.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>员工工资</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="teac-list.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>教师档案</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="salary-list.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>教师工资</cite>
                        </a>
                    </li >
                </ul>
            </li>
        </ul>
      </div>
    </div>
    <!-- <div class="x-slide_left"></div> -->
    <!-- 左侧菜单结束 -->
    <!-- 右侧主体开始 -->
    <div class="page-content">
        <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
          <ul class="layui-tab-title">
            <li>我的桌面</li>
          </ul>
          <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='./welcome.jsp' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
          </div>
        </div>
    </div>
    <div class="page-content-bg"></div>
    <!-- 右侧主体结束 -->
    <!-- 中部结束 -->
    <!-- 底部开始 -->
    <div class="footer">
    	<center>
	        <div class="copyright">版权所有© 2018~2020  &nbsp; ForFuture Group<a href="http://www.ganquanzhong.top/" target="_blank">&nbsp;2018计算机大赛作品</a> </div>  
    	</center>
    </div>
    <!-- 底部结束 -->
    
</body>
</html>