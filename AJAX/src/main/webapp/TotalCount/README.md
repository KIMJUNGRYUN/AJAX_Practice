## AJAX와 JSP를 이용한 1부터 n까지 합계 계산기
이 프로젝트는 **AJAX**와 **JSP**를 활용하여 클라이언트와 서버 간의 데이터 통신을 연습하는 간단한 예제입니다. 사용자가 숫자를 입력하면 서버에서 1부터 해당 숫자까지의 합을 계산하여 클라이언트에 반환합니다.



### 프로젝트 구성###
**1.클라이언트(`ex1.html`)**
- **역할**
    - 사용자의 입력을 받아 서버에 전달.
    - 서버의 응답 데이터를 받아 화면에 출력.
- **기술 요소**:
    - HTML: 입력창과 버튼, 결과를 보여줄 영역 구성.
    - JavaScript: AJAX 요청과 서버 응답 처리.


**2.클라이언트(`sum.jsp`)**
- **역할**:
  - 클라이언트로부터 받은 데이터를 처리.
  - 1부터 n까지의 합을 계산.
  - 계산 결과를 클라이언트로 반환.
- **기술 요소**:
  - JSP(Java Server Pages): 클라이언트 요청 데이터를 받아 서버에서 계산 및 응답.
  <hr>

  ## 주요 학습 내용 ##
**1.AJAX 요청과 응답**
AJAX(Asynchronous JavaScript and XML)는 클라이언트와 서버 간의 비동기 데이터 전송을 가능하게 합니다. 이 프로젝트에서는 XMLHttpRequest 객체를 사용하여 서버에 GET 요청을 보냅니다.
**주요 메서드**
- **`open(method, url, async)`**: 요청 초기화 (GET/POST 방식, URL 설정, 비동기 여부 지정).
- **`send(data)`**: 서버로 요청 데이터 전송.
- **`onreadystatechange`**: 요청 상태 변화에 따라 실행될 함수.
    - **`readyState == 4`**: 요청 완료.
    - **`status == 200`**: 요청 성공.
```jsp
const request = new XMLHttpRequest();
request.open('GET', 'sum.jsp?val=5', true);
request.send();
request.onreadystatechange = function () {
  if (request.readyState == 4 && request.status == 200) {
    console.log(request.responseText); // 서버 응답 데이터
  }
};
```
<hr>

**2.서버에서 데이터 처리 (JSP)**
JSP는 Java 기반의 서버 스크립트 언어로 클라이언트 요청을 처리합니다. 클라이언트가 전송한 데이터를 받아 필요한 로직(여기서는 합계 계산)을 수행하고 결과를 반환합니다.

**주요 구성 요소**

**1.`request.getParameter`**("paramName"): 클라이언트에서 전달된 데이터를 가져옴.

**2.`비즈니스 로직`**: 1부터 입력된 숫자까지의 합을 계산.

**3.`out.print(data)`**: 클라이언트에 결과를 반환.

```jsp
<%
    int n = Integer.parseInt(request.getParameter("val"));
    int total = 0;
    for (int i = 1; i <= n; i++) {
        total += i;
    }
    out.print(total); // 결과 반환
%>
```
  
  
