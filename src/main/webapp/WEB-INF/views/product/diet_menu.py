# 플라스크 앱을 만들기 위한 flask 모듈 불러오기
from flask import Flask, request
# 챗을 진행할 Google gemini 모듈 불러오기
import google.generativeai as genai
# 챗 화면을 불러올 Streamlit 모듈 불러오기
#import streamlit as st
from flask_cors import CORS

app = Flask(__name__)

cors = CORS(app, resources={r"/turtle/*": {"origins": "*"}})

# Google genimi를 사용하기 위한 API 키 파일(보안 목적으로 분리) 불러오기
with open('D:/DEV/workspace_team_pj/team_pj/turtle/src/main/webapp/WEB-INF/views/common/Google_api.txt', 'r',
          encoding='utf-8') as f:
    gemini_key = f.read().strip()

# Google gemini 사용을 위한 API 키 입력
genai.configure(api_key=gemini_key)

# Gemini 설정
genai.GenerationConfig(
    max_output_tokens=1000,
    temperature=0.1
)

model = genai.GenerativeModel('gemini-1.5-flash')

@app.route('/turtle/products/diet_menu', methods=['POST'])
def display_message():
    message = request.data.decode('utf-8')

    msg = "최신 트랜드로" + message + "를 고려한 7일치 식단을 만들어 줄래?"
    response = model.generate_content(msg)
    res = response.text

    print(res)

    return res

if __name__=='__main__':
    app.run(debug=True)