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
    <div class="x-body">
        <form class="layui-form">
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>合同号:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="username" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${contractin.contractnumber}">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>学生姓名:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="username" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${contractin.studentname}">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>年级:
              </label>
              <div class="layui-input-inline">
                  <select id="shipping" name="shipping" class="valid">
                    <option <c:if test="${contractin.grade=='一年级'}">selected="selected"</c:if>>一年级</option>
                    <option <c:if test="${contractin.grade=='二年级'}">selected="selected"</c:if>>二年级</option>
                    <option <c:if test="${contractin.grade=='三年级'}">selected="selected"</c:if>>三年级</option>
                    <option <c:if test="${contractin.grade=='四年级'}"> selected="selected"</c:if>>四年级</option>
                    <option <c:if test="${contractin.grade=='五年级'}">selected="selected"</c:if>>五年级</option>
                    <option <c:if test="${contractin.grade=='六年级'}">selected="selected"</c:if>>六年级</option>
                    <option <c:if test="${contractin.grade=='初一'}">selected="selected"</c:if>>初一</option>
                    <option <c:if test="${contractin.grade=='初二'}">selected="selected"</c:if>>初二</option>
                    <option <c:if test="${contractin.grade=='初三'}">selected="selected"</c:if>>初三</option>
                    <option <c:if test="${contractin.grade=='高一'}">selected="selected"</c:if>>高一</option>
                    <option <c:if test="${contractin.grade=='高二'}">selected="selected"</c:if>>高二</option>
                    <option <c:if test="${contractin.grade=='高三'}">selected="selected"</c:if>>高三</option>
                    <option <c:if test="${contractin.grade=='成人'}"> selected="selected"</c:if>>成人</option>
                  </select>
              </div>
          </div>
            <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>信息来源:
              </label>
              <div class="layui-input-inline">
                  <select id="shipping" name="shipping" class="valid">
                  <option <c:if test="${contractin.infosource=='电话预约'}">selected="selected"</c:if>>电话预约</option>
                    <option <c:if test="${contractin.infosource=='网络预约'}">selected="selected"</c:if>>网络预约</option>
                    <option <c:if test="${contractin.infosource=='门店直访'}">selected="selected"</c:if>>门店直访</option>
                    <option <c:if test="${contractin.infosource=='市场专员'}">selected="selected"</c:if>>市场专员</option>
                   <option <c:if test="${contractin.infosource=='家长转介绍'}">selected="selected"</c:if>>家长转介绍</option>
                  </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>监护人:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="phone" name="phone" required="" lay-verify="phone"
                  autocomplete="off" class="layui-input" value="${contractin.guardian}">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>监护人手机:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="username" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${contractin.gdphone}">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>教学点:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="username" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${contractin.teachplace}">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>合同类型:
              </label>
              <div class="layui-input-inline">
                  <select name="contrller">
                   <option <c:if test="${contractin.contracttype=='一对一'}">selected="selected"</c:if>>一对一</option>
                    <option <c:if test="${contractin.contracttype=='小班'}">selected="selected"</c:if>>小班</option>
                    <option <c:if test="${contractin.contracttype=='作业吧'}">selected="selected"</c:if>>作业吧</option>
                    <option <c:if test="${contractin.contracttype=='出国游'}">selected="selected"</c:if>>出国游</option>
                   <option <c:if test="${contractin.contracttype=='训练营'}">selected="selected"</c:if>>训练营</option>
                   <option <c:if test="${contractin.contracttype=='合作办学'}">selected="selected"</c:if>>合作办学</option>
                  </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>预订小时数:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="username" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${contractin.orderhour}">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>小时单价:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="username" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${contractin.price}">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>授课开始日期:
              </label>
              <div class="layui-input-inline">
                  <input class="layui-input" name="start" id="start" value="<fmt:formatDate value="${contractin.teachstart}" pattern="yyyy-MM-dd"/>">
              </div>
          </div>
            <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>授课结束日期:
              </label>
              <div class="layui-input-inline">
                  <input class="layui-input" name="start" id="start" value="<fmt:formatDate value="${contractin.teachend}" pattern="yyyy-MM-dd"/>">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>授课课程名称:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="username" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${contractin.coursename}">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>交款方式:
              </label>
              <div class="layui-input-inline">
                  <select name="contrller">
                   <option>支付宝</option>
                  <option>微信</option>
                  <option>现金</option>
                  <option>刷卡</option>
                  <option <c:if test="${contractin.payment=='支付宝'}">selected="selected"</c:if>>支付宝</option>
                    <option <c:if test="${contractin.payment=='微信'}">selected="selected"</c:if>>微信</option>
                    <option <c:if test="${contractin.payment=='现金'}">selected="selected"</c:if>>现金</option>
                    <option <c:if test="${contractin.payment=='刷卡'}">selected="selected"</c:if>>刷卡</option>
                  </select>
              </div>
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>尾款交付日期:
              </label>
              <div class="layui-input-inline">
                  <input class="layui-input" name="start" id="start" value="<fmt:formatDate value="${contractin.deliverdate}" pattern="yyyy-MM-dd"/>">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>合同总金额:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="username" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${contractin.totalamount}">
              </div>
          </div>  
      </form>
    </div>
    <script>
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
        
          //自定义验证规则
          form.verify({
            nikename: function(value){
              if(value.length < 5){
                return '昵称至少得5个字符啊';
              }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return '两次密码不一致';
                }
            }
          });

          //监听提交
          form.on('submit(add)', function(data){
            console.log(data);
            //发异步，把数据提交给php
            layer.alert("增加成功", {icon: 6},function () {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
            });
            return false;
          });
          
          
        });
    </script>
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
    <script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();</script>
  </body>

</html>