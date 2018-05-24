var index = 0;
var selectionIndex = [];

window.onload = function() {
	
	document.getElementById("img_add_question").onclick = addQuestion;
	
	// remove btn
	// 변경시 유지 
};


function addSelection(selectIndex, isRadio){
	
	selectionIndex[selectIndex]++;
	//alert("question_"+selectIndex+"_answer_"+selectionIndex[selectIndex]);
	//alert(selectIndex+"/"+ selectionIndex[selectIndex]+ "/"+isRadio);
	var question = document.getElementById("sc_selection_"+selectIndex);
	
	var code ="";
	if(isRadio){
		code+="<input type=\"radio\" />";
	}else{		
		code+="<input type=\"checkbox\" />";
	}
	code+="<input type=\"text\" name=\"question_"+selectIndex+"_answer_"+selectionIndex[selectIndex]+"\" class=\"question_answer\" placeholder=\"선택지를 작성해주세요.\"><br/>";
	
	question.innerHTML+=code;
		
}

var addQuestion = function(){
	selectionIndex.push(index);
	selectionIndex[index]=0;
	//alert(selectionIndex[index]);
	var e = document.getElementById("question_type");
	var type  = e.options[e.selectedIndex];
	
	var code = "<section id=\"sc_question_"+index+"\" class=\"sc_qeustion\">";
	code+=(index+1)+".";
	code+="<input type=\"text\" name=\"question_"+index+"\" class=\"question_title\" placeholder=\"질문을 적어주세요.\" required/><br/>";

	//alert(e.selectedIndex);

	switch(e.selectedIndex){
	case 0: // 라디오
		code+="<section id=\"sc_selection_"+index+"\" class=\"sc_selection\">";
		code+="<input type=\"hidden\" name=\"hd_"+index+"\" value=\"0\"/>";
		code+="<input type=\"radio\" class=\"check\"/>";
		code+="<input type=\"text\" name=\"question_"+index+"_answer_"+selectionIndex[index]+"\" class=\"question_answer\" placeholder=\"선택지를 작성해주세요.\" required><br/>";
		code+="</section>";
		code+="	<img src=\"include/images/ic_plus_selector.svg\" id=\"img_add_selection\" onclick=\"addSelection("+index+", true)\"/>";
		// value="???"
		// add btn
		break;
	case 1: // 체크박스
		code+="<section id=\"sc_selection_"+index+"\" class=\"sc_selection\">";
		code+="<input type=\"hidden\" name=\"hd_"+index+"\" value=\"1\"/>";
		code+="<input type=\"checkbox\" class=\"check\"/>";
		code+="<input type=\"text\" name=\"question_"+index+"_answer_"+selectionIndex[index]+"\" class=\"question_answer\" placeholder=\"선택지를 작성해주세요.\" required><br/>";
		code+="</section>";
		code+="	<img src=\"include/images/ic_plus_selector.svg\" id=\"img_add_selection\" onclick=\"addSelection("+index+", false)\"/>";
		
		break;
	case 2: // 주관식
		code+="<input type=\"hidden\" name=\"hd_"+index+"\" value=\"2\"/>";
		code+="<input id=\"text_answer\" type=\"text\" readonly placeholder=\"사용자 답안란입니다.\"/>";
		break;
	}

	code+="</section>";
	
	var form = document.getElementById("question_form");
	form.innerHTML += code;
	
	index++;
};

