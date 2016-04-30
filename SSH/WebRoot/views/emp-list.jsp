<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
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
    
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
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
			$(".delete").click(function(){
				var lastName = $(this).next(":hidden").val();
				var flag = confirm("确定要删除"+lastName+"的信息吗？");
				if(flag){
					var $tr = $(this).parent().parent();
					var url = this.href;
					var args = {"time":new Date()};
					$.post(url,args,function(data){
						if(data == "1"){
							alert("删除成功！");
							$tr.remove();
						}else{
							alert("删除失败！");
						}
					});
				}
				//取消超链接的默认行为
				return false;
			});
		})
	</script>
	
  </head>
  
  <body>
    <h1><center> Employee List Page </center></h1> <br/><br/>
    <center>

    <s:if test="#request.employees == null || #request.employees.size() == 0">
    	    没有任何员工信息
    </s:if>
    <s:else>
    	<table border="1" cellpadding="10" cellspacing="0">
    		<tr>
    			<th>ID</th>
    			<th>LASTNAME</th>
    			<th>EMAIL</th>
    			<th>BIRTH</th>
    			<th>CREATETIME</th>
    			<th>DEPT</th>
    			<th>DELETE</th>
    			<th>EDIT</th>
    		</tr>
    		<s:iterator value="#request.employees">
    			<tr>
    				<td>${id}</td>
    				<td>${lastName}</td>
    				<td>${email}</td>
    				<td>
    					<s:date name="birth" format="yyyy-MM-dd"/>
    				</td>
    				<td>
    					<s:date name="createTime" format="yyyy-MM-dd hh:mm:ss"/>
    				</td>
    				<td>${department.departmentName}</td>
    				<td>
    					<a href="emp-delete?id=${id}" class="delete">Delete</a>
    					<input type="hidden" value="${lastName }"/>
    				</td>
    				<td>
    					<a href="emp-input?id=${id}">Edit</a>
    				</td>
    			</tr>
    		</s:iterator>
    	</table>
    </s:else>
    
    
    
    
    
    
    
    </center>
  </body>
</html>
