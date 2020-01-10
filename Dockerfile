FROM busybox
COPY abc.txt .
RUN cat /abc.txt
EOF
