rule all:
  input: "db_scripts/for_model_avgs.csv","db_scripts/STORM_data_flooded_streets_2010-2016.csv","db_scripts/nor_daily_observations.csv","db_scripts/flood_events.csv"
rule street_flood:
  input: "db_scripts/STORM_data_flooded_streets_2010-2016.csv"
  output: "db_scripts/flood_events.csv"
  shell:
    """
    docker://nvk747/flood_events
    docker run -v ~/group6/:/group6 nvk747/flood_events:latest
    """
rule nor_daily:
  input: "db_scripts/STORM_data_flooded_streets_2010-2016.csv"
  output: "db_scripts/nor_daily_observations.csv"
  shell:
    """
    docker://nvk747/daily_events
    docker run -v ~/group6/:/group6 nvk747/daily_events:latest
    """
rule combine:
  input: "db_scripts/nor_daily_observations.csv", "db_scripts/flood_events.csv"
  output: "db_scripts/for_model_avgs.csv"
  singularity:
        "docker://nvk747/daily_flood_comb"
  shell:
    """
    docker://nvk747/daily_flood_comb
    docker run -v ~/group6/:/group6 nvk747/daily_flood_comb:latest
    """
rule models:
  input: "for_model_avgs.csv"
  output: "poisson_out_test.csv","poisson_out_train.csv", "rf_out_train.csv", "rf_out_test.csv", "rf_impo_out"
  singularity:
        "docker://nvk747/hydro_test"
  shell:
    "Rscript final_model_output_script.R"