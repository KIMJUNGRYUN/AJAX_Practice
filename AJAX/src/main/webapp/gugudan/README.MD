## AJAX와 JSP를 이용한 구구단 출력 ##
이 프로젝트는 사용자가 원하는 숫자의 구구단을 출력하는 간단한 AJAX 예제입니다. 클라이언트에서 입력된 숫자를 서버로 보내고, 서버는 해당 숫자의 구구단을 계산하여 클라이언트에 반환합니다.

<hr>

### 프로젝트 구성 ###
1. **클라이언트 (`gugu.html`)**
- 역할:
  - 사용자의 입력을 받아 서버에 요청.
  - 서버의 응답 데이터를 받아 화면에 출력.
- 기술 요소:
  - HTML: 입력창과 버튼, 결과를 보여줄 영역 구성.
  - JavaScript: AJAX 요청과 서버 응답 처리.
2. **서버 (`gugu.jsp`)**
- 역할:
  - 클라이언트로부터 받은 데이터를 처리.
  - 구구단을 계산하여 결과를 클라이언트에 반환.
- 기술 요소:
  - JSP(Java Server Pages): 클라이언트 요청 데이터를 받아 서버에서 계산 및 응답.

<hr>


### 주요 학습 내용 ###
**1. AJAX 요청과 응답**
AJAX를 사용하여 클라이언트와 서버 간 데이터를 비동기적으로 전송합니다. 클라이언트는 사용자가 입력한 값을 서버로 보내고, 서버는 요청된 데이터를 기반으로 결과를 반환합니다.

AJAX 요청 코드
```jsp
const request = new XMLHttpRequest();
request.open('GET', 'gugu.jsp?val=5', true);
request.send();
request.onreadystatechange = function () {
  if (request.readyState == 4 && request.status == 200) {
    console.log(request.responseText); // 서버 응답 데이터
  }
};
```
<hr>
**2. 서버에서 구구단 계산**
JSP 파일은 클라이언트에서 전송된 숫자를 읽고 구구단을 계산하여 결과를 HTML 형식으로 반환합니다.

JSP 구구단 계산 코드
```jsp
<%
    int n = Integer.parseInt(request.getParameter("val")); // 클라이언트로부터 받은 값

    for (int i = 1; i <= 9; i++) {
        String s = String.format(" %d X %d = %d <br>", n, i, n * i);
        out.print(s); // 결과를 출력
    }
%>
```
<hr>

### 전체 코드 ##3
**gugu.jsp**
``jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    int n = Integer.parseInt(request.getParameter("val"));

    for (int i = 1; i <= 9; i++) {
        String s = String.format(" %d X %d = %d <br>", n, i, n * i);
        out.print(s);
    }
%>
```
<hr>

**gugu.html**
```jsp
<!DOCTYPE html>
<html lang="KO">

<head>
  <meta charset="UTF-8">
  <title>AJAX 연습</title>
</head>

<body>
  <h1>원하는 구구단 숫자?</h1>
  <input type="text" placeholder="숫자를 입력하세요">
  <button onclick="sendServer();">출력하기</button>
  <div id="output"></div>
  <script>
    const input = document.querySelector('input[type="text"]');
    const output = document.getElementById('output');
    const request = new XMLHttpRequest(); // AJAX 객체 생성

    function sendServer() {
      let v = input.value;

      // 유효성 검사: 숫자가 아닌 경우 처리
      if (isNaN(v) || v.trim() === "") {
        output.innerHTML = "숫자를 입력해주세요.";
        return;
      }

      // 서버 요청 설정
      let url = "gugu.jsp?val=" + v;
      request.open('GET', url, true);
      request.send(); // 서버로 요청 보내기

      // 서버 응답 처리
      request.onreadystatechange = function () {
        if (request.readyState == 4 && request.status == 200) {
          output.innerHTML = request.responseText; // 결과 출력
        }
      };

      // 요청 실패 처리
      request.onerror = function () {
        output.innerHTML = "요청 실패! 다시 시도해주세요.";
      };
    }
  </script>
</body>

</html>
```
<hr>

### 실행 방법 ###
1. 파일 저장:
  - **`gugu.html`**과 **`gugu.jsp`**를 동일한 디렉토리에 저장합니다.
2. 서버 실행:
  - Apache Tomcat 또는 다른 JSP 실행 환경에서 서버를 실행합니다.
3. 브라우저에서 실행:
  - 브라우저에서 **`gugu.html`**을 열고 원하는 숫자를 입력 후 "출력하기" 버튼을 클릭합니다.
4. 결과 확인:
  - 입력된 숫자에 대한 구구단 결과가 화면에 출력됩니다.

<hr>

### 학습 포인트 ###
1.**AJAX 요청 처리 흐름**:
  - 클라이언트에서 서버로 요청을 보내고, 서버에서 결과를 응답하는 기본 동작을 이해.
2.**JSP에서 동적 데이터 처리**:
  - 요청 데이터를 읽고, 계산 및 HTML 형식으로 응답 데이터 구성.
3.**유효성 검사 및 오류 처리**:
  - 클라이언트 입력값 검증과 AJAX 요청 실패 처리 방법.


