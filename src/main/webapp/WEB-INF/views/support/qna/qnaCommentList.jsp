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
		<!-- 반복 -->
		<c:forEach var="dto" items="${list}">
			<c:if test="${sessionScope.sessionID == dto.q_comWriter}">
				<form name="CommentList${dto.q_comNo}" action="qnaCommentUpdate.bo" method="post">
					<table  border="1"cellpadding="10" style="border-radius: 5px; border-collapse: separate; border-spacing: 0; width: 800px; margin:auto;">
						<tr style="background-color:#FFCD28">
							<td>추가질문</td>
							<td align="right"style="font-size:small; width:15%">
								${dto.q_comRegdate}
							</td>
						</tr>
						<tr>
							<td colspan="2"><hr style="width:800px; margin:auto;"></td>
						</tr>
						<tr>
							<td style="width:80%; word-wrap: break-word; overflow-wrap: break-word; white-space: pre-wrap; max-width: 700px;">${dto.q_comContent}</td>
					 	</tr>
					 	<tr>
					 		<div>
					 			<input type="hidden" name="hidden_q_comWriter" id="hidden_q_comWriter" value="${sessionScope.sessionID}">
					 			<input type="hidden" name="hidden_q_comNo" id="hidden_q_comNo" value="${dto.q_comNo}">
					 			<input type="hidden" name="hidden_qnaNo" id="hidden_qnaNo" value="${dto.qnaNo}">
				 			</div>
					 		<td>
					 			<textarea style="width:700px; margin:auto;"name="q_comContent_re" id="q_comContent_re${dto.q_comNo}" rows="3" class="form-control form-control-lg" placeholder="수정할 내용을 입력해주세요"></textarea>
					 		</td>
				 			<td style="width:20%" align="center">
				 				<!-- 수정버튼 클릭시 시작 -->
								<button type="submit" class="btn active" data-bs-toggle="button" aria-pressed="true" id="qnaCommentEdit${dto.q_comNo}">수정</button>
								<script type="text/javascript">
									$(document).ready(function() {
									    $('#qnaCommentEdit' + ${dto.q_comNo}).click(function() {
									        if ($('#q_comContent_re' + ${dto.q_comNo}).val().trim() == '') {
									            alert("수정할 내용을 입력해주세요."); 
									            return false;
									        }
									        $('form[name="CommentList${dto.q_comNo}"]').submit();
									    });
									}); 
								</script>
								<div style="margin-top:8px">
									<button type="button" class="btn active" data-bs-toggle="button" aria-pressed="true" onclick="window.location='${path}/qnaCommentDelete.bo?q_comNo=${dto.q_comNo}&qnaNo=${dto.qnaNo}&q_comWriter=${dto.q_comWriter}'">삭제</button>
								</div>
								<!-- 수정버튼 클릭시 끝 -->
							</td>
					 	</tr>
					</table>
			   		<br><br>
				</form>
			</c:if>
			<!-- 관리자의 답변 -->
			<c:if test="${sessionScope.sessionType == 'admin' || sessionScope.sessionType == 'trainer'}">
				<c:if test="${dto.q_comWriter == '관리자'}">
					<form name="CommentList${dto.q_comNo}" action="qnaCommentUpdate.bo" method="post">
						<table  border="1"cellpadding="10" style="border-radius: 5px; border-collapse: separate; border-spacing: 0; width: 800px; margin:auto;">
							<tr style="background-color:#FFCD28">
								<td>작성자:관리자</td>
								<td align="right"style="font-size:small; width:15%">
									${dto.q_comRegdate}
								</td>
							</tr>
							<tr>
								<td colspan="2"><hr style="width:800px; margin:auto;"></td>
							</tr>
							<tr>
								<td style="width:80%; word-wrap: break-word; overflow-wrap: break-word; white-space: pre-wrap; max-width: 700px;" >${dto.q_comContent}</td>
						 	</tr>
						 	<tr>
						 		<div>
						 			<input type="hidden" name="hidden_q_comWriter" id="hidden_q_comWriter" value="${sessionScope.sessionID}">
						 			<input type="hidden" name="hidden_q_comNo" id="hidden_q_comNo" value="${dto.q_comNo}">
						 			<input type="hidden" name="hidden_qnaNo" id="hidden_qnaNo" value="${dto.qnaNo}">
					 			</div>
						 		<td>
						 			<textarea style="width:700px; margin:auto;"name="q_comContent_re" id="q_comContent_re${dto.q_comNo}" rows="3" class="form-control form-control-lg" placeholder="수정할 내용을 입력해주세요"></textarea>
						 		</td>
					 			<td style="width:20%" align="center">
					 				<!-- 수정버튼 클릭시 시작 -->
									<button type="submit" class="btn active" data-bs-toggle="button" aria-pressed="true" id="qnaCommentEdit${dto.q_comNo}">수정</button>
									<script type="text/javascript">
										$(document).ready(function() {
										    $('#qnaCommentEdit' + ${dto.q_comNo}).click(function() {
										        if ($('#q_comContent_re' + ${dto.q_comNo}).val().trim() == '') {
										            alert("수정할 내용을 입력해주세요."); 
										            return false;
										        }
										        $('form[name="CommentList${dto.q_comNo}"]').submit();
										    });
										}); 
									</script>
									<div style="margin-top:8px">
										<button type="button" class="btn active" data-bs-toggle="button" aria-pressed="true" onclick="window.location='${path}/qnaCommentDelete.bo?q_comNo=${dto.q_comNo}&qnaNo=${dto.qnaNo}&q_comWriter=${dto.q_comWriter}'">삭제</button>
									</div>
									<!-- 수정버튼 클릭시 끝 -->
								</td>
						 	</tr>
						</table>
				   		<br><br>
					</form>
				</c:if>
				<!-- 작성자가 관리자가 아닌경우 -->
				<c:if test="${dto.q_comWriter != '관리자'}">
					<form name="CommentList${dto.q_comNo}" action="adQnaCommentUpdate.ad" method="post">
						<table  border="1" cellpadding="10" style="border-radius: 5px; border-collapse: separate; border-spacing: 0; width: 820px; margin:auto;">
							<tr style="background-color:#FFCD28">
								<td style="height: 5px;">추가질문</td>
								<td colspan="2" align="right"style="font-size:small; width:15%; height: 5px;">
									${dto.q_comRegdate}
								</td>
							</tr>
							<!-- 답변내용 -->
							<tr>
								<td style="width:80%; word-wrap: break-word; overflow-wrap: break-word; white-space: pre-wrap; height: 5px; max-width: 700px;">${dto.q_comContent}</td>
						 	</tr>
						</table>
			   		<br><br>
			   		</form>
	   			</c:if>
	   		</c:if>
	   		<c:if test="${sessionScope.sessionType != 'admin' && sessionScope.sessionType != 'trainer'}">
		   		<c:if test="${dto.q_comWriter == '관리자'}">
		   			<form name="CommentList${dto.q_comNo}" action="adQnaCommentUpdate.ad" method="post">
						<table  border="1" cellpadding="10" style="border-radius: 5px; border-collapse: separate; border-spacing: 0; width: 820px; margin:auto;">
							<tr style="background-color:#FFCD28">
								<td style="height: 5px;">작성자:관리자</td>
								<td colspan="2" align="right"style="font-size:small; width:15%; height: 5px;">
									${dto.q_comRegdate}
								</td>
							</tr>
							<!-- 답변내용 -->
							<tr>
								<td style="width:80%; word-wrap: break-word; overflow-wrap: break-word; white-space: pre-wrap; height: 5px; max-width: 700px;">${dto.q_comContent}</td>
						 	</tr>
						</table>
			   		<br><br>
			   		</form>
		   		</c:if>
	   		</c:if>
		</c:forEach>
	</div>
</body>
</html>