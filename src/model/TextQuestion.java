package model;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class TextQuestion extends Question{
	private String answerFile;
	
	public TextQuestion(String qNo, String qTitle, String qType, String answerFile) {
		super(qNo, qTitle, qType);
		this.answerFile = answerFile;
	}

	public String getAnswerFile() {
		return answerFile;
	}
	
	@Override
	public String convertToQuestionHtml() {
//		<section class="sc_answer">
//		<p>1. 질문입니다.</p>
//		<input type="text" name="question_answer_1" class="answer_textbox" placeholder="답변을 적어주세요."/>
//		</section>
		
		StringBuffer sb = new StringBuffer();
		sb.append("<section class=\"sc_answer\">");
		sb.append("<p>"+getqNo()+". "+getqTitle()+"</p>");
		sb.append("<input type=\"text\" name=\"question_answer_"+getqNo()+"\" class=\"answer_textbox\" placeholder=\"답변을 적어주세요.\" required />");
		sb.append("</section>");

		sb.append("<hr class=\"separator\"/>");
		return sb.toString();
	}
	
	
	public String convertToResultHtml(String filePath) {
		StringBuffer sb = new StringBuffer();
		sb.append("<section class=\"sc_answer\">");

		sb.append("<p>"+getqNo()+". "+getqTitle()+" [주관식] </p>");
		sb.append("<details>");
		sb.append("<summary>답변 보기.</summary>");
		
		// File Read
		try {
			BufferedReader br = new BufferedReader(new FileReader(filePath));
			while(true) {
				String str = br.readLine();
				if(str == null)
					break;
				sb.append("<p class=\"text_answer\">"+str+"</p>");
			}
		}catch(IOException e) {
			e.printStackTrace();
		}
		sb.append("</details>");
		sb.append("</section>");
		return sb.toString();
	}
	
	@Override
	public String toString() {
		return "text";
	}
}
