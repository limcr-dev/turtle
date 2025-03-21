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
     
</style>

<script>
   $(function(){   // 상세페이지가 로딩되면
      // 자동으로 댓글 목록 호출
      comment_list();
   
      // [댓글쓰기 버튼 클릭 1번]
      $('#boardCommentInsert').click(function(){
         comment_add();
      });
      // [삭제 버튼] 클릭시 
      $("#boardDelete").click(function(){
         alert("삭제합니다")
         location.href="${path}/adBoardDelete.ad?boardNo=${dto.boardNo}";
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
            location.reload(true);   // 현재 페이지 새로고침
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
         url: '${path}/adBoardCommentList.ad',
         type: 'POST',
         data: 'boardNo=${dto.boardNo}',
         // 
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
<title>BOARD Detail</title>
<link rel="stylesheet" href="${path}/resources/css/common/leftbar.css">
</head>
<body>
   <div class="wrap">
      <!-- header 시작 -->
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <!-- header 끝 -->
      
      <div id="container">
         <div id="contents">
            <hr>
            <h1 align="center">자유게시판</h1>
            <hr>
            <!-- 컨텐츠 시작 -->
            <div id="section2">
               <!-- 좌측 메뉴 시작 -->                              
               <%@ include file= "/WEB-INF/views/admin/common/adMainLeft.jsp" %>
               <!-- 좌측메뉴 종료 -->
               
               <!-- 문의내용 시작 -->
               <input type="hidden" name="hidden_boardNo" value="${dto.boardNo}">
               <form name ="statusForm" id="statusForm" action="${path}/adBoardList.ad" method="post" style="width:1300px">
               
                  <table class="table" style="width:1050px; margin:auto;">
                     <thead>
                        <tr>
                           <td colspan="7" align="right">
                           <!-- 삭제버튼 시작 -->
                              <!-- Modal 시작 -->
                              <div style="text-align: right">
                                 <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal" >
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
                              </div>
                              <!-- Modal 끝 -->
                           <!-- 수정삭제버튼 끝 -->
                           </td>
                        </tr>
                         <tr>
                           <th style="width:70%">
                              <h2>${dto.boardTitle}</h2>
                           </th>
                           <td align="right" style="width:20%"> 
                              작성자 : ${dto.boardWriter}<br>
                              작성일 : ${fn: substring(dto.boardRegdate,0,16)} 
                           </td>
                         </tr>
                      </thead>
                      <tbody>
                         <tr>
                             <td colspan="7">
                               <p class="text-start"> ${dto.boardContent}</p>
                             </td>
                         </tr>
                         <!-- 댓글 목록 시작 -->
                         <tr>
                            <td colspan="7" >
                               <div id="commentList" align="center">
                                 <!-- 댓글 들어가는 부분 -->
                              </div>
                            </td>
                           
                        </tr>
                        <!-- 댓글 목록 끝 -->
                        <tr>
                           <td colspan="7" align="center">
                              <div class="row g-3 align-items-center">
                                 <div class="col-md-2" style="margin-left:110px">
                                     <h4 style="text-align:left; color:gray">댓글 ${dto.boardCommentCnt}</h4>
                                  </div>
                               </div>
                            </td>
                        </tr>
                         <!-- 댓글 입력칸 시작 -->
                         <tr>
                            <td colspan="7" align="center">
                               <div class="row g-3 align-items-center">
                                 <div class="col-md-2" style="margin-left:80px">
                                 
                                    <h5>댓글 작성</h5>
                                 </div>
                              </div>
                              <div class="row form-group">
                                 <textarea style="width:800px; margin:auto;"name="b_comContent" id="b_comContent" rows="3" class="form-control form-control-lg" placeholder="내용을 입력해주세요"></textarea>
                              </div>
                              <div style="margin-top:8px">
                                 <button type="button" class="btn active" data-bs-toggle="button" aria-pressed="true" id="boardCommentInsert">작성</button>
                              </div>
                             </td>
                        </tr>
                         <!-- 댓글 입력칸 끝 -->
                        
                        <!-- 목록 버튼 -->
                         <tr>
                              <td colspan="7" class="text-end">
                              <button type="button" class="btn active" data-bs-toggle="button" aria-pressed="true" id="adBoardList" onclick="window.location='${path}/adBoardList.ad'">목록</button>
                             </td>
                         </tr>
                      </tbody>
                  </table>
               </form>
               <!-- 문의내용 끝 -->
               
               <!-- 컨텐츠 끝 -->
            </div>
         </div>
      </div>
   </div>
   <!-- footer 시작 -->
   <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   <!-- footer 끝 -->
</body>
</html>
