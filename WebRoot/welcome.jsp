<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>欢迎页面</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" href="./css/font.css">
		<link rel="stylesheet" href="./css/xadmin.css">
		<script type="text/javascript" src="js/echarts.min.js"></script>
		<script type="text/javascript" src="./js/jquery-2.1.4.min.js"></script>
	</head>

	<body>
		<div class="x-body">
			<blockquote class="layui-elem-quote">欢迎使用课外培训事务平台！系统数据统计如下:</blockquote>
			<div class="layui-col-md6">
				<div id="main" style="width: 400px;height:300px;"></div>
				<script type="text/javascript">
					// 基于准备好的dom，初始化echarts实例
					 $.ajax({
						 url:"ChartServlet.action?op=addBar",
						 dataType:"json",
						 method:"post",
						 success:function(data){
							  var categories = data.categories;
							 var values = data.values;
							 var myChart = echarts.init(document.getElementById('main'));
								// 指定图表的配置项和数据
								var option = {
									title: {
										text: '班级人数统计'
									},
									tooltip: {show:true},
									legend: {
										data: ['人数']
									},
									xAxis: {
										data: categories
									},
									yAxis: {},
									series: [{
										name: '人数',
										type: 'bar',
										data: values
									}]
								};

								// 使用刚指定的配置项和数据显示图表。
								myChart.setOption(option);
						 } 
					 });
				</script>

			</div>
			<!-- <div class="layui-col-md6">
				<div id="main1" style="width: 400px;height:300px;"></div>
				<script type="text/javascript">
					// 基于准备好的dom，初始化echarts实例
					var myChart = echarts.init(document.getElementById('main1'));
					option = {
						legend: {},
						tooltip: {},
						dataset: {
							// 这里指定了维度名的顺序，从而可以利用默认的维度到坐标轴的映射。
							// 如果不指定 dimensions，也可以通过指定 series.encode 完成映射，参见后文。
							dimensions: ['product', '2015', '2016', '2017'],
							source: [{
									product: 'Matcha Latte',
									'2015': 43.3,
									'2016': 85.8,
									'2017': 93.7
								},
								{
									product: 'Milk Tea',
									'2015': 83.1,
									'2016': 73.4,
									'2017': 55.1
								},
								{
									product: 'Cheese Cocoa',
									'2015': 86.4,
									'2016': 65.2,
									'2017': 82.5
								},
								{
									product: 'Walnut Brownie',
									'2015': 72.4,
									'2016': 53.9,
									'2017': 39.1
								}
							]
						},
						xAxis: {
							type: 'category'
						},
						yAxis: {},
						series: [{
								type: 'bar'
							},
							{
								type: 'bar'
							},
							{
								type: 'bar'
							}
						]
					};
					// 使用刚指定的配置项和数据显示图表。
					myChart.setOption(option);
				</script>
			</div> -->
			<div class="layui-col-md6">
				<div id="main2" style="width: 400px;height:300px;"></div>
				<script type="text/javascript">
				
				// 基于准备好的dom，初始化echarts实例
				 $.ajax({
					 url:"ChartServlet.action?op=addPie",
					 method:"post",
					 dataType:"json",
					 success:function(data){
						var  json = [  
					                {value:data[0],name:'电话预约'},  
					                {value:data[1],name:'网络预约'},
					                {value:data[2],name:'门店直访'},  
					                {value:data[3],name:'市场专员'},
					                {value:data[4],name:'家长转介绍'}   
					                ]; 
						addPie(json);
					 } 
				 });
				
				function addPie(json){
					var echartsPie;  
					   
				    var option = {  
				            title : {  
				                text: '学生信息来源情况统计',  
				                x:'center'  
				            },  
				            tooltip : {  
				                trigger: 'item',  
				                formatter: "{a} <br/>{b} : {c} ({d}%)"  
				            },  
				            legend: {  
				                orient : 'vertical',  
				                x : 'left',  
				                data:['电话预约','网络预约','门店直访','市场专员','家长转介绍']  
				            },  
				            toolbox: {  
				                show : true,  
				                feature : {  
				                    mark : {show: true},  
				                    dataView : {show: true, readOnly: false},  
				                    magicType : {  
				                        show: true,   
				                        type: ['pie', 'funnel'],  
				                        option: {  
				                            funnel: {  
				                                x: '25%',  
				                                width: '50%',  
				                                funnelAlign: 'left',  
				                                max: 1548  
				                            }  
				                        }  
				                    },  
				                    restore : {show: true},  
				                    saveAsImage : {show: true}  
				                }  
				            },  
				            calculable : true,  
				            series : [  
				                {    
				                	 name:'信息来源', 
				                    type:'pie',  
				                    radius : '55%',//饼图的半径大小  
				                    center: ['50%', '60%'],//饼图的位置  
				                    data:json  
				                }  
				            ]  
				        };   
				      
				    echartsPie = echarts.init(document.getElementById('main2'));  
				    $(function(){  
				        echartsPie.setOption(option);  
				    });    
				}
				 
				</script>
			</div>
		</div>
	</body>

</html>