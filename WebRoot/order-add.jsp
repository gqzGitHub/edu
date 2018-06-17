<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="tags.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>合同-X-admin2.0</title>
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
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <div class="x-body">
        <form class="layui-form" id="formid">
        <input type="hidden" value="${student.studentid}" id="stuid">
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>合同编号:
              </label>
              <div class="layui-input-inline">
                  <input type="text"  name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${contractnumber}" id="contractnumber">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>合同类型:
              </label>
              <div class="layui-input-inline">
                  <select name="contrller" id="contracttype">
                    <option>一对一</option>
                  <option>小班</option>
                  <option>作业吧</option>
                  <option>出国游</option>
                  <option>训练营</option>
                  <option>合作办学</option>
                  </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>学生姓名:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="username" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${student.studentname}">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>年级:
              </label>
              <div class="layui-input-inline">
                  <select id="shipping" name="shipping" class="valid">
                    <option <c:if test="${student.grade=='一年级'}">selected="selected"</c:if>>一年级</option>
                    <option <c:if test="${student.grade=='二年级'}">selected="selected"</c:if>>二年级</option>
                    <option <c:if test="${student.grade=='三年级'}">selected="selected"</c:if>>三年级</option>
                    <option <c:if test="${student.grade=='四年级'}"> selected="selected"</c:if>>四年级</option>
                    <option <c:if test="${student.grade=='五年级'}">selected="selected"</c:if>>五年级</option>
                    <option <c:if test="${student.grade=='六年级'}">selected="selected"</c:if>>六年级</option>
                    <option <c:if test="${student.grade=='初一'}">selected="selected"</c:if>>初一</option>
                    <option <c:if test="${student.grade=='初二'}">selected="selected"</c:if>>初二</option>
                    <option <c:if test="${student.grade=='初三'}">selected="selected"</c:if>>初三</option>
                    <option <c:if test="${student.grade=='高一'}">selected="selected"</c:if>>高一</option>
                    <option <c:if test="${student.grade=='高二'}">selected="selected"</c:if>>高二</option>
                    <option <c:if test="${student.grade=='高三'}">selected="selected"</c:if>>高三</option>
                    <option <c:if test="${student.grade=='成人'}"> selected="selected"</c:if>>成人</option>
                  </select>
              </div>
          </div>
            <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>信息来源:
              </label>
              <div class="layui-input-inline">
                  <select id="shipping" name="shipping" class="valid">
                   <option <c:if test="${student.infosource=='电话预约'}">selected="selected"</c:if>>电话预约</option>
                    <option <c:if test="${student.infosource=='网络预约'}">selected="selected"</c:if>>网络预约</option>
                    <option <c:if test="${student.infosource=='门店直访'}">selected="selected"</c:if>>门店直访</option>
                    <option <c:if test="${student.infosource=='市场专员'}">selected="selected"</c:if>>市场专员</option>
                   <option <c:if test="${student.infosource=='家长转介绍'}">selected="selected"</c:if>>家长转介绍</option>
                  </select>
              </div>
           </div>
          <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>监护人:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="phone" name="phone" required=""
                  autocomplete="off" class="layui-input" value="${student.guardian}">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>监护人电话:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="username" name="username" required="" lay-verify="phone"
                  autocomplete="off" class="layui-input" value="${student.gdphone}">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>预订小时数:
              </label>
              <div class="layui-input-inline">
                  <input type="text" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" id="orderhour">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>小时单价:
              </label>
              <div class="layui-input-inline">
                  <input type="text" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" id="price">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>授课开始日期:
              </label>
              <div class="layui-input-inline">
                  <input class="layui-input" name="start" id="start">
              </div>
          </div>
            <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>授课结束日期:
              </label>
              <div class="layui-input-inline">
                  <input class="layui-input" name="end" id="end">
              </div>
          </div>
              <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>加入班级:
              </label>
              <div class="layui-input-inline">
                  <select id="classlist" name="shipping" class="valid">
                  <c:forEach items="${classlist}" var="classinfo">
                     <option value="${classinfo.classid}">${classinfo.classname}</option>
                  </c:forEach>
                  </select>
              </div>
           </div>
            <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>授课课程名称:
              </label>
              <div class="layui-input-inline">
                  <select id="courselist" name="shipping" class="valid">
                  <c:forEach items="${list}" var="course">
                     <option value="${course.courseid}">${course.coursename}</option>
                  </c:forEach>
                  </select>
              </div>
           </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>教学点:
              </label>
              <div class="layui-input-inline">
                  <input type="text"  name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" id="teachplace">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>交款方式:
              </label>
              <div class="layui-input-inline">
                  <select name="contrller" id="payment">
                  <option>支付宝</option>
                  <option>微信</option>
                  <option>现金</option>
                  <option>刷卡</option>
                  </select>
              </div>
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>尾款交付日期:
              </label>
              <div class="layui-input-inline">
                  <input class="layui-input" name="start" id="end2">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>合同总金额:
              </label>
              <div class="layui-input-inline">
                  <input type="text" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" id="totalamount">
              </div>
          </div>
          <div class="layui-form-item layui-form-text">
              <label for="desc" class="layui-form-label">
                  备注:
              </label>
              <div class="layui-input-block">
                  <textarea placeholder="请输入内容" id="desc" name="desc" class="layui-textarea"></textarea>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <input type="submit" class="layui-btn" lay-filter="add" lay-submit="" value="新签合同">
          </div>
      </form>
    </div>
     <script>
   var flag=0;
    layui.use( ['laydate','form'],function(){
        var laydate = layui.laydate,form = layui.form;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
        
         //执行一个laydate实例
        laydate.render({
          elem: '#end2' //指定元素
        });
        
        //表单提交
        form.on('submit(add)', function(data) {
					$.ajax({
						url : 'ContractinServlet.action?op=addContractin',
						method : 'post',
						data:{
						    "contractnumber":$("#contractnumber").val(),
						    "contracttype":$("#contracttype").val(),
						    "studentid":$("#stuid").val(),
						    "orderhour":$("#orderhour").val(),
						    "price":$("#price").val(),
						    "teachstart":$("#start").val(),
						    "teachend":$("#end").val(),
						    "classid":$("#classlist").val(),
						    "courseid":$("#courselist").val(),
						    "teachplace":$("#teachplace").val(),
						    "payment":$("#payment").val(),
						    "deliverdate":$("#end2").val(),
						    "totalamount":$("#totalamount").val(),
						},
						success : function(data) {
							if (data == -1) {
								  layer.open({
                                 title: '信息'
                                 ,content: '报名失败'
                              });   
							}
							if (data == 1) {
								window.parent.location.reload(); //刷新父页面

								var index = parent.layer
										.getFrameIndex(window.name); //获取窗口索引
								parent.layer.close(index); // 关闭layer
							}
						}
					});
					return false;
				});
      });
    </script>
  </body>

</html>