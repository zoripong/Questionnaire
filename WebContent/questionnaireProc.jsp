<%@page import="model.SelectorQuestion"%>
<%@page import="model.Question"%>
<%@page import="model.QuestionType"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 설문조사 폼 작성 --%>
<form action="result.jsp" method="post">
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
				break;
			String title = token.nextToken(); // 제목
			String type = token.nextToken(); // 타입
			if(Integer.parseInt(type) == QuestionType.TEXT){
				questions.add(new Question(no, title, type));
			}else{
				ArrayList<String> list = new ArrayList<String>();
				while(true){
					String str = token.nextToken(); // 이제 [end]가 나올 수 있음
					if(str.equals("[end]")){				
						break;
					}
					else{		
						list.add(str);
					}
				}
				questions.add(new SelectorQuestion(no, title, type, list));
			}
		}
		
		
		
		for(int i = 0; i<questions.size(); i++){
			out.println(questions.get(i).convertToHtml());
		}
%>


	<input type="submit" value="작성완료"/>
</form>

<!-- 
	<section class="sc_answer">
		<p>1. 질문입니다.</p>

		<input type="radio" name="question_answer_1" id="choice_1" value="choice_1"/>
		<label for="choice_01">선택지 1</label>  <br/>

		<input type="radio" name="question_answer_2" id="choice_2" value="choice_2"/>
		<label for="choice_02">선택지 2</label> <br/>
		
		<input type="radio" name="question_answer_3" id="choice_3" value="choice_3"/>
		<label for="choice_03">선택지 3</label>   <br/>
		
		<input type="radio" name="question_answer_4" id="choice_4" value="choice_4"/>
		<label for="choice_04">선택지 4</label>  
	</section>
	
	<section class="sc_answer">
		<p>1. 질문입니다.</p>
		<input type="text" name="question_answer_1" class="answer_textbox" placeholder="답변을 적어주세요."/>
	</section>

-->