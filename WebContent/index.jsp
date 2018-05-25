<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<%
	System.out.println(application.getRealPath("./data/form/"));
	if(request.getParameter("isFail")!=null){
		out.println("<script>alert('설문조사에 응답하는데 실패하셨습니다. 다시 시도해주세요.');</script>");
	}
%>
	<jsp:forward page="template.jsp">
		<jsp:param name="CONTENTPAGE" value="indexProc.jsp" />
	</jsp:forward>	
</body>
</html>