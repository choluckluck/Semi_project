# 👠 Sue Shop 👠
HTML, CSS, JAVASCRIPT, JAVA, OARCLE 등 프로그래밍 언어들을 활용하여 JSP의 MVC 패턴 기법을 적용한 쇼핑몰 웹 사이트입니다 (⑅˃◡˂⑅)
<br>
- **프로젝트 선정 이유** : 사용자가 쉽게 접할 수 있는 쇼핑몰의 다양한 기능을 구현해 보기 위함
- **프로젝트 목표**
	- 사용자가 쉽게 접할 기회가 많은 사이트를 구현
	- 기본적인 기능을 구현하고 예외 케이스를 고려하며 개발
- **참고사이트** : [지니킴](https://jinnykimcollection.co.kr/)
<br>


<br>

## 1. 프로젝트 진행 기간
>  2022.9.13 ~ 2022.10.14
![세미 일정](https://user-images.githubusercontent.com/109951309/210312656-8403f691-049d-4633-a5ca-85fc103fd174.png)

<br>

## 2. 개발환경 🌈
- OS : Windows 10 , windows 11 <br>
- DB : Oracle18C
- WAS : Apache Tomcat 9.0.65
- Front-end : <img src="https://img.shields.io/badge/HTML5-00599C?style=flat-square&logo=HTML5&logoColor=white"/> <img src="https://img.shields.io/badge/CSS-A8B9CC?style=flat-square&logo=C&logoColor=white"/> <img src="https://img.shields.io/badge/javascript-F6C915?style=flat-square&logo=javascript&logoColor=white"/> <img src="https://img.shields.io/badge/jQuery-red?style=flat-square&logo=jQuery&logoColor=white"/> <img src="https://img.shields.io/badge/AJAX -black?style=flat-square&logo=AJAX &logoColor=white"/>
- Back-end : <img src="https://img.shields.io/badge/JDK 1.8-important?style=flat-square&logo=JDK &logoColor=white"/> <img src="https://img.shields.io/badge/JSP-yellowgreen?style=flat-square&logo=JSP&logoColor=white"/> <img src="https://img.shields.io/badge/JSTL-blue?style=flat-square&logo=JSTL&logoColor=white"/>
- 🛠️ Developer Tools 🛠️ : ![이클립스](https://user-images.githubusercontent.com/109951309/210313986-38aeff61-0315-4acf-9cd3-27e76f7800a1.svg) <img src="https://img.shields.io/badge/eXERD-brightgreen?style=flat-square&logo=eXERD&logoColor=white"/> <img src="https://img.shields.io/badge/SqlDeveloper-9cf?style=flat-square&logo=SqlDeveloper &logoColor=white"/> <img src="https://img.shields.io/badge/gitHub-blueviolet?style=flat-square&logo=gitHub&logoColor=white"/>
- 사용한 API : GoogleMail / DatePicker / iamport

<br>


	
## 3. 주요 기능

```sh
- 로그인 / 회원가입 기능
- 제품 검색 / 검색 필터 기능
- 관심상품 / 장바구니 기능
- 결제 기능
- 리뷰 / 문의 기능
- 공지사항 기능
- 마이페이지 기능
- 관리자 기능
```
<br>


## 4. 팀원 🧑‍🚀 
```
김성민 - 관리자, 상품상세
김혜준 -
조하솔 - 로그인 및 회원가입, 관심상품, 결제, 관리자
진혜린 - 메인, 상품상세, 결제, 관리자
최지희 - 
```
<br>


## 5. 화면 설계 및 기능 구현	

### 로그인 및 회원가입
- 로그인: 로그인 및 아이디/비밀번호 찾기
<p align="center"><img src="https://user-images.githubusercontent.com/111223575/210715204-bcd60a1e-cb30-418a-856b-61ad59e486da.png" width="40%"/></p>

- 회원가입: 유효성 검사 및 회원가입<br>
<p align="center"><img src="https://user-images.githubusercontent.com/111223575/210717335-d59f5348-f6e2-4ffb-922e-cff49c977960.png" width="70%"/></p>

<br><br>
### 메인
- 메인이미지, Best, New, MD추천 노출
<img src="https://user-images.githubusercontent.com/109951309/210718178-63249322-932c-4d87-93e5-b3471143fbba.png"/>

<br><br>
### 상품상세
- 상품 정보, 리뷰/문의 조회
- 컬러/사이즈 선택 후 위시/카트 담기
<img src="https://user-images.githubusercontent.com/109951309/210718267-d227f049-2d99-4817-be52-c1881a5f37ec.png"/>


<br><br>
### 상품주문
- 적립금 사용, 상품주문금액에 따른 적립금 적립
- iamport를 이용한 결제시스템
<img src="https://user-images.githubusercontent.com/109951309/210718606-ca30359b-36f6-4269-8ab2-3b205aab99ee.png" width="100%"/><br>
<p align="center"><img src="https://user-images.githubusercontent.com/109951309/210718619-7b40f281-9eb9-48de-86c4-b9a03dcfae4a.png" width="85%"/></p>

<br><br>
### 관리자
- 상품목록/재고, 상품등록, 상품리뷰 조회 및 관리
- 주문 조회/관리 및 배송상태 관리
- 회원 조회 및 탈퇴관리
- 문의/문의상품 관리
![관리자페이지-min](https://user-images.githubusercontent.com/109951309/210719249-3f7c0c27-2258-4479-b95b-58cca7d61b05.gif)

<br><br>
### 마이페이지
- 메인 : 고객의 등급, 적립금 및 주문 금액 노출, 최근 주문 내역 및 관심상품 간략히 노출
![마이페이지_메인](https://user-images.githubusercontent.com/113486287/210725291-cc7087a9-4c49-463e-b372-e59b8da2cd18.jpg)


- 주문 내역, 금액 등 주문조회.
- 관심상품 내역 조회. 관심상품 장바구니 등록 및 삭제.
- 회원정보 수정.
- 리뷰 및 문의내역 관리 (작성, 수정 및 삭제)
![녹화_2023_01_05_16_00_38_756](https://user-images.githubusercontent.com/113486287/210726418-11a2a6bc-0a48-439b-9408-323f2e74de95.gif)


<br><br>
## ERD
![세미 erd](https://user-images.githubusercontent.com/109951309/210314276-054bc2a9-5ef1-4e1d-992d-dade3f24f961.png)
	

