package model;

abstract public class Question {
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
	
	abstract public String convertToQuestionHtml();

	
}
