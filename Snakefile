rule street_flood:
  input: "db_scripts/STORM_data_flooded_streets_2010-2016.csv"
  output: "db_scripts/flood_events.csv"
  singularity:
    "docker://nvk747/flood_events"
  shell:
    "python prepare_flood_events_table.py"

rule nor_daily:
  input: "hampt_rd_data.sqlite"
  output: "nor_daily_observations.csv"
  singularity:
  	"docker://nvk747/daily_events"
  shell:
    "python make_dly_obs_table.py"

rule combine:
  input: "nor_daily_observations", "flood_events.csv"
  output: "for_model_avgs.csv"
  singularity:
  	"docker://nvk747/daily_flood_comb"
  shell:
    "python by_event_for_model.py"

rule models:
  input: "nor_daily_observations", "flood_events.csv"
  output: "for_model_avgs.csv"
  singularity:
  	"docker://nvk747/hydro_test"
  shell:
    "Rscript final_model_ouput_script.R"
