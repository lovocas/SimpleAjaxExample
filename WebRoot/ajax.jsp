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
        <base href="<%=basePath%>">

        <title>Ajax test</title>

        <!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
        <script type="text/javascript">
	function ajaxSubmit() {
		//var url = "AjaxServlet?" + "value1="
		//		+ document.getElementById("vv1").value + "&value2="
		//		+ document.getElementById("vv2").value;

		var url = "AjaxServlet";
		//只要不是undifined就ik
		if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			//微软IE6
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (null != req) {
			req.open("POST", url, false);//true 表示以异步的方式

			req.onreadystatechange = comeback; //回调函数的方式，就是一个监听器
			//content-type" content="text/html; charset=UTF-8"
			req.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			req.send("value1=" + document.getElementById("vv1").value
					+ "&value2=" + document.getElementById("vv2").value);//post方式必须放入这里， get方式直接加之参数上
		}
	}
	function comeback() {
		//判断状态已经变成什么
		/*if (req.readyState == 4) {
		    if (req.status == 200) {
		        var bbbb = req.responseXML.getElementsByTagName("BODY");
		        document.getElementById("div1").innerHTML = bbbb[0].data;
		    }
		}*/

		if (req.readyState == 4) {
			if (req.status == 200) {
				var respText = req.responseText;
				document.getElementById("div1").innerHTML = respText;
			}
		}
	}
</script>
    </head>

    <body>
        <input type="button" value="我恨你" onclick="ajaxSubmit()">
        <br>
        <input type="text" id="vv1">
        <br>
        <input type="text" id="vv2">
        <br>
        <div id="div1"></div>
    </body>
</html>
