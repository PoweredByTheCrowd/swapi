FROM python:2

RUN mkdir -p /opt/app

WORKDIR /opt/app
COPY ./ /opt/app

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get -y install libmemcached-dev
RUN make install
RUN make build
RUN make load_data


CMD ["python", "./manage.py", "runserver", "0.0.0.0:8000"]