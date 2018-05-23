<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="include/css/create.css">
<script src="include/script/create.js"></script>


<%-- 설문 제작 폼 --%>

<form id="question_form" action="createService.jsp" method="POST">
	<input type="text" name="title_questionnaire" placeholder="설문 제목" required/>
	<input type="submit" value="저장" />
</form>

<select id="question_type">
	<option value="radio">라디오</option>
	<option value="checkbox">체크박스</option>
	<option value="text">주관식</option>
</select>
<img src="include/images/ic_add.svg" id="img_add_question">