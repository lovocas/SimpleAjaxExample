<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>MyHtml.html</title>

		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="this is my page">

		<!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
		<script type="text/javascript">
	function getResult(stateVal) {
		var url = "SelectServlet?state=" + stateVal;
		if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (req) {
			req.open("GET", url, true);
			req.onreadystatechange = complete;
			req.send(null);
		}
	}
	function complete() {
		if (req.readyState == 4) {
			if (req.status == 200) {
				var city = req.responseXML.getElementsByTagName("city");
				alert(city.length);
				var str = new Array();
				for ( var i = 0; i < city.length; i++) {
					str[i] = city[i].firstChild.data;
				}
				alert(document.getElementById("city"));
				buildSelect(str, document.getElementById("city"));
			}
		}
	}
	function buildSelect(str, sel) {
		sel.options.length = 0;
		for ( var i = 0; i < str.length; i++) {
			sel.options[sel.options.length] = new Option(str[i], str[i])
		}
	}
</script>

	</head>

	<body>
		<select name="state" onChange="getResult(this.value)">
			<option value="">
				Select
			</option>
			<option value="zj">
				ZEHJIANG
			</option>
			<option value="zs">
				JIANGSU
			</option>
		</select>
		<select id="city">
			<option value="">
				CITY
			</option>
		</select>
	</body>
</html>