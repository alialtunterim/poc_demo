connection: "komtas-workshop"

include: "/views/performance/*.view.lkml"

include: "/views/*.view.lkml"

datagroup: performance_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hours"
}

persist_with: performance_default_datagroup

label: "DEMO Performance"

explore: taxi_trips {
  label: "Chicago taxi trips"
}
