FROM python:3-alpine
RUN apk add gcc musl-dev linux-headers
COPY startup.sh requirements.txt /
RUN chmod 0755 /startup.sh
RUN pip install -r /requirements.txt
RUN adduser -D jupyterlab
USER jupyterlab
WORKDIR /home/jupyterlab
CMD /startup.sh
