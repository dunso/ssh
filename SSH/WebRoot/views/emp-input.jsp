<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%-- <%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%> --%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'success.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-2.2.0.js"></script>
	<script type="text/javascript">
		$(function(){
			$(":input[name=lastName]").change(function(){
				var value = $(this).val();			
				value = $.trim(value);
				var $this = $(this);
				if(value != ""){
					//把当前节点后面的所有font兄弟节点删除
					$this.nextAll("font").remove();
					var url = "emp-validateLastName";
					var args = {"lastName":value,"time":new Date()};
					$.post(url,args,function(data){
						if(data == "1"){
							$this.after("<font color='green'>LastName可用！</font>");
						}else if(data == "0"){
							$this.after("<font color='red'>LastName不可用！</font>");
						}else{
							$this.after("服务器错误！");
						}
					});
				}else{
					alert("lastName不能为空！");
					this.focus();
				}
			});
		})
	</script>
  </head>
  
  <body>
    <h1><center> Employee Input Page </center></h1> <br/><br/>
    <center>
    <s:form action="emp-save" method="post"> 
   	 	<s:if test="id != null">
    	<s:textfield name="lastName" label="LastName" disabled="true"></s:textfield>
    	<s:hidden name="id"></s:hidden>
    	</s:if>
    	<s:else>
    	<s:textfield name="lastName" label="LastName"></s:textfield>
    	</s:else>
    	<s:textfield name="email" label="Email"></s:textfield>
    	<s:textfield name="birth" label="Birth"></s:textfield>
		<s:select list="#request.departments" 
			listKey="id" listValue="departmentName" 
			name="department.id" label="Department">
		</s:select>
		<s:submit></s:submit>
    </s:form>
    </center>
  </body>
</html>
