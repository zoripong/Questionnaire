package model;

import java.util.ArrayList;
import java.util.HashMap;

public class SelectorQuestion extends Question {
	private ArrayList<String> qSelectorList;
	private HashMap<String, Integer> qSelectorMap;

	public SelectorQuestion(String qNo, String qTitle, String qType, ArrayList<String> qSelectorList,
			HashMap<String, Integer> qSelectorMap) {
		super(qNo, qTitle, qType);
		this.qSelectorList = qSelectorList;
		this.qSelectorMap = qSelectorMap;
	}
	
	public ArrayList<String> getqSelectorList() {
		return qSelectorList;
	}

	public HashMap<String, Integer> getqSelectorMap() {
		return qSelectorMap;
	}
	

	
	public void setqSelectorList(ArrayList<String> qSelectorList) {
		this.qSelectorList = qSelectorList;
	}

	public void setqSelectorMap(HashMap<String, Integer> qSelectorMap) {
		this.qSelectorMap = qSelectorMap;
	}

	
	private String convertListToHtml() {
		
		StringBuffer sb = new StringBuffer();
		for(int i = 0; i<qSelectorList.size(); i++) {
			
			switch(getqType()) {
				case QuestionType.RADIO:
					sb.append("<input type=\"radio\" name=\"question_answer_"+getqNo()+"\" id=\"choice_"+i+"\" value=\"choice_"+i+"\" required/>");
					break;
				case QuestionType.CHECKBOX:
					sb.append("<input type=\"checkbox\" name=\"question_answer_"+getqNo()+"\" id=\"choice_"+i+"\" value=\"choice_"+i+"\"/>");
					break;
			}
			
			sb.append("<label for=\"choice_"+i+"\">"+qSelectorList.get(i)+"</label><br/>");
			
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
	
	
	@Override
	public String toString() {
		return "selector";
	}
}
