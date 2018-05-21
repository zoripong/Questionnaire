package model;

public class Question {
	private int qNo;
	private String qTitle;
	private int qType;
	
	public Question(String qNo, String qTitle, String qType) {
		super();
		this.qNo = Integer.parseInt(qNo);
		this.qTitle = qTitle;
		this.qType = Integer.parseInt(qType);
	}

	public int getqNo() {
		return qNo;
	}

	public String getqTitle() {
		return qTitle;
	}

	public int getqType() {
		return qType;
	}
	
	public String convertToHtml() {
//		<section class="sc_answer">
//		<p>1. 질문입니다.</p>
//		<input type="text" name="question_answer_1" class="answer_textbox" placeholder="답변을 적어주세요."/>
//		</section>
		
		StringBuffer sb = new StringBuffer();
		sb.append("<section class=\"sc_answer\">");
		sb.append("<p>"+qNo+". "+qTitle+"</p>");
		sb.append("<input type=\"text\" name=\"question_answer_"+qNo+"\" class=\"answer_textbox\" placeholder=\"답변을 적어주세요.\"/>");
		sb.append("</section>");
		
		return sb.toString();
	}
	
	
}
