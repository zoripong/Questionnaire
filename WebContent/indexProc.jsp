<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 설문지 리스트 --%>

<%
	String path= application.getRealPath("./data/form");
	File dirFile = new File(path);
	File []fileList=dirFile.listFiles();
	for(File tempFile : fileList) {	
		out.println("<a href=\"questionnaire.jsp?QUESTION_NAME="+tempFile.getName()+"\">"+tempFile.getName()+"</a><br/>");
	}

%>

