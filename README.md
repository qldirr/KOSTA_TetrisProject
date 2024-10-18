# 🧩 테트리스 그룹웨어(TETRIS GROUPWARE)

> KOSTA 파이널 프로젝트(221024 ~ 221110 : Mybatis 프로젝트/ 221123 ~ 221130 : JPA 프로젝트)

📃 [테트리스 최종 PDF](https://github.com/user-attachments/files/17410146/TETRIS._compressed.pdf)

## 🔹 목차

1. [프로젝트 소개](#프로젝트-소개)
2. [팀원 구성](#팀원-구성)
3. [개발 환경](#개발-환경)
4. [브랜치 전략](#브랜치-전략)
5. [프로젝트 구조](#프로젝트-구조)
6. [프로젝트 설계](#프로젝트-설계)
7. [구현 기능](#구현-기능)


<br/>

## 프로젝트 소개

#### 🖥️ 각기 다른 모양의 7가지 블록을 조합해 나가는 테트리스 게임, 일곱 명의 팀원들이 힘을 합쳐 만든, 어떤 기업에서 사용해도 블록처럼 딱 맞는 그룹웨어
<span>코로나19 이후 비대면 서비스 수요의 급증과 언제 어디서나 업무를 처리할 수 있는 온라인 오피스의 필요성에 맞춰, 팀 프로젝트 관리에 최적화된 협업 도구의 유용성을 강조한 프로젝트입니다.</span>


<br/>

## 팀원 구성
<table style="width: 100%; text-align: center; border-collapse: collapse; table-layout: fixed;">
  <tr>
    <th></th>
    <th style="text-align: center;">김래영</th>
    <th style="text-align: center;">김어진</th>
    <th style="text-align: center;">이화영</th>
    <th style="text-align: center;">장아름</th>
    <th style="text-align: center;">정철빈</th>
    <th style="text-align: center;">차경준</th>
    <th style="text-align: center;">함대현</th>
  </tr>
  <!-- <tr>
    <th style="width: 100% height: 100px;">Profile</th>
    <td style="width: 15% height: 100px;"><img src="https://github.com/user-attachments/assets/6e13c168-e6e0-401b-b4f2-186159794ce4" style="width: 100%; max-width: 100px; height: auto; object-fit: cover;"></td>
    <td style="width: 15% height: 100px;"><img src="https://github.com/user-attachments/assets/78019a73-1bb5-4faa-9212-8d12ed8f753e" style="width: 100%; max-width: 100px; height: auto; object-fit: cover;"></td>
    <td style="width: 15% height: 100px;"><img src="https://github.com/user-attachments/assets/823eff6e-7346-4bbb-9d0c-e27858874dde" style="width: 100%; max-width: 100px; height: auto; object-fit: cover;"></td>
    <td style="width: 15% height: 100px;"><img src="https://github.com/user-attachments/assets/138ae7a3-2fd6-43a3-9db4-dff51e0e47d4" style="width: 100%; max-width: 100px; height: auto; object-fit: cover;"></td>
    <td style="width: 15% height: 100px;"><img src="https://github.com/user-attachments/assets/17ad8da5-ce06-4946-b96a-69384e664582" style="width: 100%; max-width: 100px; height: auto; object-fit: cover;"></td>
    <td style="width: 15% height: 100px;"><img src="https://github.com/user-attachments/assets/bba5ed4f-206b-4768-a900-b744f1e22dd5" style="width: 100%; max-width: 100px; height: auto; object-fit: cover;"></td>
  </tr> -->
  <tr>
    <th>Role</th>
    <td>[팀장] 프로젝트, 전자결재, 알람</td>
    <td>[팀원] 일정관리, 조직도</td>
    <td>[팀원] 메인페이지, 예약</td>
    <td>[팀원] 게시판, 전자결재 문서함</td>
    <td>[팀원] 관리자 ,계정</td>
    <td>[팀원] 채팅</td>
    <td>[팀원] 근태관리</td>
  </tr>
  <tr>
    <th>GitHub</th>
    <td><a href="https://github.com/raevoid">raevoid</a></td>
    <td><a href="https://github.com/qldirr">qldirr</a></td>
    <td><a href="https://github.com/hwa-haha">hwa-haha</a></td>
    <td><a href="/">jangarum</a></td>
    <td><a href="https://github.com/jungchulbin">jungchulbin</a></td>
    <td><a href="https://github.com/joon411">joon411</a></td>
    <td><a href="https://github.com/DevHam94">DevHam94</a></td>
  </tr>
</table>

<br>

## 개발 환경

#### Languages

<img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=OpenJDK&logoColor=white"> <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white">  <img src="https://img.shields.io/badge/css3-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=white">

#### Frameworks
<img src="https://img.shields.io/badge/spring-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white" /> <img src="https://img.shields.io/badge/springboot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white"> <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white"> <img src="https://img.shields.io/badge/JPA-59666C?style=for-the-badge"> <img src="https://img.shields.io/badge/Mybatis-041E42?style=for-the-badge">

#### Libraries

<img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white"> 

#### Databases

<img src="https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white">


#### Development Environment and Tool

<img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white"> <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"> <img src="https://img.shields.io/badge/postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white"> 

#### etc
<img src="https://img.shields.io/badge/FullCanlendar-1976D2?style=for-the-badge"> <img src="https://img.shields.io/badge/websocket-221F20?style=for-the-badge">

<br/>

## 브랜치 전략

> 각 팀원들의 이니셜을 브랜치명으로 지정
```
  Main branch
    ├── kej
    ├── kry
	.
	.
	.
```

<br/>

## 프로젝트 구조

```
TetrisProject_previous(Mybatis version)
├── pom.xml                # Maven 프로젝트 파일
├── src                    # 소스 코드 디렉토리
│   ├── main               # 메인 소스 코드
│   │   ├── java           # Java 소스 파일
│   │   │   └── org        # 패키지 구조
│   │   │       └── tetris
│   │   │           ├── controller/       # 컨트롤러 패키지
│   │   │           ├── domain/           # VO 패키지
│   │   │           ├── handler/          # 특정 비즈니스 로직 처리 패키지
│   │   │           ├── mapper/           # 매퍼 인터페이스 패키지
│   │   │           ├── security/         # Spring Security 핸들러 패키지
│   │   │           └── service/          # 서비스 패키지
│   │   ├── resources/     # 리소스 파일 (예: 설정 파일, XML, 프로퍼티 파일 등)
│   │   |   ├── org.tetris.mapper/     # Mybatis mapper xml 파일
│   │   |   └── application.properties
│   │   └── webapp/        # 웹 애플리케이션 관련 파일 (예: JSP, HTML)
│   │  	    ├── resources/        # css, js, image 등
│   │  	    ├── WEB-INF/        
│   │  	    	└── views/        # 화면 코드(JSP)
│   └── test/              # 테스트 소스 코드
│       ├── java/          # 테스트 Java 파일
│       └── resources/     # 테스트 리소스 파일
└── target/                # 빌드 결과물 (Maven이 생성)
```

```
TetrisProject(JPA version)
│
├── src
│   ├── main
│   |   ├── java
│   |   │   └── com
│   |   │       └── groupware.tetris/
│   |   │           ├── config/                    # 설정 패키지
│   |   │           ├── constant/                  # ENUM 정의 패키지 
│   |   │           ├── controller/                # 컨트롤러 패키지
│   |   │           ├── dto/                       # dto 패키지
│   |   │           ├── entity/                    # JPA 엔티티 패키지
│   |   │           ├── repository/                # JPA 리포지토리 패키지
│   |   │           ├── service/                   # 서비스 패키지
│   |   │           └── TetrisApplication.java     # Spring Boot 애플리케이션 시작 클래스
│   |   │
│   |   └── resources/
│   |   |   └── application.properties             # 애플리케이션 설정 파일
│   |   └── webapp/        # 웹 애플리케이션 관련 파일 (예: JSP, HTML)
│   |  	    ├── resources/        # css, js, image 등
│   |  	    └── WEB-INF/        
│   |  	    	└── views/        # 화면 코드(JSP)
│   └── test/              # 테스트 소스 코드
│       └── java/          # 테스트 Java 파일
│
└── pom.xml                                         # Maven 의존성 관리 파일
```


<br/>

## 프로젝트 설계

- [요구분석 정의서/명세서]()
- [테이블 명세서](https://github.com/qldirr/KOSTA_TetrisProject/wiki/%ED%85%8C%EC%9D%B4%EB%B8%94-%EB%AA%85%EC%84%B8%EC%84%9C)
- [DB 설계]()
- [화면 설계](https://github.com/qldirr/KOSTA_TetrisProject/wiki/%ED%99%94%EB%A9%B4-%EC%84%A4%EA%B3%84)
- [명명법](https://docs.google.com/spreadsheets/d/1HNc-ZaqQZ-kFiQgIQz0s7T5Vf1FtDzkHbhCxXr8LJMw/edit?usp=sharing)

<br/>

## 구현 기능

#### 포르젝트 관리
#### 전자결재
#### 근태관리
#### 일정관리
#### 예약
#### 채팅
#### 로그인/회원가입


<br/>
