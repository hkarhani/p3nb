FROM alpine:edge

MAINTAINER Hassan El Karhani <hkarhani@gmail.com>

RUN apk update && apk add build-base libzmq musl-dev python3 python3-dev zeromq-dev
RUN pip3 install --upgrade pip

RUN mkdir -p /notebooks

WORKDIR /notebooks

COPY requirements.txt ./

RUN pip3 install --no-cache-dir -r requirements.txt

ADD jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

EXPOSE 8888

CMD /bin/sh -c "/usr/bin/jupyter notebook --allow-root"