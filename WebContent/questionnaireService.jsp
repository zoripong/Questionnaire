<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="model.TextQuestion"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.SelectorQuestion"%>
<%@page import="model.QuestionType"%>
<%@page import="model.Question"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("UTF-8");
	String questionFileName = request.getParameter("file_name");
	
	try{
		ArrayList<Question> questions = (ArrayList<Question>) session.getAttribute("questions");
		
		for(int i = 0; i<questions.size(); i++){
			
			int qType = questions.get(i).getqType();
			if(qType == QuestionType.RADIO){
				HashMap<String, Integer> map = ((SelectorQuestion)questions.get(i)).getqSelectorMap();
				String key = request.getParameter("question_answer_"+(i+1));
				Integer value = map.get(key);
				System.out.println("{Map : "+map.toString()+"}");
				map.put(key, value+1);
			
			}else if(qType == QuestionType.CHECKBOX){
				
				HashMap<String, Integer> map = ((SelectorQuestion)questions.get(i)).getqSelectorMap();
				System.out.println("{Map : "+map.toString()+"}");
				
				String[] checkedValue = request.getParameterValues("question_answer_"+(i+1));
				for(String key : checkedValue){
					Integer value = map.get(key);
					System.out.println("(key : value) = "+ key +":"+ value);
					map.put(key, value+1);
				}
				
			}else if(qType == QuestionType.TEXT){
	
				String fileName = ((TextQuestion)questions.get(i)).getAnswerFile();
				String filePath = application.getRealPath("./data/result/"+fileName+".txt");
				BufferedWriter bw;
				try{
					bw = new BufferedWriter(new FileWriter(filePath, true));
					bw.write(request.getParameter("question_answer_"+(i+1))+"\n");
					bw.flush();
					bw.close();
				}catch(IOException e){
					e.printStackTrace();
				}
			
			}
			
		}
		
		// 파일에 다시 작성 
		System.out.println("questionFileName : "+ questionFileName);

		String questionFilePath = application.getRealPath("./data/form/"+questionFileName);
		BufferedWriter bw;
		try{
			
			StringBuffer sb = new StringBuffer();
			bw = new BufferedWriter(new FileWriter(questionFilePath));
			
			for(int i = 0; i<questions.size(); i++){
				
				sb.append(questions.get(i).getqNo()+"\t"+questions.get(i).getqTitle()+"\t"+questions.get(i).getqType()+"\t");
				if(questions.get(i).getqType() == QuestionType.TEXT){
					TextQuestion question = (TextQuestion)questions.get(i);
					sb.append(question.getAnswerFile()+"\t[end]\t");	
				}else{
					SelectorQuestion question = (SelectorQuestion)questions.get(i);
					ArrayList<String> selector = question.getqSelectorList();
					HashMap<String, Integer> map = question.getqSelectorMap();
					
					for(int j = 0; j<selector.size(); j++){
						sb.append(selector.get(j)+"\t"+map.get("choice_"+j)+"\t");	
					}
					sb.append("[end]\t");
				}
				
			}
			
			bw.write(sb.toString());
			
			bw.flush();
			bw.close();
		}catch(IOException e){
			e.printStackTrace();
		}
		System.out.println(questionFileName);
		%>
		

<jsp:forward page="result.jsp">
  <jsp:param name="QUESTION_NAME" value="<%=questionFileName %>"/>
</jsp:forward>
<%}catch(Exception e){%>
<jsp:forward page="index.jsp?isFail=true" />
<%
	}
		%>
