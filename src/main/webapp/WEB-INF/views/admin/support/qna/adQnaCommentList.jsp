<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 반응형 웹 -->
<title>QnaCommentList</title>
</head>
<body>
	<div class="comment_div">
		<!-- 반복 -->
		<c:forEach var="dto" items="${list}">
			<c:if test="${dto.q_comWriter == '관리자'}">
				<form name="CommentList${dto.q_comNo}" action="adQnaCommentUpdate.ad" method="post">
					<table  border="1" cellpadding="5" style="border-collapse: separate; border-spacing: 0; width: 800px; margin:auto;">
						<tr style="background-color:#BDBDBD">
							<th>작성자:관리자</th>
							<td colspan="2" align="right"style="font-size:small; width:20%; height: 5px;">
								${dto.q_comRegdate}
							</td>
						</tr>
						<!-- 답변내용 -->
						<tr>
							<td style="text-align:left; width:80%; word-wrap: break-word; overflow-wrap: break-word; white-space: pre-wrap; height: 5px; max-width: 700px;"><div style="margin:5px">${dto.q_comContent}</div></td>
					 	</tr>
					 	<!-- 작성칸 -->
					 	<tr>
					 		<div>
				 				<input type="hidden" name="hidden_q_comWriter" id="hidden_q_comWriter" value="${sessionScope.sessionID}">
				 				<input type="hidden" name="hidden_q_comNo" id="hidden_q_comNo" value="${dto.q_comNo}">
				 				<input type="hidden" name="hidden_qnaNo" id="hidden_qnaNo" value="${dto.qnaNo}"> 
				 			</div>
					 		<td>
					 			<textarea style="width:700px; margin:auto;"name="q_comContent_re" id="q_comContent_re${dto.q_comNo}" rows="3" class="form-control form-control-lg" placeholder="수정할 내용을 입력해주세요" required></textarea>
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
									<button type="button" class="btn active" data-bs-toggle="button" aria-pressed="true" onclick="window.location='${path}/adQnaCommentDelete.ad?q_comNo=${dto.q_comNo}&qnaNo=${dto.qnaNo}&q_comWriter=${dto.q_comWriter}'">삭제</button>
								</div>
								<!-- 수정버튼 클릭시 끝 -->
							</td>
					 	</tr>
					</table>
		   		<br><br>
		   		</form>
	   		</c:if>
	   		
	   		<c:if test="${dto.q_comWriter != '관리자'}">
				<form name="CommentList${dto.q_comNo}" action="adQnaCommentUpdate.ad" method="post">
					<table  border="1" cellpadding="5" style="border-collapse: separate; border-spacing: 0; width: 800px; margin:auto;">
						<tr style="background-color:#D8D8D8">
							<th>추가문의</th>
							<td colspan="2" align="right"style="font-size:small; width:20%; height: 5px;">
								${fn: substring(dto.q_comRegdate,0,19)}
							</td>
						</tr>
						<!-- 답변내용 -->
						<tr>
							<td style="text-align:left; width:80%; word-wrap: break-word; overflow-wrap: break-word; white-space: pre-wrap; height: 5px; max-width: 700px;"><div style="margin:5px">${dto.q_comContent}</div></td>
							<td style="width:10%" align="center">
								<button type="button" class="btn active" data-bs-toggle="button" aria-pressed="true" onclick="window.location='${path}/adQnaCommentDelete.ad?q_comNo=${dto.q_comNo}&qnaNo=${dto.qnaNo}&q_comWriter=${dto.q_comWriter}'">삭제</button>
							</td>
					 	</tr>
					</table>
		   		<br><br>
		   		</form>
	   		</c:if>
		</c:forEach>
   </div>
</body>
</html>