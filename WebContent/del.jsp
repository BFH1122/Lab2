<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-3.2.1.min.js"></script>
<link href="easyui.css" rel="stylesheet" />
<link href="icon.css" rel="stylesheet" />
<script src="jquery.min.js"></script>
<script src="jquery.easyui.min.js"></script>
</head>
<body>
<div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
		closed="true" buttons="#dlg-buttons">
	<div class="ftitle">User Information</div>
	<form id="fm" method="post">
		<div class="fitem">
			<label>First Name:</label>
			<input name="firstname" class="easyui-validatebox" required="true">
		</div>
		<div class="fitem">
			<label>Last Name:</label>
			<input name="lastname" class="easyui-validatebox" required="true">
		</div>
		<div class="fitem">
			<label>Phone:</label>
			<input name="phone">
		</div>
		<div class="fitem">
			<label>Email:</label>
			<input name="email" class="easyui-validatebox" validType="email">
		</div>
	</form>
</div>
<div id="dlg-buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">Save</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">Cancel</a>
</div>
</body>
</html>