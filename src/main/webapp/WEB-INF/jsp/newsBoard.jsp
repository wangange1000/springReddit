<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发表新闻页面</title>
<script src="${path}/static/jquery-3.1.1.min.js"></script>
</head>

<body background="img/f.jpg">
<form id="news" action="${path}/newsBoard/add" method="post">
<table border="0" width="400" cellpadding="2" align="center">
<tr valign="middle" align="left">
<td>
<table border="0" cellpadding="2" align="left">
<tr valign="middle" align="left">
<td>发表人：</td><td><input id="postedBy" type="text" name="postedBy" size="33"></td>
<tr valign="middle" align="left">
<td>发表人邮箱：</td><td><input id="email" type="text" name="email" size="33"></td>
</tr>
<tr valign="middle" align="left">
<td>新闻标题：</td><td><input id="newsTitle" type="text" name="newsTitle" size="33"></td>
</tr>
</table>
</td>
</tr>
<tr valign="middle" align="left">
<td>
<table border="0" cellpadding="2" align="left">
<tr valign="middle" align="left">
<td>新闻概述：   （请不要超过120字）</td>
</tr>
<tr valign="middle" align="left">
<td>
<textarea id="content" name="content" rows="8" cols="50" style="background-color:#F5F5F5">
</textarea>
</td>
</tr>
</table>
</td>
</tr>
<tr valign="middle" align="left">
<td>
<table border="0" width="80%" cellpadding="2" align="right">
<tr valign="middle" align="right">
<td><input id="submitBtn" type="button" value="提交" onclick="Submit();"> <input type="reset" value="清空"></td>
</tr>
</table>
<tr valign="middle" align="left">
<td>
<hr align="left" size="5" color="blue">
</td>
</tr>
<tr valign="middle" align="left">
<td><h3>已发表的新闻列表如下：</h3></td>
</tr>
</table>
<table border="0" width="500" cellpadding="5" align="center">
<tr valign="middle">
<th>编号</th><th>标题</th><th>发表人</th><th>发表日期</th>
</tr>

<c:forEach items="${news}" var="newsA">
   <tr id="newA-${newA.id}" valign="middle">
   <td align="center" width="42" style="background-color:#FFD700">
   [<a href="${path}/commentBoard/comment?newsId=${newsA.id}">${newsA.id}</a>]
   </td>
   <td align="center">${newsA.newsTitle}</td>
   <td align="center">${newsA.postedBy}</td>
   <td align="center" width="150">${newsA.dateCreated}</td>
   </tr>
</c:forEach>

</table>
</form>
<script type="text/javascript">
	var news = document.getElementById("news");
	var Email = document.getElementById("email");
	
	var reg =/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
	
	// var Regular = /^[\w]+@((qq)|(126)|(163)|(yahoo)|(gmail)|(sina)|(msn)|(hotmail)|(live)|(sohu))\.((com)|(net)|(com.cn)|(cn)|(TW)|(com.hk)|(HK))$/g;
	var Submit = function () {
		if(document.getElementById("postedBy").value==""){
			alert("用户名不能为空！");
			return;
		}else if(Email.value==""){
			alert("邮箱不能为空！");
			return;
		}else if(!reg.test(Email.value)){
			alert("请输入正确格式的邮箱！");
			return;
		}else if(document.getElementById("newsTitle").value==""){
			alert("请输入新闻标题！");
			return;
		}else if(document.getElementById("content").value==""){
			alert("请输入新闻内容！");
			return;
		}else if(document.getElementById("content").value.length>120){
			alert("提交的新闻概述不能超过120字！");
			return;
		}
		var r = confirm('您确定要发表新闻吗？');
        if(r){
        	news.submit();
        }
	} 
</script>
</body>
</html>