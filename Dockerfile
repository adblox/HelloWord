FROM openjdk
WORKDIR /tmp
ADD HelloWorld.java /tmp
EXPOSE 3030
RUN javac HelloWorld.java
RUN jar -cvf HelloWorld.java HelloWorld.class
ENTRYPOINT ["/usr/bin/java","HelloWorld.java"]
