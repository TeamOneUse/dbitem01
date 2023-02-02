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
        <title>jump</title>
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
	/** SQL 值中的單引號(')需要轉化為 \'  */
	public String forSQL(String sql){
		return sql.replace("'", "\\'");
	}
%>
<%
	request.setCharacterEncoding("UTF-8");

	String account=request.getParameter("account");
	String custpassword=request.getParameter("password");
	String name = request.getParameter("name");
	String englishName = request.getParameter("english_name");
	String age = request.getParameter("age");
	String email = request.getParameter("email");
	String phone=request.getParameter("phone");
	String birthday = request.getParameter("birthday");
	String sex = request.getParameter("sex");
	
	String action = request.getParameter("action");


		// INSERT SQL 敘述
		String sql = "INSERT INTO customers ( account,password,name,english_name,age,sex,email,phone,birthday )values ( '" + forSQL(account) +"','" + forSQL(custpassword) +"', '"+ forSQL(name) + "', '" + forSQL(englishName) + "','" + forSQL(age) + "', '" + forSQL(sex) + "', '" + forSQL(email)+ "', '" + forSQL(phone) +"', '" + forSQL(birthday) + "' " + " ) " ;
		//INSERT INTO `customers`(`id`, `account`, `password`, `name`, `english_name`, `age`, `sex`, `email`, `phone`, `birthday`, `create_time`) VALUES ('[value-1]','[value-2]','[value-3]','[value-4]','[value-5]','[value-6]','[value-7]','[value-8]','[value-9]','[value-10]','[value-11]')
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String url="jdbc:mysql://localhost:3306/cart";
		String user="sam";
		String password="sam";
		
		int result = 0;
		
		try{
		
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			// 獲得資料庫連接。 三個參數分別為 連接URL，使用者名稱，密碼
			conn = DriverManager.getConnection(url,user,password);
			
			// 獲得 Statement。 Statement 對像用於執行 SQL。相當於控制台。
			stmt = conn.createStatement();
			
			// 使用 Statement 執行 SQL 敘述
			result = stmt.executeUpdate(sql);
			
		}catch(SQLException e){
			out.println("執行SQL\"" + sql + "\"時發生例外：" + e.getMessage());
			return;
		}finally{
			if(stmt != null)	stmt.close();
			if(conn != null)	conn.close();
		}
		
		out.println("<html><style>body{font-size:12px; line-height:25px; }</style><body>");
		out.println(result + " 條記錄被增加到資料庫中。");
		out.println("<a href='../CopyUse2/MemberProfiles.jsp'>傳回人員列表</a>");
		
	
		
		%>

	</body>
</html>

