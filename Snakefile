rule all:
    input:
        "db_scripts/for_model_avgs.csv"

rule docker_prepare_flood_events_table:
    input: "db_scripts/STORM_data_flooded_streets_2010-2016.csv"
    output:"docker_pfet.csv"
    shell:'''
    docker build -t pfet -f Dockerfile.prepare_flood_events_table .
    echo "pfet docker built" > docker_pfet.csv
    '''

rule docker_by_event_for_model:
    input: "db_scripts/STORM_data_flooded_streets_2010-2016.csv"
    output: "docker_befm.csv"
    shell:'''
    docker build -t befm -f Dockerfile.by_event_for_model .
    echo "befm docker built" > docker_befm.csv
    '''

rule docker_make_dly_obs_table:
    input: "db_scripts/STORM_data_flooded_streets_2010-2016.csv"
    output: "docker_mdot.csv"
    shell:'''
    docker build -t mdot -f Dockerfile.make_dly_obs_table .
    echo "mdot docker built" > docker_mdot.csv
    '''

rule make_dly_obs_table:
    input: "docker_mdot.csv"
    output: "db_scripts/nor_daily_observations.csv"
    shell:'''
    docker run -v ~/group6test:/group6 mdot
    '''

rule prepare_flood_events_table:
    input: "docker_pfet.csv"
    output:
        "db_scripts/flood_events.csv"
    shell:'''
        docker run -v ~/group6test:/group6 pfet
    '''

rule by_event_for_model:
    input: "db_scripts/nor_daily_observations.csv",
           "db_scripts/flood_events.csv",
           "docker_befm.csv"
    output: "db_scripts/for_model_avgs.csv"
    shell:'''
    docker run -v ~/group6test:/group6 befm
    '''

