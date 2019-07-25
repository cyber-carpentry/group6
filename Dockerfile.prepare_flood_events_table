From python:2.7.16

#WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

CMD cd group6/db_scripts/ && python ./prepare_flood_events_table.py
