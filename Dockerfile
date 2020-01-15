FROM openjdk
WORKDIR /tmp
ADD HelloWorld.java /tmp
EXPOSE 8080
RUN javac HelloWorld.java
RUN jar -cvf HelloWorld.java HelloWorld.class
RUN jar -cvf HelloWorld.java HelloWorld.class
RUN java -jar HelloWorld.jar --port=8080
ENTRYPOINT ["/usr/bin/java,"HelloWorld.java"]
