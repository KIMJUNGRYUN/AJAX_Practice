## AJAX와 JSP를 이용한 간단한 총합 계산기
이 프로젝트는 사용자가 입력한 숫자를 기반으로 1부터 해당 숫자까지의 합을 계산하여 출력하는 AJAX 연습 예제입니다.

### 파일 구성
- **`ex1.html`**: 클라이언트에서 숫자를 입력하고 서버에 요청을 보냄.
- **`sum.jsp`**: 서버에서 요청을 처리하고 총합을 계산하여 클라이언트로 응답.
```jsp
<!DOCTYPE html>
<html lang="KO">

<head>
  <meta charset="UTF-8">
  <title>AJAX 연습</title>
</head>

<body>
  <h1>1부터 빈칸에 적은 숫자까지 총합은?</h1>
  <input type="text">
  <button onclick="sendServer();">계산하기</button>
  <div id="output"></div>
  <script>
    const input = document.querySelector('input[type="text"]');
    const output = document.getElementById('output');
    const request = new XMLHttpRequest(); // AJAX 객체 생성

    function sendServer() {
      // 입력값 가져오기
      let v = input.value;

      // 유효성 검사: 숫자가 아니거나 빈 값인 경우 처리
      if (isNaN(v) || v.trim() === "") {
        output.innerHTML = "숫자를 입력해주세요.";
        return;
      }

      // 요청 보낼 URL 설정
      let url = "sum.jsp?val=" + v;

      // AJAX 요청 초기화
      request.open('GET', url, true);
      request.send(); // 서버에 요청 보내기

      // 서버 응답 처리
      request.onreadystatechange = function () {
        if (request.readyState == 4 && request.status == 200) {
          let val = request.responseText; // 서버에서 반환된 값
          output.innerHTML = val; // 결과 출력
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
