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

	String title = request.getParameter("title_questionnaire");
	String filePath = application.getRealPath("./data/form/"+title+"["+ System.currentTimeMillis()+"].txt");

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
					}

			    }else if(key.toLowerCase().startsWith("hd_")){
			    	// 질문 타입
			    	String[] values = parameters.get(key);
			    	bw.write(values[0]+"\t");
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