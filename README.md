# trainProject


#### Connection pool설정 -(Servers -> context.xml)
   <Resource name="jdbc/oracle" auth="Container" type="javax.sql.DataSource"
        maxActive="10" maxWait="-1" 
        username="root" 
        password="java" 
        driverClassName="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/train?serverTimezone=UTC"	    
        closeMethod="close"/> 


#### 사용자 모드 : http://localhost:8080/trainProject/train/user/index.do  
#### 관리자 모드 : http://localhost:8080/trainProject/train/admin/login.do?form=form  
