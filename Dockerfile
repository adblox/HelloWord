FROM ubuntu:16.04
WORKDIR /tmp
ADD HelloWorld.py /tmp
EXPOSE 8080
ENTRYPOINT ["python3"]
CMD[ "HelloWorld.py" ]
