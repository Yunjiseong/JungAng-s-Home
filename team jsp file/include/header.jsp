<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>mheader</title>
  <!--css-->
  <link href="../css/bootstrap.css" rel="stylesheet">
  <link href="../css/header.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
  <link rel="stylesheet" href="https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/css/bootstrap.css">
  <!--font-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff">
  <!--script-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://kit.fontawesome.com/86e4aadf8c.js" crossorigin="anonymous"></script>
  <script src="../js/bootstrap.js"></script>
  <script>
    $('#mheader').ready(function () {
      $('#community').removeClass('acup');
      $('#store').removeClass('acup');
      $('#id1').mouseover(function () {
        $('#community').addClass('acup');
        $('#store').removeClass('acup');
      }); //커뮤니티 마우스 이벤트   
      $('#id2').mouseover(function () {
        $('#community').removeClass('acup');
        $('#store').addClass('acup');
      }); //스토어 마우스 이벤트 


    }); //end jquery
  </script>
</head>

<body>


  <nav class="navbar navbar-expand-md fixed-top"
    style="background-color: rgb(255, 255, 255); padding-left: 18em;padding-right: 15em;min-width: max-content;">

    <img class="navbar-brand col-auto container" href="#" img src="../img/logo2.jpg">

    <div class="collapse navbar-collapse container col-auto" id="navbarResponsive"
      style="font-family:'Cafe24SsurroundAir', sans-serif; font-size: 1.2em; ">
      <ul class="navbar-nav ml-auto ">
        <li class="nav-item " id="id1">
          <a class="nav-link" href="#" style="color: black; ">커뮤니티</a>
        </li>
        <li class="nav-item " id="id2">
          <a class="nav-link" href="#" style="color: black;padding-left: 2rem;">스토어</a>
        </li>
      </ul>
    </div>
    <div class="collapse navbar-collapse container col-auto" id="navbarResponsive" style="padding-left:6rem;">
      <form class=" " role="search">
        <div class="input-group">
          <input type="text" class="form-control" placeholder="Search" style="padding-right: 2rem;">
          <div class="input-group-btn " style="align-items: center;">
            <button type="submit" class="btn btn-info"><span class="lnr lnr-magnifier"></span></button>
          </div>
        </div>
      </form>
    </div>
    <div class="container" style="font-family:'Cafe24SsurroundAir', sans-serif; font-size: 1.2em; ">
      <ul class="navbar-nav ml-auto col-auto">
        <li class="nav-item ">
          <a class="nav-link" href="#" style="color: black;"> 로그인</a>
        </li>

        <li class="nav-item ">
          <a class="nav-link" href="#" style="color: black;">회원가입</a>
        </li>
        <li class="nav-item ">
          <a class="nav-link " href="#" style="color: black;">고객센터</a>
        </li>

      </ul>
    </div>


  </nav>
  <nav class="navbar navbar-expand-lg navbar-light bg acup nav-head" id="community"
    style="min-width: max-content;background-color: white;  font-family:'Cafe24SsurroundAir', sans-serif; font-size: 0.95em ;">
    <div class="container ">
      <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav col-auto nav-item2">
          <a class="nav-link" href="#">Home</a>
          <a class="nav-link" href="#">내집뽐내기</a>
          <a class="nav-link" href="#">질문과답변</a>
          <a class="nav-link" href="#">이벤트</a>
        </div>
      </div>
    </div>
  </nav>
  <nav class="navbar navbar-expand-lg navbar-light nav-head" id="store"
    style="background-color: white; font-family:'Cafe24SsurroundAir', sans-serif; font-size: 0.95em ;s">
    <div class="container ">
      <div class="collapse navbar-collapse" id="navbarNavAltMarkup" ">
            <div class=" navbar-nav col-auto">
        <a class="nav-link" href="#">베스트</a>
        <a class="nav-link" href="#" id="header-category"
          onmouseover="document.getElementById('header-cate').style.display = 'block';">카테고리</a>
        <a class="nav-link" href="#">전문가의손길</a>
      </div>
    </div>
    </div>
  </nav>
  <div class="header-categorys col-auto nav-head2" id="header-cate"
    onmouseleave="document.getElementById('header-cate').style.display = 'none';">
    <ul style="font-family:'Cafe24SsurroundAir', sans-serif; ">
      <li class="category-item "><a href="#" style="color: black;">
          <i class="fas fa-couch fa-2x"></i><br>가구</a></li>
      <li class="category-item "><a href="#" style="color: black;">
          <i class="fas fa-bed fa-2x"></i><br>패브릭</a></li>
      <li class="category-item "><a href="#" style="color: black;">
          <i class="fas fa-tv fa-2x"></i><br>가전</a></li>
      <li class="category-item "><a href="#" style="color: black;">
          <i class="fas fa-sink fa-2x"></i><br>주방용품</a></li>
      <li class="category-item "><a href="#" style="color: black;">
          <i class="fas fa-laptop-house fa-2x"></i><br>생활용품</a></li>
      <li class="category-item "><a href="#" style="color: black;">
          <i class="fas fa-box fa-2x"></i><br>수납</a></li>
      <li class="category-item "><a href="#" style="color: black;">
          <i class="fas fa-hiking fa-2x"></i><br>캠핑용품</a></li>
      <li class="category-item "><a href="#" style="color: black;">
          <i class="fas fa-dog fa-2x"></i><br>애완운동</a></li>
    </ul>
  </div>


</body>



</html>