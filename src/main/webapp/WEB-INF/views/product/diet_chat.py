# csv 처리 라이브러리 불러오기기
import pandas as pd
import google.generativeai as genai
from google import genai

with open('D:/DEV/workspace_team_pj/team_pj/turtle/src/main/webapp/WEB-INF/views/common/Google_api.txt','r', encoding='utf-8') as f:
    gemini_key = f.read().strip()

client = genai.Client(api_key=gemini_key)

response = client.models.generate_content_stream(
    model = "gemini-1.5-flash",
    contents = ["헬스 7일치 식단을 만들어 줄래?"])
for chunk in response:
    print(chunk.text, end="")
