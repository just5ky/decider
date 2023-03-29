FROM python:3.11-bullseye

COPY ./requirements.txt /requirements.txt
RUN pip install --no-cache-dir --requirement /requirements.txt

RUN apt-get update && \
    apt-get install dos2unix && \
    apt-get autoclean -y

COPY /app /app
COPY ./docker/web/root_files/* /
COPY decider.py /decider.py

RUN dos2unix /entrypoint.sh

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
