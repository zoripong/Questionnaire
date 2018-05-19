<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="include/css/create.css">
<script src="include/script/create.js"></script>

<%-- 설문 제작 폼 --%>

<form id="question_form" action="createService.jsp">
<!--
	<section class="sc_qeustion">
		<input type="text" name="question_title_01" class="question_title" placeholder="질문을 적어주세요." required/><br/>

		<input type="radio"/>
		<input type="text" name="question_01_answer_01" class="question_answer" placeholder="선택지를 작성해주세요."><br/>

		<input type="radio"/>
		<input type="text" name="question_01_answer_02" class="question_answer" placeholder="선택지를 작성해주세요."><br/>

		<input type="radio"/>
		<input type="text" name="question_01_answer_03" class="question_answer" placeholder="선택지를 작성해주세요."><br/>

	<img src="include/images/ic_add.svg" id="img_add_selection" onclick="addRadioSelection()"/>

	</section>


	<section class="sc_qeustion">
		<input type="text" name="question_title_02" class="question_title" placeholder="질문을 적어주세요." required/><br/>

		<section class="sc_selection">
			<input type="checkbox"/>
			<input type="text" name="question_02_answer_01" class="question_answer" placeholder="선택지를 작성해주세요."><br/>
	
			<input type="checkbox"/>	
			<input type="text" name="question_02_answer_02" class="question_answer" placeholder="선택지를 작성해주세요."><br/>
	
			<input type="checkbox"/>
			<input type="text" name="question_02_answer_03" class="question_answer" placeholder="선택지를 작성해주세요."><br/>
		</section>	
		<img src="include/images/ic_add.svg" id="img_add_selection" onclick="addCheckSelection()"/>
	
	</section>
	
		<section class="sc_qeustion">
		<input type="text" name="question_title_02" class="question_title" placeholder="질문을 적어주세요." required/><br/>

		<input type="text" readonly placeholder="사용자 답안란입니다."/>
		</section> -->
</form>

<select id="question_type">
	<option value="radio">라디오</option>
	<option value="checkbox">체크박스</option>
	<option value="text">주관식</option>
</select>
<img src="include/images/ic_add.svg" id="img_add_question">

