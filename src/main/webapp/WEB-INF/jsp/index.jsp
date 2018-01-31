<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF8">
    <meta http-equiv="refresh" content="3; url=newsBoard" />
    <title>跳转进入应用</title>
</head>
<body>
<h2 style="background-color:#FF83FA">
    等待网页重定向到/News!
</h2><br>
<p>
    服务器时间：<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss"/>
</p>
</body>
</html>
