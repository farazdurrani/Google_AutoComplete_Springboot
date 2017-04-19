A TODO list to make a Spring Boot project to serve JSPs like Spring MVC.

1) Setup viewresolver in application.properties file. Like this: 

spring.mvc.view.prefix: /WEB-INF/jsp/
spring.mvc.view.suffix: .jsp

No need to add @Configuration file and create beans that return ViewResolver, etc. 

2) If you setup viewresolver like above in application.properties file, then you will need to create folders manually at /src/main/. So you will have to create webapp folder, then WEB-INF folder, then jsp folder. Then you will place jsp files inside that jsp folder. SO in the end, your jsp files will reside in: /src/main/webapp/WEB-INF/jsp/anyname.jsp

3) the newly created Spring boot project doesn't have the following dependencies. You will have to add them by yourself in pom.xml 
<dependency>
			<groupId>org.apache.tomcat.embed</groupId>
			<artifactId>tomcat-embed-jasper</artifactId>
			<scope>provided</scope>
</dependency>
<dependency>
			<groupId>javax.servlet</groupId>
			<artifactId>jstl</artifactId>
</dependency>	

That tomcat dependency is not anything from outside. Your project will still work like a spring boot project. You will still not be pressing the start/stop button to start/stop the server. You still just press the RUN button and the server will still start automatically. So why add that dependency? That dependency is already provided by Spring boot. the important thing in that dependency is <scope>provided</scope>. In our case, this scope makes sure that our jsps are served properly. 
And that jstl dependency is important for JSTL or JSP tags or EL Expression to work inside our JSPs. 

And that's it. Now our Spring boot project is ready to serve JSPs and work like a Spring MVC project. 
