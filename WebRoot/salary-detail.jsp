<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>工资详细-X-admin2.0</title>
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
    <div class="x-body">
      
         
          <div class="layui-form-item layui-form-text">
          
              <div class="layui-input-block" style="margin-right: 80px;">
                  <table class="layui-table">
                  	<thead>
                  		<th>序号</th>
                        <th>工号</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>年龄</th>
                        <th>所在教学点</th>
                        <th>身份证号</th>
                        <th>课程</th>
                        
                        <th>授课年级</th>
                        <th>授课小时</th>
                        <th>小时工资</th>
                        <th>罚款</th>
                        <th>教师工资</th>
                        <th>合计工资</th>
                        <th>结算日期</th>
                  	</thead>
                    <tbody>
                      <tr>
                        <td>1</div></td>
                        <td>营口路小学</div></td>
                        <td>韩梅梅</div></td>
                        <td>421127198009130121</td>
                        <td>10010</td>
                        <td>小明</td>
                        <td>四年级</td>
                        <td>80</td>
                        <td>4</td>
                        <td>语文</td>
                        <td>2018-3-10</td>
                        <td>18:00</td>
                        <td>20:00</td>
                      </tr>
                      <tr>
                         <td>2</div></td>
                        <td>营口路小学</div></td>
                        <td>韩梅梅</div></td>
                        <td>421127198009130121</td>
                        <td>10010</td>
                        <td>小明</td>
                        <td>四年级</td>
                        <td>80</td>
                        <td>4</td>
                        <td>语文</td>
                        <td>2018-3-10</td>
                        <td>18:00</td>
                        <td>20:00</td>
                      </tr>
                    </tbody>
                  </table>
              </div>
          </div>

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
    <script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();</script>
  </body>

</html>