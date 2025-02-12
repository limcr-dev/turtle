<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<script type="text/javascript">
$(document).ready(function() {
    $('#qnaCommentEdit').click(function() {
        // 폼을 수동으로 제출
        $('form[name="CommentList"]').submit();
    });
});
</script>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 반응형 웹 -->
<title>QnaCommentList</title>
</head>
<body>
	
	<div class="table_div">
		<form name="CommentList" action="qnaCommentUpdate.bo" method="post">
		<!-- 반복 -->
			<c:forEach var="dto" items="${list}">
				<table  border="1"cellpadding="10" style="border-radius: 5px; border-collapse: separate; border-spacing: 0; width: 800px; margin:auto;">
					<tr style="background-color:#FFCD28">
						<td >${dto.q_comWriter}님의 답변</td>
						<td colspan="2" align="right"style="font-size:small">
							${dto.q_comRegdate}
						</td>
					</tr>
					<tr>
						<td colspan="2"><hr style="width:800px; margin:auto;">
						</td>
					</tr>
					<tr>
						<td style="width:80%">${dto.q_comContent}</td>
						
				 	</tr>
				 	<tr>
				 		<c:if test="${sessionScope.sessionType == 'admin' || sessionScope.sessionType == 'trainer' || sessionScope.sessionID == dto.q_comWriter }" > 
				 			<input type="hidden" name="hidden_q_comWriter" id="hidden_q_comWriter" value="${sessionScope.sessionID}">
				 			<input type="hidden" name="hidden_q_comNo" id="hidden_q_comNo" value="${dto.q_comNo}">
				 			<input type="hidden" name="hidden_qnaNo" id="hidden_qnaNo" value="${dto.qnaNo}">
					 		<td>
					 			<textarea style="width:700px; margin:auto;"name="q_comContent_re" id="q_comContent_re" rows="3" class="form-control form-control-lg" placeholder="수정할 내용을 입력해주세요"></textarea>
					 		</td>
				 			<td style="width:10%" align="center">
								<button type="submit" class="btn active" data-bs-toggle="button" aria-pressed="true" id="qnaCommentEdit">수정</button>
								<button type="button" class="btn active" data-bs-toggle="button" aria-pressed="true" onclick="window.location='${path}/qnaCommentDelete.bo?q_comNo=${dto.q_comNo}&qnaNo=${dto.qnaNo}&q_comWriter=${dto.q_comWriter}'">삭제</button>
							</td>
						</c:if>
				 	</tr>
				</table>
		   		<br><br>
			</c:forEach>
      </form>
   </div>
</body>
</html>