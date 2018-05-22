package model;

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
	public String convertToHtml() {
//		<section class="sc_answer">
//		<p>1. 질문입니다.</p>
//		<input type="text" name="question_answer_1" class="answer_textbox" placeholder="답변을 적어주세요."/>
//		</section>
		
		StringBuffer sb = new StringBuffer();
		sb.append("<section class=\"sc_answer\">");
		sb.append("<p>"+getqNo()+". "+getqTitle()+"</p>");
		sb.append("<input type=\"text\" name=\"question_answer_"+getqNo()+"\" class=\"answer_textbox\" placeholder=\"답변을 적어주세요.\" required />");
		sb.append("</section>");
		
		return sb.toString();
	}
	
	@Override
	public String toString() {
		return "text";
	}
}
