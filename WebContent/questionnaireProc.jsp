<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 설문조사 폼 작성 --%>

<%
	String fileName = request.getParameter("QUESTION_NAME");
	String filePath= application.getRealPath("./data/form/"+fileName);
	
	// read file
	BufferedReader br = null;
	 
		try{
			br = new BufferedReader(new FileReader(filePath));
			while(true){
				// 한 줄 씩 읽어옴
				String str = br.readLine();
				out.println(str+"<br/>");
				if(str == null) break;
				
			}
			br.close();	
		}catch(IOException e){
			System.out.println(e.toString());
		}

%>

<a href="result.jsp">작성 완료</a>



	<section class="sc_qeustion">
		<input type="text" name="question_title_01" class="question_title" placeholder="질문을 적어주세요." required/><br/>

		<input type="radio" name="question_answer_01" id="choice_01" value="choice_01"/>
		<label for="choice_01">선택지 1</label>  <br/>

		<input type="radio" name="question_answer_02" id="choice_02" value="choice_02"/>
		<label for="choice_02">선택지 2</label> <br/>
		
		<input type="radio" name="question_answer_03" id="choice_03" value="choice_03"/>
		<label for="choice_03">선택지 3</label>  
		
		<input type="radio" name="question_answer_04" id="choice_04" value="choice_04"/>
		<label for="choice_04">선택지 4</label>  
	</section>


