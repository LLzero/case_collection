<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<style>
.header_li {
	margin-left: 20px;
}

.header_li>a {
	padding: 5px;
}

.header_btn {
	cursor: pointer;
}

.selectStore {
	width: 99%;
	height: 35px;
	margin-top: 3px;
}
tabbable {
    height:100%;
}
.tab-content {
    height:100%;
    padding:15px 0px;
}
.tab-pane {
    height:99%;
}

#inputStore {
	line-height: 17px;
	margin-top: -5px;
}

.selectStoreIcon {
	margin-top: 5px;
}

.msg {
    border : 1px;
}

#logout {
	text-decoration: none;
	color: #393939;
}
.trans_to_pro {
    margin-left:20px;
    font-size:1px;
}

</style>
<script src="${ctx}/static/scripts/talk/socket.io.js"></script>
<script src="${ctx}/static/scripts/talk/client.js"></script>

<!-- #section:basics/navbar.layout -->
<div class="navbar navbar-default" id="navbar">
	<script type="text/javascript">
		try {
			ace.settings.check('navbar', 'fixed')
		} catch (e) {
		}

	</script>
    <input type="hidden" id="id" value="${user.id}">
    <input type="hidden" id="name" value="${user.name}">
    <input type="hidden" id="index_dataLevel" value="${user.dataLevel}">
	<div id="navbar-container" class="navbar-container">
		<div class="navbar-header pull-left">
			<!-- #section:basics/navbar.layout.brand -->
			<a class="navbar-brand" href="#"> <small> <i
					class="fa fa-leaf"></i>中华医学会心血管分会代谢学组病例收集系统
			</small>
			</a>
		</div>
		<!-- #section:basics/navbar.dropdown -->
		<div role="navigation" class="navbar-buttons navbar-header pull-right">
			<ul class="nav ace-nav" style="margin-top: 20px;">
                <li class="header_li" style="border-left: 0px;">${currentDate}</li>
				<li class="header_li" style="border-left: 0px;">${day}</li>
				<li class="header_li" style="border-left: 0px;">
					<div class="" onclick="">
						<i class="glyphicon glyphicon-user"></i>&nbsp; ${user.name}
					</div>
				</li>

				<li class="header_li" style="border-left: 0px;">
					<div class="header_btn" id="logout">
						<i class="fa fa-sign-out"></i> <a href="${ctx}/logout"
							style="color: #393939">退出登录</a>
					</div>
				</li>
			</ul>
		</div>
	</div>

</div>
<a class="btn-scroll-up btn btn-sm btn-inverse display"
	id="btn-scroll-up" href="#"> <i
	class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
</a>