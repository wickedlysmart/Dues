Dues
====

점심주문어플(웹서비스연동,Rails,RESTful,CRUD구현)

DATA 설계
<br><br>   Dues <br> 
- Attributes <br>
  name:string   <br>
  price:decimal<br>
  menu:string <br>


1. 연동할 간단한 웹싸이트 제작 ( Ruby on Rails 이용 ) 

WebSite URL : http://coffeetoast.dyndns.org:3000/dues<br>

-> Rails 로 제작. <br>
-> 간단한 게시판 제작  ( XML , JSON 서비스 제공 ) <br>
-> rails g scaffold due name:string price:decimal menu:string ( Data 설계 적용) <br>
-> CSS 수정. <br>

2. iPhone Application ( xcode part ) 연동 

DATA 설계 
1. Array(or 아카이빙 ) 
2. sqlite
3. CoreData <br>

-> 간단한 구조임으로 1번으로 data 주고 받음. <br>
-> REQUEST 방식은 HTTP RESTful 로 연동. (post, get) <br>
-> xcode ARC 사용시 효율적인  NSRails Framework 사용 (  json , xml parser 및 async )<br>
->Foundation 프래임워크에 url loading system을 사용할수 있으나 많은 delegate 작성으로 인해 <br>
     그 보다는 ^() block coding 적용으로 효율적인 NSRails Framework사용.  (참고 : http://dingbat.github.io/nsrails/) <br>
-> CRUD 기능 구현. <br>
<br>

![alt tag](https://raw.github.com/wickedlysmart/Dues/master/Dues/screenshot01.png)

