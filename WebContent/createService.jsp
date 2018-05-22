<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.IOException"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

	request.setCharacterEncoding("UTF-8");
	
	String fileName = request.getParameter("title_questionnaire")+"["+ System.currentTimeMillis()+"]";	
	fileName = fileName.replace(" ", "");
	String filePath = application.getRealPath("./data/form/"+fileName+".txt");
	

	System.out.println(filePath);
	File file = new File(filePath);
	  
	//Create the file
	if (file.createNewFile()){
		System.out.println("File is created!");
		
		Map<Integer, String> questionTypes = new HashMap<Integer, String>();
		Map<String, String[]> parameters = request.getParameterMap();
		
		BufferedWriter bw;
		try {
			bw = new BufferedWriter(new FileWriter(filePath));
			
			boolean isFirst = true;
			String questionName = "-";
			int index = 0;
			
			int questionType = -1;
			
			for(String key : parameters.keySet()) {
			    if(key.toLowerCase().startsWith("question")) {
			    	if(!key.contains(questionName)){
			    		if(!isFirst)
			    			bw.write("[end]\t"+(++index)+"\t");
			    		else
			    			bw.write(++index+"\t");
			    		
			    		questionName = key;
			    		isFirst = false;
			    	}
			        String[] values = parameters.get(key);
				       
					for(String value : values){
						bw.write(value+"\t");
						System.out.println(value + " / type : "+questionType);
						
						
						if(questionType==0 || questionType==1){
							if(key.contains("answer")){
								bw.write("0\t");
							}
						}
					}

			    }else if(key.toLowerCase().startsWith("hd_")){
			    	// 질문 타입
			    	String[] values = parameters.get(key);
			    	bw.write(values[0]+"\t");
			    	questionType = Integer.parseInt(values[0]);
			    	
			    	if(questionType == 2){
			    		bw.write(fileName+"_answer_"+index+".txt\t");
			    	}
			    }
				
			}		
				
			bw.write("[end]\t");
			
			bw.flush();
			bw.close();
		}catch(IOException e){
			e.printStackTrace();
		}
		%>
		<jsp:forward page="index.jsp"/>
	<%}else{
		//다시 create.jsp 페이지로%>
		<jsp:forward page="create.jsp?isFail=true"/>
	<%}
	
	
%>