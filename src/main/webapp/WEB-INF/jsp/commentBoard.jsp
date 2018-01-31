<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻详情页面</title>
<script src="${path}/static/jquery-3.1.1.min.js"></script>
</head>

<body background="${path}/img/g.jpg">
<table border="0" width="420" align="center">
<tr valign="middle" align="left">
<td width="130"><font size="4">新闻标题：</font></td><td><font size="4">${news.newsTitle}</font></td>
</tr>
<tr valign="middle" align="left">
<td width="130"><font size="4">发   表   人：</font></td><td><font size="4">${news.postedBy}</font></td>
</tr>
<tr valign="middle" align="left">
<td width="130"><font size="4">发表时间：</font></td><td><font size="4">${fn:substring(news.dateCreated, 0, 10)}</font></td>
</tr>
<tr valign="middle" align="left"><td><font size="4">新闻概述：</font></td></tr>
<tr valign="middle" align="left"><td>
<font size="5">------------</font></td></tr>
</table>
<table border="0" width="420" align="center">
<tr valign="top" align="left">
<td><font size="4">${news.content}</font></td>
</tr></table>

<form id="commentForm" action="${path}/commentBoard/add?newsId=${newsId}" method="post">
<table border="0" width="420" cellpadding="3" align="center">
<tr valign="middle" align="left">
<td>
<table border="0" cellpadding="2" align="left">
<tr valign="middle" align="left">
<td>评论人：</td><td><input id="follower" type="text" name="follower" size="36"></td>
<tr valign="middle" align="left">
<td>评论人邮箱：</td><td><input id="email" type="text" name="email" size="36"></td>
</tr>
</table>
</td>
</tr>
<tr valign="middle" align="left">
<td>
<table border="0" cellpadding="2" align="left">
<tr valign="middle" align="left">
<td>评  论：   （请不要超过120字）</td>
</tr>
<tr valign="middle" align="left">
<td>
<textarea id="commentary" name="commentary" rows="5" cols="54" style="background-color:#F5F5F5">
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
<td><h3>已发表的评论：</h3></td>
</tr>
</table>
</form>

<table border="0" width="460" cellpadding="2" align="center">
<tr valign="middle">
<th>编号</th><th>评论前20字</th><th>发表人</th><th>发表日期</th>
</tr>

    <c:forEach items="${comments}" var="comment">
        <tr id="dict-${comment.id}" valign="middle">
            <td align="center" width="42" style="background-color:#FF8274">${comment.id}</td>
            <td align="center">${fn:substring(comment.commentary, 0, 20)}</td>
            <td align="center">${comment.follower}</td>
            <td align="center" width="100">${fn:substring(comment.dateCreated, 0, 10)}</td>
        </tr>
     </c:forEach>

</table>

<script type="text/javascript">
	var commentForm = document.getElementById("commentForm");
	var Email = document.getElementById("email");
	var reg =/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
	// var Regular = /^[\w]+@((qq)|(126)|(163)|(yahoo)|(gmail)|(sina)|(msn)|(hotmail)|(live)|(sohu))\.((com)|(net)|(com.cn)|(.cn)|(.TW)|(com.hk)|(HK))$/g;
	
	var Submit = function () {
		if(document.getElementById("follower").value==""){
			alert("评论人不能为空！");
			return;
		}else if(Email.value==""){
			alert("邮箱不能为空！");
			return;
		}else if(!reg.test(Email.value)){
			alert("请输入正确格式的邮箱！");
			return;
		}else if(document.getElementById("commentary").value==""){
			alert("请输入评论内容！");
			return;
		}else if(document.getElementById("commentary").value.length>120){
			alert("提交的评论不能超过120字！");
			return;
		}
		var r = confirm('您确定要发表评论吗？');
        if(r){
        	commentForm.submit();
        }
	} 
</script>

</body>
</html>