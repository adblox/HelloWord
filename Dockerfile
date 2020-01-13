FROM openjdk
COPY HelloWorld.java /var/lib/docker/tmp/docker-builder385504689
RUN javac HelloWorld.java
RUN jar -cvf HelloWorld.java HelloWorld.class
RUN jar -cvf HelloWorld.java HelloWorld.class
RUN java -cp HelloWorld.jar HelloWorld
