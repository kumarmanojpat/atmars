<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
response.setStatus(200);
response.setHeader("refresh","5;URL=homepage");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>AtMars Info</title>
<link rel="stylesheet" type="text/css" href="css/info.css">
</head>

<body>
<div class="cloud"></div>
<div class="container">
  <div class="filter"></div>
  <div class="header"> <img src="register-img/register.png" width="917" class="register"/>
    <!-- end .header --></div>
    
  <div style="top:0; height:117px; background-color:#A1E0E9"></div>
  <div class="content">
  	<div style="margin-top:100px; margin-left:50px; margin-right:50px; margin-bottom:80px;">
    <div style="float:left"><img src="error-img/error.png" /></div>
    <div style="float:left; line-height:80px; font-family:'Comic Sans MS', cursive; font-size:36px">&nbsp;&nbsp; The e-mail confirm failed<br></div>
    <div style="float:left; margin-left:80px; margin-right:80px; font-family:'Comic Sans MS', cursive;">
    <p>&nbsp;&nbsp;&nbsp;&nbsp;the confirm URL is no longer valid.please try to register again.<br /><br />this page willredirect to homepage in 5 seconds...</p>
    </div>
    <div style="clear:left"></div>
    </div>

  </div>
  <div class="footer">
    <p>&nbsp;</p>
  <!-- end .footer --></div>
<!-- end .container --></div>
</body>
</html>

