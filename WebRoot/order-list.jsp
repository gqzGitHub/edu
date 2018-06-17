<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <div class="x-nav">
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" id="formid">
        	<input type="text" name="teachplace"  placeholder="教学点名称" autocomplete="off" class="layui-input">
            <div class="layui-input-inline">
            <select name="grade">
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
            <div class="layui-input-inline">
            <select name="contracttype">
              <option>类型</option>
              <option>一对一</option>
              <option>小班</option>
              <option>作业吧</option>
              <option>出国游</option>
              <option>训练营</option>
              <option>合作办学</option>
            </select>
          </div>
          <input class="layui-input" placeholder="开始时间" name="start" id="start">
          <input class="layui-input" placeholder="结束时间" name="end" id="end">
          <input onclick="mysearch(1)" type="button" value="查询" class="layui-btn">
          <button type="reset" class="layui-btn" onclick="javascript:window.location.reload(true);">重置</button>
        </form>
      </div>
     <!--<xblock>
		  <button class="layui-btn layui-btn-danger" onclick="delAll()">
			<i class="layui-icon"></i>批量删除
		</button>-->
		<!-- <button class="layui-btn" onclick="x_admin_show('新签合同','./order-add.html',600,400)"><i class="layui-icon"></i>新签合同</button>
		</xblock> -->
		<span class="x-right" style="line-height:40px" id="total"></span>
      <table class="layui-table">
        <thead>
          <tr>
            <th>序号</th>
            <th>合同编号</th>
            <th>所在校区名称</th>
            <th>学生姓名</th>
            <th>年级</th>
            <th>签订时间</th>
             <th>类型</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody id="tbody">
         <!--   <tr>
            <td>1</td>
            <td>MMWWW1001001</td>
            <td>营口路教学点</td>
            <td>小明</td>
            <td>一年级</td>
            <td>2017-01-01 11:11:42</td>
            <td>一对一</td>
            <td class="td-manage">
              <a title="明细"  onclick="x_admin_show('','order-edit.jsp',600,400)" href="javascript:;">
                <i class="layui-icon">&#xe63c;</i>
              </a>
            </td>
          </tr>
          -->
        </tbody>
      </table>
      <center style="color:red; font-size: 16px;" id="error"></center>
      <div class="page" id="paging">
        <!--  <div>
          <a class="prev" href="">&lt;&lt;</a>
          <a class="num" href="">1</a>
          <span class="current">2</span>
          <a class="num" href="">3</a>
          <a class="num" href="">4</a>
          <a class="next" href="">&gt;&gt;</a>
        </div>-->
      </div>

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

  </script>
   <script type="text/javascript">
	 //goPage(1,"");
	 mysearch(1);
	 
	function mysearch(pagenumber){
		
		
		goPage(pagenumber,$("#formid").serialize());
		
		
	}
	
	 //分页函数
		function goPage(cp,params) {
			    var s ;
			    if(params == ""){
			    	s="ContractinServlet.action?&op=findContractinByPage&cp="+cp;
			    }else{
			    	 s="ContractinServlet.action?op=findContractinByPage&cp="+cp+"&"+params;
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
					tabData += '<td>'+list[i].contractnumber+'</td>';
					tabData += '<td>'+list[i].teachplace+'</td>';
					tabData += '<td>'+list[i].studentname+'</td>';
					tabData += '<td>'+list[i].grade+'</td>';
					tabData += '<td>'+jsonDateFormat(list[i].createtime)+'</td>';
					tabData += '<td>'+list[i].contracttype+'</td>';
					//注意转义字符
					tabData += '<td class="td-manage"><a title="明细" onclick="x_admin_show(\'合同详情\',\'ContractinServlet.action?op=findContractinById&id='+list[i].contractid+'\',600,400)" href="javascript:;"> <i class="layui-icon">&#xe63c;</i></a></td>';
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
  </body>

</html>