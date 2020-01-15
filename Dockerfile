FROM python:3
WORKDIR /tmp
ADD HelloWorld.py /tmp
EXPOSE 8080
ENTRYPOINT ["/usr/bin/python","HelloWorld.py"]
