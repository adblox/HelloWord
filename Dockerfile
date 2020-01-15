FROM openjdk
WORKDIR /tmp
ADD HelloWorld.java /tmp
EXPOSE 8080
ENTRYPOINT ["javac,"HelloWorld.java"]
