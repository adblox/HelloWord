FROM openjdk
WORKDIR /tmp
ADD HelloWorld.java /tmp
RUN javac HelloWorld.java
RUN jar -cvf HelloWorld.java HelloWorld.class
ENTRYPOINT ["/usr/bin/java,"HelloWorld.java"]
