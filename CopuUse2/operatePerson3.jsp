<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<jsp:directive.page import="java.sql.ResultSet" />
<jsp:directive.page import="java.sql.SQLException" />
<jsp:directive.page import="java.sql.PreparedStatement"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="java.sql.Timestamp"/>
<jsp:directive.page import="java.sql.Date"/>
<html>
	<head>
  		<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Grayscale</title>
        <link rel="icon" type="image/x-icon" href="../gray/assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="../gray/css/styles.css" rel="stylesheet" />
        <style>
        
        .txt1{
        
        font-size:18px;
        
        }
        
        .chkalign{
        
        text-align:center;
        
        }
        
        </style>
	</head>
	<body>



<%!
public String forSQL(String sql){
	return sql.replace("'", "\\'");
}
%>
<%
	request.setCharacterEncoding("UTF-8");

	String account = request.getParameter("account");
	String custpassword = request.getParameter("password");
	
	String action = request.getParameter("action");
	 
	 Cookie cookie = new Cookie("user",account);
	 response.addCookie(cookie);

		// INSERT SQL ??????
		String sql ="select * from customers where account='"+account+"'and password='"+custpassword+"'";
		
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String url="jdbc:mysql://localhost:3306/cart";
		String user="sam";
		String password="sam";
		
		int result = 0;
		
		try{
		
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			// ???????????????????????? ????????????????????? ??????URL???????????????????????????
			conn = DriverManager.getConnection(url,user,password);
			
			// ?????? Statement??? Statement ?????????????????? SQL????????????????????????
			stmt = conn.createStatement();
			
			// ?????? Statement ?????? SQL ??????
			rs = stmt.executeQuery(sql);
			
		}catch(SQLException e){
			out.println("??????SQL\"" + sql + "\"??????????????????" + e.getMessage());
			return;
		}finally{
			if(stmt != null)	stmt.close();
			if(conn != null)	conn.close();
		}
		
		out.println("<html><style>body{font-size:12px; line-height:25px; }</style><body>");
		out.println("????????????");
		out.println("<a href='../CopyUse2/MemberProfiles.jsp'>??????????????????</a>");
		
	
		%>

	</body>
</html>

