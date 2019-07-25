#!/bin/bash

basedir=$PWD

docker pull nvk747/flood_events
docker pull nvk747/daily_events
docker pull nvk747/daily_flood_comb
docker pull nvk747/hydro_test

docker run -v $basedir:/group6 nvk747/flood_events
docker run -v $basedir:/group6 nvk747/daily_events
docker run -v $basedir:/group6 nvk747/daily_flood_comb
docker run -v $basedir:/group6 nvk747/hydro_test
