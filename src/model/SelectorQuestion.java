package model;

import java.util.ArrayList;

public class SelectorQuestion extends Question {
	private ArrayList<String> qSelector;

	public SelectorQuestion(String qNo, String qTitle, String qType, ArrayList<String> qSelector) {
		super(qNo, qTitle, qType);
		this.qSelector = qSelector;
	}

	public ArrayList<String> getqSelector() {
		return qSelector;
	}
	
	private String convertListToHtml() {
		StringBuffer sb = new StringBuffer();
		
		for(int i = 0; i<qSelector.size(); i++) {
			
		String type = "";
		switch(getqType()) {
			case QuestionType.RADIO:
				type = "radio";
				break;
			case QuestionType.CHECKBOX:
				type = "checkbox";
				break;
		}
		
		sb.append("<input type=\""+type+"\" name=\"question_answer_"+getqNo()+"\" id=\"choice_"+i+"\" value=\"choice_"+i+"\"/>");
		sb.append("<label for=\"choice_"+i+"\">"+qSelector.get(i)+"</label><br/>");
		
		}
		return sb.toString();
		
	}
	
	@Override
	public String convertToHtml() {
//		<section class="sc_answer">
//		<p>1. 질문입니다.</p>
//
//		<input type="radio" name="question_answer_1" id="choice_1" value="choice_1"/>
//		<label for="choice_01">선택지 1</label>  <br/>
//
//		<input type="radio" name="question_answer_2" id="choice_2" value="choice_2"/>
//		<label for="choice_02">선택지 2</label> <br/>
//		
//		<input type="radio" name="question_answer_3" id="choice_3" value="choice_3"/>
//		<label for="choice_03">선택지 3</label>   <br/>
//		
//		<input type="radio" name="question_answer_4" id="choice_4" value="choice_4"/>
//		<label for="choice_04">선택지 4</label>  
//	</section>
		
		
		StringBuffer sb = new StringBuffer();
		
		sb.append("<section class=\"sc_answer\">");
		sb.append("<p>"+getqNo()+". "+getqTitle()+"</p>");
		sb.append(convertListToHtml());
		sb.append("</section>");
		
		return sb.toString();
	}
}
