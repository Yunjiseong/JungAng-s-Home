<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>  회원가입  </title> 
  <link rel="shortcut icon" href="../img/home-icon.png">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <style>
    body {
      min-height: 100vh;
      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
    }

    .input-form {
      max-width: 680px;
      margin-top: 80px;
      padding: 32px;
      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
    .invalid-checkbox{
      border: #000 solid;
      border-radius: 10px;
      background-color:#92b5db ;
    }
    .code{
      margin-top: 10px;
    }
  </style>
</head>

<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
        <form action="userJoin" method="post" class="validation-form" novalidate>
          <div class="mb-3"> <label for="email">이메일</label> <input type="email" class="form-control" id="email"
              placeholder="you@example.com" required name="id">
            <div class="invalid-feedback"> 이메일을 입력해주세요. </div>
          </div>
          <div class="col-md-6 mb-3"> <label for="email-code">인증코드</label> <input type="text" class="form-control"
            id="email-code" placeholder="" value="" required>
            <button class="btn btn-primary code" type="submit">인증확인</button>
          </div>
          <div class="row">
            <div class="col-md-6 mb-3"> <label for="name">이름</label> <input type="text" class="form-control" id="name"
                placeholder="" value="" required name="name">
              <div class="invalid-feedback"> 이름을 입력해주세요. </div>
            </div>
            <div class="col-md-6 mb-3"> <label for="nickname">닉네임</label> <input type="text" class="form-control"
                id="nickname" placeholder="" value="" required name="nickName">
              <div class="invalid-feedback"> 닉네임을 입력해주세요. </div>
            </div>
          </div>
            
          <div class="mb-3"> <label for="password">비밀번호</label> <input type="password" class="form-control" id="pw"
            placeholder="비밀번호를 적어주세요" required name="pw">
          <div class="invalid-feedback"> 비밀번호. 
          </div>
          <div class="mb-3"> <label for="passwordCH">비밀번호확인</label> <input type="password" class="form-control" id="pw"
            placeholder="비밀번호를 다시 한번 적어주세요" required>
          <div class="invalid-feedback"> 비밀번호 확인해주세요. 
          </div>
          <div class="mb-3"> <label for="phone">전화번호</label> <input type="text" class="form-control" id="phone"
            placeholder="-없이 입력해주세요" required name="phone">
          <div class="invalid-feedback"> 전화번호를 입력해주세요. </div>
        </div> 

          <div class="mb-3"> <label for="address">주소</label> <input type="text" class="form-control" id="address"
              placeholder="서울특별시 강남구" required name="addrBasic">
            <div class="invalid-feedback"> 주소를 입력해주세요. </div>
          </div> 
          <div class="mb-3"> <label for="address2">상세주소<span class="text-muted">&nbsp;(필수 아님)</span></label> <input
              type="text" class="form-control" id="address2" placeholder="상세주소를 입력해주세요." name="addrDetail"> </div>
          <div class="row">
            <div class="col-md-8 mb-3"> <label for="Attention">관심분야</label>
               <div class=invalid-checkbox>
                  <label><input type="checkbox" name="#" value="Attention-1">가구</label>
                  <label><input type="checkbox" name="#" value="Attention-2"> 패브릭</label>
                  <label><input type="checkbox" name="#" value="Attention-3"> 조명</label>
                  <label><input type="checkbox" name="#" value="Attention-4"> 장식/소품</label><br>
                  <label><input type="checkbox" name="#" value="Attention-5"> 가전</label>
                  <label><input type="checkbox" name="#" value="Attention-6"> 생필품</label>
                  <label><input type="checkbox" name="#" value="Attention-7"> 캠핑용품</label>
                  <label><input type="checkbox" name="#" value="Attention-8"> 주방용품</label>
               </div>
              
              </select>
              
            </div>
           
          <div class="mb-4"></div> <button class="btn btn-primary btn-lg btn-block" type="submit">회원가입</button>
        </form>
      </div>
    </div>
  </div>



</body>

</html>