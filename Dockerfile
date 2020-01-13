FROM openjdk
WORKDIR /tmp
COPY HelloWorld.java /tmp
RUN javac HelloWorld.java
RUN jar -cvf HelloWorld.java HelloWorld.class
RUN jar -cvf HelloWorld.java HelloWorld.class
RUN java -cp HelloWorld.jar HelloWorld
