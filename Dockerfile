FROM python:3
WORKDIR /tmp
ADD HelloWorld.py /tmp
RUN pip install flask
RUN pip install flask_restful
ENTRYPOINT ["python","./HelloWorld.py"]
