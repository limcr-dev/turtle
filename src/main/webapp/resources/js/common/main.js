// 반응형 웹 => 햄버거 버튼 클릭 시 아래에 메뉴 나오게 설정

// document(html영역)에서 ""를 찾아라
let toggleBtn = document.querySelector(".navbar_toggleBtn"); // 햄버거 버튼 검색
let menu = document.querySelector(".navbar_menu"); // 메뉴 검색
let icons = document.querySelector(".navbar_icons"); // 아이콘 검색


// 버튼에 이벤트 추가
toggleBtn.addEventListener('click', () => { // 버튼을 클릭할 때
	menu.classList.toggle('active'); // 클래스리스트의 토글에 접근할 때 메뉴 활성화
	icons.classList.toggle('active'); // 아이콘 활성화
}); 

// main.jsp로 가서 작동되도록 연결