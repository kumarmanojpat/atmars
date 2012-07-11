<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@page import="org.atmars.dao.User"%>
<%
	java.util.List<User> userList=(java.util.List<User>) session.getAttribute("userList");
%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<!-- TemplateBeginEditable name="doctitle" -->
<title>Welcome to Atmars</title>
<!-- TemplateEndEditable -->
<!-- TemplateBeginEditable name="head" -->
<!-- TemplateEndEditable -->
<style type="text/css">
<!--
body {
	font-family:Arial, Helvetica, sans-serif;
	background:#A1E0E9;
	padding: 0;
	color: #000;
}

/* ~~ Element/tag selectors ~~ */
ul, ol, dl { /* Due to variations between browsers, it's best practices to zero padding and margin on lists. For consistency, you can either specify the amounts you want here, or on the list items (LI, DT, DD) they contain. Remember that what you do here will cascade to the .nav list unless you write a more specific selector. */
	padding: 0;
	margin: 0;
}
h1, h2, h3, h4, h5, h6, p {
	margin-top: 0;	 /* removing the top margin gets around an issue where margins can escape from their containing div. The remaining bottom margin will hold it away from any elements that follow. */
	padding-right: 15px;
	padding-left: 15px; /* adding the padding to the sides of the elements within the divs, instead of the divs themselves, gets rid of any box model math. A nested div with side padding can also be used as an alternate method. */
}
a img { /* this selector removes the default blue border displayed in some browsers around an image when it is surrounded by a link */
	border: none;
}

/* ~~ Styling for your site's links must remain in this order - including the group of selectors that create the hover effect. ~~ */
a:link {
	color:#414958;
	text-decoration: none; /* unless you style your links to look extremely unique, it's best to provide underlines for quick visual identification */
}
a:visited {
	color: #4E5869;
	text-decoration: underline;
}
a:hover, a:active, a:focus { /* this group of selectors will give a keyboard navigator the same hover experience as the person using a mouse. */
	text-decoration: underline;
}

/* ~~ this container surrounds all other divs giving them their percentage-based width ~~ */
.container {
	width: 70%;
	max-width: 1260px;/* a max-width may be desirable to keep this layout from getting too wide on a large monitor. This keeps line length more readable. IE6 does not respect this declaration. */
	min-width: 780px;/* a min-width may be desirable to keep this layout from getting too narrow. This keeps line length more readable in the side columns. IE6 does not respect this declaration. */
	background:#FFF ;
	margin: 0 auto;
	margin-top:0px;
	/* the auto value on the sides, coupled with the width, centers the layout. It is not needed if you set the .container's width to 100%. */
	background: #A1E0E9;
	position:relative;
	
}

/* ~~the header is not given a width. It will extend the full width of your layout. It contains an image placeholder that should be replaced with your own linked logo~~ */
.img {
	background:#06C;
	height:200px;
	width:666px;
}


/* ~~ This is the layout information. ~~ 

1) Padding is only placed on the top and/or bottom of the div. The elements within this div have padding on their sides. This saves you from any "box model math". Keep in mind, if you add any side padding or border to the div itself, it will be added to the width you define to create the *total* width. You may also choose to remove the padding on the element in the div and place a second div within it with no width and the padding necessary for your design.

*/
.content {
	padding: 10px 0;
	background:#fff;
	height:auto;
}

/* ~~ This grouped selector gives the lists in the .content area space ~~ */


/* ~~ The footer ~~ */
.footer {
	padding: 10px 0;
	background: #D2F1F6;
    border-bottom-right-radius: 8px;
    border-bottom-left-radius: 8px;
    box-shadow: 0 1px 3px rgba(0,0,0,.35);
}

/* ~~ miscellaneous float/clear classes ~~ */
.fltrt {  /* this class can be used to float an element right in your page. The floated element must precede the element it should be next to on the page. */
	float: right;
	margin-left: 8px;
}
.fltlft { /* this class can be used to float an element left in your page. The floated element must precede the element it should be next to on the page. */
	float: left;
	margin-right: 8px;
}
.clearfloat { /* this class can be placed on a <br /> or empty div as the final element following the last floated div (within the #container) if the #footer is removed or taken out of the #container */
	clear:both;
	height:0;
	font-size: 1px;
	line-height: 0px;
}

.logo{
	margin-top:0px;
	margin-left:18px;
	height:88px;
	width:160px;
}
.login{
	width: 267px;
	height: 350px;
	padding-right: 3px;
	position: absolute;
	right: 0px;
	top: 92px;
	background-image:url(weibo-img/login.png);
	border-bottom-left-radius:4px;
}
.login .registerbt{
	width:210px;
	height:50px;
	margin:40px 0px 0px 32px;
	font-family:Arial, Helvetica, sans-serif;
	font-size:28px;
	background:#80c50c;
	background-position:center;
	color:#fff;
	border:0;
	border-radius: 8px;
    box-shadow: 0 1px 3px rgba(0,0,0,.35);
}

.login .registerbt:active{
	color:#CCCCCC;
	margin:margin:42px 0px 0px 34px;
}

.login .loginbt{
	width:100px;
	height:30px;
	margin:20px 0px 0px 32px;
	font-family:Arial, Helvetica, sans-serif;
	font-size:18px;
	background:#80c50c;
	background-position:center;
	color:#fff;
	border:0;
	border-radius: 3px;
    box-shadow: 0 1px 3px rgba(0,0,0,.35);
}

.login .loginbt:active{
	color:#cccccc;
	margin:22px 0px 0px 34px;
}

.login .textinp{
	color:#000;
	border:medium solid #ddd;
	border-width:thin;
	margin:10px 0 0 28px;
	height:36px;
	line-height:28px;
	background:#FFF;
	width:210px;
	font-size:18px;
}

.tList_mdu1 {
	width: 224px;
	height:570px;
	border-right: 1px solid #EBEBEB;
	padding: 0 0 0 24px;
	overflow: hidden;
	float: left;
}



.mainlist {
	width: 230px;
	overflow: hidden;
	float: left;
	display: inline;
	margin-bottom: 15px;
}
.mainlist dt {
	background:url(weibo-img/say.png)  no-repeat left 4px;
	line-height: 50px;
	padding: 0 0 0px 38px;
	border-bottom: 1px solid #EBEBEB;
	margin-right: 24px;
	font-size:13px;
}

ul {
	display: block;
	list-style-type: disc;
	left:
}

li {
	float: left;
	text-align: center;
	padding: 11px 0 0 0;
	width: 60px;
	margin-right: 10px;
	overflow: hidden;
	text-align: center;
	height: 80px;
	list-style:none;
}

.person_img{
	width:50px;
	height:50px;
}

.person_name{
	font-size:8px;
}



.tList_mdu2 {
	height: 570px;
	width: 420px;
	overflow: hidden;
	position: relative;
	float: left;
}

.twit_list {
	margin: 0 0 0 27px;
	width: 394px;
	overflow: hidden;
	float: left;
	display: inline;
}

.twit_list dt {
	background:url(weibo-img/bubble.png) no-repeat left 4px;
	line-height: 50px;
	padding: 0 0 0px 45px;
	border-bottom: 1px solid #EBEBEB;
	margin-right: 12px;
	font-size:13px;
}

.item{
}

dd{
	margin:0;
	padding:0;
}

.twit_list dd .twit_item {
	overflow: hidden;
	zoom: 1;
	font-size: 12px;
	padding: 10px 0;
}

.twit_list dd .twit_item_pic {
	float: left;
	width: 66px;
	padding-top: 2px;
}

.twit_list dd .twit_item_img{
	width:66px;
	height:66px;
}
.twit_list dd .twit_item_content {
	float: left;
	width: 300px;
	color: #666;
	line-height: 18px;
	margin-left:10px;
	word-wrap:break-word;
	
}

.twit_list dd .twit_item_name{
	color:#2947ED;
	text-decoration:none;
}

.twit_list dd .twit_item_time {
	width: 260px;
	color: #999;
	line-height: 20px;
}

.twit_list .bottomcover {
	position: absolute;
	bottom: 19px;
	background:url(weibo-img/halftransp.png) no-repeat 0 -5px;
	height: 35px;
	width: 394px;
	background: none;
	pointer-events: none;
}


.maincontent{
	overflow:hidden;
}


.container .filter{
	position:absolute;
	top:117px;
	height:50px;
	background:-webkit-gradient(linear, left top, left bottom, from(#D2F1F6), to(#fff));
	width: 100%;
	border-top-left-radius: 8px;
    border-top-right-radius: 8px;
}

.prompt_wrong{
	padding-left:10px;
	color:#333333;
	font-size:13px; 
	border:1px solid #999;
	word-wrap:break-word;
	padding-right:10px;
	display:none;
	margin-top:3px;
	box-shadow:0 1px 3px rgba(0,0,0,0.45);
	background-color:#FFECEC;
	margin-left:32px;
	margin-top:16px;
	width:190px;
	border-radius:4px;
}

.login_wrong{
	padding-left:10px;
	color:#FF0000;
	font-size:13px; 
	border:1px solid #999;
	word-wrap:break-word;
	padding-right:10px;
	margin-top:3px;
	box-shadow:0 1px 3px rgba(0,0,0,0.45);
	background-color:#FFECEC;
	margin-left:32px;
	margin-top:16px;
	width:190px;
	border-radius:4px;
}

-->
</style></head>


<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
   
   function initialize(){
	  $.get("init_weiboQiang.action",null,function(result){
		  var response = result;
		  var newMsg = response.new_Messages;
		  var listr =document.getElementById("listr");
		  for(var i = 1; i<newMsg.length; i++){
				   var str='<div class="item"><div class="twit_item"><div class="twit_item_pic"><a href="#"><img src="'+newMsg[i].user.image+'" class="twit_item_img"></a></div><div class="twit_item_content"><a href="#" class="twit_item_name">'+newMsg[i].user.nickname+':</a>'+newMsg[i].text+'<div class="twit_item_time">'+newMsg[i].timeDescription+'</div></div></div></div>';
				   listr.innerHTML= listr.innerHTML+str;
			  }
			  setTimeout("setInterval('weiboqiang()',5000)",10);
	   });
  }
  
  var ifrequest=0;
  var newestmessage=-2;
  var time;
  function weiboqiang(){
	 var listr=document.getElementById("listr");
	  var top=listr.offsetTop;
		  $.get("getNewestMessage.action?currentNewestMessageId="+newestmessage,null,function(result){
				  var response=result;
				  if(response.newestMessage_Now.newestState==true){
				  newestmessage=response.newestMessage_Now.messageId;
				  var str='<div class="twit_item"><div class="twit_item_pic"><a href="#"><img src="'+response.newestMessage_Now.user.image+'" class="twit_item_img"></a></div><div class="twit_item_content"><a href="#" class="twit_item_name">'+response.newestMessage_Now.user.nickname+':</a>'+response.newestMessage_Now.text+'<div class="twit_item_time">'+response.newestMessage_Now.timeDescription+'</div></div></div>';

				  
				  var firstitem=document.createElement("div");
			      firstitem.className="item";
				  firstitem.innerHTML=str;
			      
				  listr.insertBefore(firstitem,listr.firstChild);
				  if(listr.childNodes.length>8){
					  listr.removeChild(listr.lastChild);
				  }
				  top=0-listr.firstChild.offsetHeight;
				  listr.style.top=top+"px";
				  $("#listr").animate({top:0},3000);
				  }
				  
		  });
  }
  
 
  function email_text_onfocus(){
		var email=document.getElementById("email");
		email.placeholder="";
  }
  
  function password_text_onfocus(){
		var email=document.getElementById("password");
		email.placeholder="";
  }
	
	function checkemail(str){
		var Expression=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/; 
		var objExp = new RegExp(Expression);
		if(objExp.test(str)==true){
		 return true;
		}else{
		return false;
		}
	}
	
	function email_text_onblur(){
		var email=document.getElementById("email");
		var proemail=document.getElementById("proemail");
		if(checkemail(email.value)==false){
			proemail.className="prompt_wrong";
			proemail.style.color="#FF0000";
			proemail.style.paddingTop="10px";
			proemail.style.paddingBottom="10px";
			proemail.innerHTML="Enter your currect email";
			proemail.style.display="block";
		}
		else{
			proemail.style.display="none";
		}
		
	}
</script>
<body onLoad="initialize()">
  
<div class="container">
  <img src="weibo-img/logo.png" class="logo" />
  <div class="img"> 
    <img src="weibo-img/poster.png" width="100%" height="100%"/>
  </div>

  <div class="content">
     <div class="tList_mdu1">
       <dl class="mainlist">
          <dt>People who are using mars</dt>
       </dl>
       <dd>
         <ul id="userlist">
         
         <%int i=0;
         int count=9;
         if(userList.size()<9)
            { count=userList.size(); }
            while(i<count)
         {
          %>
         
          <li ><a href="javascript:void(0)"><img src="<%=((User) userList.get(i)).getImage()%>" class="person_img" ></a><a href="userpage?hisId=<%=((User) userList.get(i)).getUserId() %>" class="person_name"><%=((User) userList.get(i)).getNickname()%></a> </li>
          <% 
          i++;
          }
           %>
         
         
         
         </ul>
       </dd>
    </div>
    
    <div class="tList_mdu2">
        <dl class="twit_list">
           <dt>what are they talking about</dt>
           <dd style="position:relative; height:550px; overflow:hidden">
           <div class="bottomcover" style="z-index:2"></div>
           <div id="listr" class="maincontent" style="position:relative">
           
           </div>
        </dl>
     </div>    
     <div style="clear:both"></div>
  </div>
 
   <div class="login">
   <a href="register.jsp"><button class="registerbt">Register Now</button></a>
    <form name="form1" method="post" action="performLogin">
      <table width="267" border="0"  style="margin-top:20px">
        <tr>
          <td><label for="username">
            <input name="email" type="text" class="textinp" id="email" size="30" maxlength="20" placeholder="Email" onBlur="email_text_onblur()" onFocus="email_text_onfocus()" style="color:#333333">
          </label></td>
        </tr>
        <tr>
          <td><label for="password">
            <input name="password" type="password" class="textinp" id="password" size="30" maxlength="20" onFocus="password_text_onfocus()" placeholder="Password" style="color:#333333">
          </label></td>
        </tr>
      </table>
      <%
      	if(session.getAttribute("error")==null)
      	{
       %>
      <div id="proemail" class="prompt_wrong"></div>
      <%
      	}
       %>
       <%
       		if(session.getAttribute("error")!=null)
       		{
        %>
     	 <div id="proemail" class="login_wrong">Sorry, the account with this keycode was not found.</div>
      <%
      	}
       %>
      <input type="submit" name="login" id="login" value="Login" class="loginbt">
      
    </form>
     
  </div>
  <div class="footer">
  <!-- end .footer --></div>
<!-- end .container --></div>
</body>
</html>
