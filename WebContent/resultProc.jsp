<%@page import="model.SelectorQuestion"%>
<%@page import="model.TextQuestion"%>
<%@page import="model.QuestionType"%>
<%@page import="model.Question"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="include/css/result.css">
<%-- 설문조사 결과 --%>
<section id="sc_result">
<%
	String fileName = request.getParameter("QUESTION_NAME");
	ArrayList<Question> questions = (ArrayList<Question>)session.getAttribute("questions");
	
//	out.println(fileName+"<br/>"+questions.size());
	
	for(int i = 0; i<questions.size(); i++){
		if(questions.get(i).getqType() == QuestionType.TEXT){
			TextQuestion question = (TextQuestion)questions.get(i);
			out.println(question.convertToResultHtml(application.getRealPath("./data/result/"+question.getAnswerFile()+".txt")));
			
		}else{
			out.println(((SelectorQuestion)questions.get(i)).convertToResultHtml());
		}
	}
%>
</section>