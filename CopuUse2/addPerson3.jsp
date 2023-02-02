<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	// 注意是取 request 參數而不是地址欄參數，因此用 getAttribute 方法而不是 getParameter
	String action = (String)request.getAttribute("action");

	String Aid = (String)request.getAttribute("Aid");
	String account = (String)request.getAttribute("account");
	String custpassword = (String)request.getAttribute("custpassword");
	
	// 是 增加頁面 還是 修改頁面，下文中根據此變數做相應的處理
	boolean isEdit = "edit".equals(action);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%= isEdit ? "修改人員資料" : "新增人員資料" %></title>
<link rel="icon" type="image/x-icon" href="../gray/assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->		
<link href="css/styles.css" rel="stylesheet" />
<style type="text/css">body, td{font-size:12px; }</style>
</head>
<body>

<script type="text/javascript" src="js/calendar.js"></script>

<form action="operatePerson3.jsp" method="post">

<input type="hidden" name="action" value="<%= isEdit ? "save" : "add" %>">

<fieldset>
	<legend><%= isEdit ? "修改人員資料" : "新增人員資料" %></legend>
	<table align=center>
		<tr>
			<td>id</td>
			<td><input type="text" name="Aid" value="<%= isEdit ? Aid : "" %>"/></td>
		</tr>
		<tr>
			<td>帳戶</td>
			<td><input type="text" name="account" value="<%= isEdit ? account : "" %>"/></td>
		</tr>
		<tr>
			<td>密碼</td>
			<td><input type="text" name="password"  value="<%= isEdit ? custpassword : "" %>"/></td>
		</tr>
			<td>
				<input type="submit" value="<%= isEdit ? "儲存" : "增加人員資訊" %>"/>
				<input type="button" value="傳回" onclick="history.go(-1); " />
			</td>
		</tr>
	</table>
</fieldset>
</form>


</body>
</html>