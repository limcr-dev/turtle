<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<style>
	#customAccordionButton:focus {
	    box-shadow: none !important; /* 기본 부트스트랩 효과 제거 */
	    border: 2px solid #000000 !important; /* 클릭 시 검은색 테두리 */
  	}
   	.btn btn-light{
  		background-color:orange-500;
  	} 
  	.comment-container {
	    width: 100%;
	    border: 1px solid gray;
	    padding: 15px;

	    margin: auto;
	}
	.comment-box {
	    display: flex;
	    align-items: center;
	    border-top: 1px solid #ddd;
	    padding-top: 10px;
	}
</style>

<script>
	$(function(){	// 상세페이지가 로딩되면
		// 자동으로 댓글 목록 호출
		comment_list();
	
		// [댓글쓰기 버튼 클릭 1번]
		$('#boardCommentInsert').click(function(){
			comment_add();
		});
		// [삭제 버튼] 클릭시 
		$("#boardDelete").click(function(){
			alert("삭제합니다")
			location.href="${path}/boardDelete.bo?boardNo=${dto.boardNo}";
		});
	});
	
	// 댓글쓰기 버튼 클릭
	function comment_add(){
		// 게시글번호,댓글 내용을 파라미터로 넘김
		let param = {
			"boardNo" : ${dto.boardNo},
			"b_comContent" : $('#b_comContent').val()
		}
		$.ajax({
			url: '${path}/boardCommentInsert.bo',
			type: 'POST',
			data: param,
			success: function(){	
				$('#b_comContent').val('');
				location.reload(true);	// 현재 페이지 새로고침
			},
			error: function(){
				comment_list();
				alert('내용을 확인해주세요');
			}
		});
	}
	
	// 댓글 목록
	function comment_list(){ 
		$.ajax({
			url: '${path}/boardCommentList.bo',
			type: 'POST',
			data: 'boardNo=${dto.boardNo}',
			success: function(result){
				$('#commentList').html(result);			
			},
			error: function(){
				alert('comment_list() 오류');
			}
		});
	}
</script>
<head>
<meta charset="UTF-8">
<title>Board Detail</title>
</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->
		
		<!-- 컨텐츠 시작 -->
			<!-- 상단 메뉴바 -->
				<br>
				<div  style="width:1000px; margin:auto" class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
					<div class="btn-group me-2" role="group" aria-label="Second group">
					    <button type="button" class="btn btn-light">
							<a href="${path}/noticeList.bo" style="text-decoration: none; color: inherit;">공지사항</a>
						</button>
						<button type="button" class="btn btn-light">
							<a href="${path}/eventList.bo" style="text-decoration: none; color: inherit;">이벤트</a>
						</button>
						<button type="button" class="btn btn-warning">
							<a href="${path}/boardList.bo" style="text-decoration: none; color: inherit;">자유게시판</a>
						</button>
					    <button type="button" class="btn btn-light" >
							<a href="${path}/faqList.bo" style="text-decoration: none; color: inherit;"> FAQ</a>
					    </button>
					    <button type="button" class="btn btn-light" >
							<a href="${path}/qnaList.bo" style="text-decoration: none; color: inherit;">1대1문의</a>
						</button>
					</div>
				</div>
			<!-- 상단 메뉴바 끝 -->
		
			<hr>
			<h3 align="center">자유게시판</h3>
			<br><br>
			
			<!-- 공지글목록 시작 -->
			<hr style="border:3px solid orange; width:1000px; margin:auto;">
			
				<table class="table" style="width:1000px; margin:auto;">
					<thead>
					    <tr>
							<td colspan="2" style="width:70%"><h2>${dto.boardTitle}</h2><br>작성자 : ${dto.boardWriter}  </td>
							<td align="right" colspan="5" style="width:5%">
								<c:if test="${sessionScope.sessionID == dto.boardWriter || sessionScope.sessionType == 'admin' || sessionScope.sessionType == 'trainer'}">
									<!-- 수정삭제버튼 시작 -->
									<div style="margin-bottom:5px">
									<button type="button" class="btn btn-warning" >
											<a href="${path}/boardUpdate.bo?boardNo=${dto.boardNo}" style="text-decoration: none; color: inherit;">수정</a>
									</button>
									
									<!-- Modal 시작 -->
									<button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#exampleModal">
									  삭제
									</button>
									<div class="modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="false">
										<div class="modal-dialog modal-dialog-centered">
											<div class="modal-content">
												<div class="modal-header">
									        		<h1 class="modal-title fs-5" id="exampleModalLabel">확인</h1>
									       			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									      		</div>
										     	<div class="modal-body">
										        	삭제하겠습니까?
										      	</div>
										      	<div class="modal-footer">
										        	<button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="boardDelete">예</button>
										        	<button type="button" class="btn btn-secondary"data-bs-dismiss="modal">아니요</button>
										      	</div>
											</div>
										</div>
									</div>
									<!-- Modal 끝 -->
									</div>
								<!-- 수정삭제버튼 끝 --> 
								</c:if>
								작성일 : ${fn: substring(dto.boardRegdate,0,16)} 
								<i class="fa-solid fa-eye" style="color: #91959c; margin-left:5px"></i> ${dto.boardViews}
							</td>
					    </tr>
				    </thead>
				    <tbody>
					    <tr>
					        <td colspan="3" style="padding:30px 5px">
					      		${dto.boardContent}	
					      	</td>
					    </tr>
					    <!-- 댓글 입력칸 시작 -->
					    <tr>
							<td colspan="3">
								<h3 style="color:orange">댓글 ${dto.boardCommentCnt}	</h3>
								<c:if test="${sessionScope.sessionID==null}">
							    	<div class="comment-container" style="text-align: center; background-color: #f9f9f9;">
									    <p class="comment-message" style="color: #666;">로그인 후 댓글을 남길 수 있습니다.</p>
									    <button type="button" style="margin-bottom:15px" class="btn btn-warning" onclick="window.location='login.do'">
											로그인
										</button>
									
									    <div class="comment-box">
									        <textarea placeholder="댓글을 입력하세요" style="width: 870px; margin-right:10px; resize: none;" disabled></textarea> 
									        <button class="btn btn-warning" disabled>등록</button>
									    </div>
									</div>
								</c:if>
								<c:if test="${sessionScope.sessionID!=null}">
									<div class="comment-container" style="text-align: left;">
										<div style="margin-bottom:10px">작성자명 : ${sessionScope.sessionID}</div>
									    <div class="comment-box">
									    	
									        <textarea placeholder="댓글을 입력하세요" id="b_comContent" style="width: 870px; margin-right:10px; height:100px; resize: none;"></textarea>   
									        <button type="button" class="btn btn-warning" id="boardCommentInsert">
												등록
											</button>
									    </div>
									</div>
								</c:if>
							</td>
					    </tr>
					    <!-- 댓글 입력칸 끝 -->
					    <!-- 댓글 목록 시작 -->
					    <tr>
						    <td colspan="3" >
						    	<div id="commentList" align="center">
									<!-- 댓글 들어가는 부분 -->
								</div>
						    </td>
						</tr>
						<!-- 댓글 목록 끝 -->
					    <!-- 목록 버튼 -->
					    <tr>
					   		<td colspan="3" class="text-end">
								<button type="button" class="btn active" data-bs-toggle="button" aria-pressed="true" onclick="window.location='boardList.bo'">목록</button>
					  		</td>
					    </tr>
				    </tbody>
				</table>
			<!-- 공지글목록 시작 -->
		<!-- 컨텐츠 끝 -->
		
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>
