From python:2.7.16

#WORKDIR /usr/src/app

#COPY ~/hampt_rd_data.sqlite ./

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

#wget https://www.hydroshare.org/resource/9e1b23607ac240588ba50d6b5b9a49b5/data/contents/hampt_rd_data.sqlite 

CMD wget https://www.hydroshare.org/resource/9e1b23607ac240588ba50d6b5b9a49b5/data/contents/hampt_rd_data.sqlite && cd group6/db_scripts/ && python ./make_dly_obs_table.py && python ./prepare_flood_events_table.py  && python ./by_event_for_model.py
