<%@page import="java.util.HashMap"%>
<%@page import="model.SelectorQuestion"%>
<%@page import="model.Question"%>
<%@page import="model.QuestionType"%>
<%@page import="model.TextQuestion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="include/css/questionnaire.css">
<script src="include/script/questionnaire.js"></script>


<%-- 설문조사 폼 작성 --%>
<section id="sc_form">
<form action="questionnaireService.jsp" method="POST">
<%
	String fileName = request.getParameter("QUESTION_NAME");
	String filePath= application.getRealPath("./data/form/"+fileName);
	
	// read file
	BufferedReader br = null;
	StringBuffer sb = new StringBuffer();
	
		try{
			br = new BufferedReader(new FileReader(filePath));
			
			while(true){
				// 한 줄 씩 읽어옴
				
				String str = br.readLine();
				if(str == null)
					break;
				else
					sb.append(str);
			}
			br.close();	
		}catch(IOException e){
			System.out.println(e.toString());
		}
		
		ArrayList<Question> questions = new ArrayList<Question>();
		
		StringTokenizer token = new StringTokenizer(sb.toString(), "\t", false);
		while(token.hasMoreElements()){
			String no = token.nextToken(); // 번호
			if(no.equals("[end]"))
				continue;
			String title = token.nextToken(); // 제목
			String type = token.nextToken(); // 타입
	
			if(Integer.parseInt(type) == QuestionType.TEXT){
				questions.add(new TextQuestion(no, title, type, token.nextToken()));
			}else{
				ArrayList<String> list = new ArrayList<String>();
				
				HashMap<String, Integer> map = new HashMap<String, Integer>();
				int index = 1;
				while(true){
					String str = token.nextToken(); // 이제 [end]가 나올 수 있음
					if(str.equals("[end]")){				
						break;
					}
					else{		
						list.add(str);
						map.put("choice_"+(index-1), Integer.parseInt(token.nextToken()));
						index++;
					}
				}
				
				questions.add(new SelectorQuestion(no, title, type, list, map));
				System.out.println("Map:"+map.toString());
			}
		}
		

		
		session.setAttribute("questions", questions);
		
		
		out.println("<hr class=\"separator\"/>");
		for(int i = 0; i<questions.size(); i++){
			out.println(questions.get(i).convertToQuestionHtml());
		}
		
%>

	<!-- <input type="button" id="submit_btn" value="작성완료"/>-->
	<input type="hidden" name="file_name" value="<%=fileName%>"/>
	<input id="btn_submit" type="submit" value="작성완료"/>
</form>
</section>