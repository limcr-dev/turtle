<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 반응형 웹 -->
<title>BoardCommentList</title>
</head>
<body>
	<div class="table_div">
		<c:forEach var="dto" items="${list}">
			<form name="CommentList${dto.b_comNo}" action="boardCommentUpdate.bo" method="post">
			<!-- 반복 -->
				<table style="width: 100%; margin:auto;">
					<tr>
						<td rowspan="4" colspan="2" style="width:8%; text-align:center">
							<c:if test="${dto.b_comType == 'trainer'}">
								<i class="fa-solid fa-dumbbell fa-2xl" style="color: #FFD43B;"></i>
							</c:if> 	
							<c:if test="${dto.b_comType == 'admin'}">
								<i class="fa-solid fa-user-tie fa-2xl" style="color: #ff0000;"></i>
							</c:if>
							<c:if test="${dto.b_comType == 'user'}">
								<i class="fa-solid fa-user fa-2xl" style="color: #FFD43B;"></i>
							</c:if>
						</td>
					</tr>
					<tr>
						<th style="width:83%">
							${dto.b_comWriter}
							
						</th>
						<td>
							<c:if test="${sessionScope.sessionID == dto.b_comWriter || sessionScope.sessionType == 'admin' || sessionScope.sessionType == 'trainer'}">
								<input type="hidden" name="hidden_b_comNo" id="hidden_b_comNo" value="${dto.b_comNo}">
					 			<input type="hidden" name="hidden_boardNo" id="hidden_boardNo" value="${dto.boardNo}">
					 			
								<a href="javascript:commentUpdateBox${dto.b_comNo}();" style="pafont-size:13px; color: gray; text-decoration : underline; ">수정</a>
								
								<script type="text/javascript">
									function commentUpdateBox${dto.b_comNo}(){
										let editBox = '<div style="display: flex; align-items: center;">' +
								        			      '<textarea style="width: 700px; margin-right: 10px;" name="b_comContent_re" id="b_comContent_re${dto.b_comNo}">' + '${dto.b_comContent}' + '</textarea>' +
								                     	  '<button type="submit" class="btn active" id="boardInsert${dto.b_comNo}">수정</button>' +
								                      '</div>';
										$('#commentUpdate${dto.b_comNo}').html(editBox);
										
										$('#boardInsert' + ${dto.b_comNo}).click(function(){
											$('form[name="CommentList${dto.b_comNo}"]').submit();
										});
										
									}
								</script>
								<a href="${path}/boardCommentDelete.bo?b_comNo=${dto.b_comNo}&boardNo=${dto.boardNo}" style="pafont-size:13px; color: gray; text-decoration : underline;">삭제</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="font-size:13px; padding-bottom:10px">${fn: substring(dto.b_comRegdate,0,19)}</td>
					</tr>
					<tr>
						<td id="commentUpdate${dto.b_comNo}" style="width:760px">${dto.b_comContent}</td>
					</tr>
				</table>
				<hr>
    	  </form>
      </c:forEach>
   </div>
</body>
</html>