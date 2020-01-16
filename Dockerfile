FROM python:3
WORKDIR /tmp
ADD HelloWorld.py /tmp
RUN pip install flask
RUN pip install flask_restful
EXPOSE 3333
ENTRYPOINT ["python3"]
CMD ["python","./HelloWorld.py"]
