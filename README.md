# trainProject  



#### 사용자 모드 : http://localhost:8080/trainProject/train/user/index.do  
#### 관리자 모드 : http://localhost:8080/trainProject/train/admin/login.do?form=form    
  


## 사전 작업 
### 1. connection pool설정  
#### Connection pool설정 -(Servers -> context.xml)
      <Resource name="jdbc/oracle" auth="Container" type="javax.sql.DataSource"
           maxActive="10" maxWait="-1" 
           username="root" 
           password="java" 
           driverClassName="com.mysql.cj.jdbc.Driver"
           url="jdbc:mysql://localhost:3306/train?serverTimezone=UTC"	    
           closeMethod="close"/> 

### 2. mySQL 테이블 및 초기 데이터 구축 (master중 Dump20210228.sql 인포트)  
### 3. 톰캣 실행 
### 4. master중 발표 ppt올려 놓았습니다. 전체 프로세스 확인 원하시는 분은 열람 부탁드립니다.


