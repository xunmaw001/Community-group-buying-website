<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!-- 收货地址 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>收货地址</title>
		<link rel="stylesheet" href="../../layui/css/layui.css">
		<!-- 样式 -->
		<link rel="stylesheet" href="../../css/style.css" />
		<!-- 主题（主要颜色设置） -->
		<link rel="stylesheet" href="../../css/theme.css" />
		<!-- 通用的css -->
		<link rel="stylesheet" href="../../css/common.css" />
	</head>
	<style>
		#swiper {
			overflow: hidden;
		}
		#swiper .layui-carousel-ind li {
			width: 16px;
			height: 10px;
			border-width: 0;
			border-style: solid;
			border-color: rgba(0,0,0,.3);
			border-radius: 3px;
			background-color: #f7f7f7;
			box-shadow: 0 0 6px #c2c2c2;
		}
		#swiper .layui-carousel-ind li.layui-this {
			width: 34px;
			height: 10px;
			border-width: 0;
			border-style: solid;
			border-color: rgba(0,0,0,.3);
			border-radius: 10px;
			background-color: rgba(142, 182, 160, 1);
			box-shadow: 0 0 6px #c2c2c2;
		}
		
		.index-title {
		    text-align: center;
		    box-sizing: border-box;
		    width: 980px;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    flex-direction: column;
		}
		
		.layui-laypage .layui-laypage-count {
		  padding: 0 10px;
		}
		.layui-laypage .layui-laypage-skip {
		  padding-left: 10px;
		}
		
		.center-container .layui-nav-tree {
			width: 100%;
		}
		.center-container .layui-nav {
			position: inherit;
		}
		.center-container .layui-nav-tree .layui-nav-item {
			height: 44px;
			line-height: 44px;
			font-size: 14px;
			color: rgba(0, 0, 0, 1);
			border-width: 0 0 1px;
			border-style: solid;
			border-color: rgba(195, 186, 186, 0.98);
			border-radius: 0;
			background-color: rgba(212, 232, 211, 1);
			box-shadow: 0 0 6px #d4e8d3;
			text-align: center;
		}
		.center-container .layui-nav-tree .layui-nav-bar {
			height: 44px !important;
			opacity: 0 !important;
		}
		.center-container .layui-nav-tree .layui-nav-item.layui-this {
			font-size: 14px;
			color: #fff;
			border-width: 0;
			border-style: solid;
			border-color: rgba(110,22,64,.3);
			border-radius: 0;
			background-color: rgba(142, 182, 160, 1);
			box-shadow: 0 0 6px rgba(255,0,0,0);
		}
		.center-container .layui-nav-tree .layui-nav-item:hover {
			font-size: 14px;
			color: #fff;
			border-width: 0;
			border-style: solid;
			border-color: rgba(110,22,64,.3);
			border-radius: 0;
			background-color: rgba(142, 182, 160, 1);
			box-shadow: 0 0 6px #8eb6a0;
		}
		.center-container .layui-nav-tree .layui-nav-item a {
			line-height: inherit;
			height: auto;
			background-color: inherit;
			color: inherit;
			text-decoration: none;
		}
		
		.right-container {
			position: relative;
		}
		
		.right-container .btn-container {
			display: flex;
			    align-items: center;
			    box-sizing: border-box;
			    width: 100%;
			    flex-wrap: wrap;
		}
		.right-container .btn-container button i {
			margin-right: 4px;
		}
	</style>
	<body style="background: #EEEEEE;">

		<div id="app">
			<!-- 轮播图 -->
			<div class="layui-carousel" id="swiper" :style='{"boxShadow":"0 0 0px rgba(110,22,64,.8)","margin":"0","borderColor":"rgba(0,0,0,.3)","borderRadius":"5px","borderWidth":"0","width":"100%","borderStyle":"solid"}'>
			  <div carousel-item id="swiper-item">
				<div v-for="(item,index) in swiperList" :key="index">
					<img style="width: 100%;height: 100%;object-fit:cover;" :src="item.img" />
				</div>
			  </div>
			</div>
			<!-- 轮播图 -->

			<!-- 标题 -->
			<div class="index-title" :style='{"padding":"10px","boxShadow":"0 0 0px rgba(110,22,64,.8)","margin":"10px auto","borderColor":"rgba(142, 182, 160, 1)","backgroundColor":"rgba(212, 232, 211, 1)","color":"rgba(0, 0, 0, 1)","borderRadius":"0","borderWidth":"0 0 0 15px","fontSize":"20px","borderStyle":"solid","height":"auto"}'>
			  <span>USER / ADDRESS</span><span>收货地址</span>
			</div>
			<!-- 标题 -->

			<div class="center-container">
				<!-- 个人中心菜单 config.js-->
				<div class="left-container" :style='{"padding":"0","boxShadow":"-1px 1px 6px #d4e8d3","margin":"0","borderColor":"rgba(212, 232, 211, 1)","backgroundColor":"rgba(212, 232, 211, 1)","borderRadius":"0","borderWidth":"0 0 1px 0","width":"160px","borderStyle":"solid"}'>
					<ul class="layui-nav layui-nav-tree">
						<li v-for="(item,index) in centerMenu" v-bind:key="index" class="layui-nav-item" :class="item.url=='../shop-address/list.jsp'?'layui-this':''">
							<a :href="'javascript:jump(\''+item.url+'\')'">{{item.name}}</a>
						</li>
					</ul>
				</div>
				<!-- 个人中心菜单 -->
				<div class="right-container" style="padding-top: 0;" :style='{"padding":"20px","boxShadow":"1px 1px 6px #D4E8D3","margin":"0","borderColor":"rgba(212, 232, 211, 1)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0","borderStyle":"solid"}'>
					<div class="btn-container" :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(110,22,64,.8)","margin":"10px 0 30px 0","borderColor":"rgba(212, 232, 211, 1)","backgroundColor":"rgba(255, 255, 255, 1)","borderRadius":"4px","borderWidth":"3px","borderStyle":"solid","justifyContent":"flex-end","height":"50px"}'>
						<button :style='{"padding":"0 15px","boxShadow":"0 0 0px rgba(0,0,0,0)","margin":"0 0 0 10px","borderColor":"#409EFF","backgroundColor":"rgba(142, 182, 160, 1)","color":"#fff","borderRadius":"0","borderWidth":"0","width":"auto","fontSize":"14px","borderStyle":"solid","height":"40px"}' id="btn-add" class="layui-btn layui-btn-lg btn-theme">
							<i v-if="true" class="layui-icon">&#xe654;</i> 添加新地址
						</button>
					</div>
					<table class="layui-table" lay-skin="nob">
						<thead>
							<tr>
								<th>联系人</th>
								<th>手机号码</th>
								<th>地址</th>
								<th>默认</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="(item,index) in dataList" v-bind:key="index">
								<td style="width: 80px;">{{item.name}}</td>
								<td style="width: 100px;">{{item.phone}}</td>
								<td>{{item.address}}</td>
								<td style="width: 50px;">{{item.isdefault}}</td>
								<td style="width: 150px;">
									<button @click="updateClick(item.id)" type="button" class="layui-btn layui-btn-radius layui-btn-sm layui-btn-warm">
										<i class="layui-icon">&#xe642;</i> 修改
									</button>
									<button @click="deleteClick(item.id)" type="button" class="layui-btn layui-btn-radius layui-btn-sm btn-theme">
										<i class="layui-icon">&#xe640;</i> 删除
									</button>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="pager" id="pager" :style="{textAlign:2==1?'left':2==2?'center':'right'}"></div>
				</div>
			</div>
		</div>

		<!-- layui -->
		<script src="../../layui/layui.js"></script>
		<!-- vue -->
		<script src="../../js/vue.js"></script>
		<!-- 组件配置信息 -->
		<script src="../../js/config.js"></script>
		<!-- 扩展插件配置信息 -->
		<script src="../../modules/config.js"></script>
		<!-- 工具方法 -->
		<script src="../../js/utils.js"></script>
		<!-- 校验格式工具类 -->
		<script src="../../js/validate.js"></script>

		<script>
			var vue = new Vue({
				el: '#app',
				data: {
					// 轮播图
					swiperList: [{
						img: '../../img/banner.jpg'
					}],
					dataList: [],
					centerMenu: centerMenu
				},
				methods: {
					jump(url) {
						jump(url)
					},
					deleteClick(id) {
						layui.layer.confirm('是否确认删除？', {
							btn: ['删除', '取消'] //按钮
						}, function() {
							layui.http.requestJson(`address/delete`, 'post', [id], function(res) {
								layer.msg('删除成功', {
									time: 2000,
									icon: 6
								}, function(res) {
									window.location.reload();
								});
							})
						});
					},
					updateClick(id) {
						window.location.href = './update.jsp?id=' + id;
					}
				}
			})

			layui.use(['layer', 'element', 'carousel', 'http', 'jquery', 'form', 'laypage'], function() {
				var layer = layui.layer;
				var element = layui.element;
				var carousel = layui.carousel;
				var http = layui.http;
				var jquery = layui.jquery;
				var laypage = layui.laypage;
				var form = layui.form;

				var limit = 10;

				// 获取轮播图 数据
				http.request('config/list', 'get', {
					page: 1,
					limit: 5
				}, function(res) {
					if (res.data.list.length > 0) {
						var swiperItemHtml = '';
						for (let item of res.data.list) {
							if (item.name.indexOf('picture') >= 0 && item.value && item.value != "" && item.value != null) {
								swiperItemHtml +=
									'<div>' +
									'<img class="swiper-item" style="width: 100%;height: 100%;object-fit:cover;" src="' + http.baseurl+item.value + '">' +
									'</div>';
							}
						}
						jquery('#swiper-item').html(swiperItemHtml);
						// 轮播图
						vue.$nextTick(() => {
						  carousel.render({
						  	elem: '#swiper',
							width: '100%',
						  	height: '400px',
						  	arrow: 'hover',
						  	anim: 'default',
						  	autoplay: 'true',
						  	interval: '3000',
						  	indicator: 'inside'
						  });
						
						})
					}
				});

				// 获取列表数据
				http.request('address/list', 'get', {
					page: 1,
					limit: limit,
					userid: localStorage.getItem('userid')
				}, function(res) {
					vue.dataList = res.data.list
					// 分页
					laypage.render({
						elem: 'pager',
						count: res.data.total,
						limit: limit,
						groups: 5,
						layout: ["prev","page","next"],
						theme: '#D4E8D3',
						jump: function(obj, first) {
							//首次不执行
							if (!first) {
								http.request('address/list', 'get', {
									page: obj.curr,
									limit: obj.limit,
									userid: localStorage.getItem('userid')
								}, function(res) {
									vue.dataList = res.data.list
								})
							}
						}
					});
				})

				// 添加地址
				jquery('#btn-add').click(function(e) {
					window.location.href = './add.jsp';
				});

			});
		</script>
	</body>
</html>
