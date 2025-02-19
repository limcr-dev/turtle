# csv 처리 라이브러리 불러오기기
import pandas as pd
import google.generativeai as genai
import streamlit as st

with open('D:/DEV/workspace_team_pj/team_pj/turtle/src/main/webapp/WEB-INF/views/common/Google_api.txt','r', encoding='utf-8') as f:
    gemini_key = f.read().strip()

st.title("Turtle Gym chatbot")

st.link_button("회원 가입", "http://localhost/turtle/join.do")
st.link_button("상담 예약", "http://localhost/turtle/reservation.do")

# turtlegym_info 파일 경로
file_path = "turtlegym_info.csv"
genai.configure(api_key=gemini_key)

# Gemini 설정
genai.GenerationConfig(
    max_output_tokens=1000,
    temperature=0.1
)

# turtlegym_info.csv 불러오기
data = pd.read_csv(file_path)

@st.cache_resource
def load_model():
    model = genai.GenerativeModel('gemini-1.5-flash')
    return model

model = load_model()

info_show = data[data["공개"] == "Y"]

info =[]

# 챗봇 응답 리스트를 딕셔너리화(항목, 응답)
for index, row in info_show.iterrows():
    info.append(
        {"subject":row["항목"],
         "answer":row["내용"]}
    )

if "chat_session" not in st.session_state:
    # 채팅 세션 초기화(챗 시작)
    st.session_state["chat_session"] = model.start_chat(history=[]) 
    
if prompt := st.chat_input("터틀짐 챗봇입니다. 무엇을 도와드릴까요? :"):
    with st.chat_message("user"):
        st.markdown(prompt)
    with st.chat_message("ai"):
        message_placeholder = st.empty()
        # 전체 메시지
        full_response = ""
        # 파일을 참조하여 답변하도록 입력 변수 수정
        question = f"""{prompt} {info}"""
        # 글자를 타이핑하듯이 출력하는 기능
        with st.spinner("메시지 답변 처리 중 입니다."):
            response = st.session_state.chat_session.send_message(question, stream=True)
            for chunk in response:
                #각각의 답변들을 모아서 하나로 만듬
                full_response += chunk.text
                #세션을 유지하면서 답변을 하는 과정
                message_placeholder.markdown(full_response)

