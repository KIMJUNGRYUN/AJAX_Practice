<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String strId = request.getParameter ("id");
if (strId == null || strId.trim().equals("")) { // id 입력값이 널값인 경우에(공백)
	out.print("아이디를 입력해주세요!");
} else {
	int id = Integer.parseInt(strId);
	//System.out.println(id); 
	try {
		String url = "jdbc:mysql://localhost:3306/webshop?useSSL=false&serverTimezone=UTC";
		Connection con = DriverManager.getConnection(url, "root", "1234");
		
		PreparedStatement ps = con.prepareStatement("select * from tbl_employee where id=?");
		ps.setInt(1, id);
		
		ResultSet rs = ps.executeQuery(); //SQL문 실제 실행후 결과 rs 리턴
		if (rs.next()) {
			out.print(rs.getInt("id") + " " +  rs.getString("name") +rs.getString("dob") + rs.getString("department"));
		}
		
		con.close();
	} catch (Exception e) {
		e.printStackTrace(); //예외 발생시
	} 
}
%>
