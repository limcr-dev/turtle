from flask import Flask # 웹 서버 구현을 위한 Flask 객체를 import
from flask_restx import Api, Resource # Api 구현을 위한 Api 객체 import

app = Flask(__name__) # Flask 객체 선언, 파라미터로 어플리케이션 패키지 이름 넣기
api = Api(app) # Flask 객체에 Api 객체 등록

@api.route('/hello') # 데코레이터 이용, '/hello' 경로에 클래스 등록
class Hello(Resource):
    def get(self): # GET 요청시 리턴 값에 해당하는 딕셔너리를 JSON 형태로 반환
        return {"Hello" : "world!"}

if __name__=="__main__":
    app.run(debug=True, host='0.0.0.0', port=80)
