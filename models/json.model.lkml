connection: "komtas-workshop"

include:"/views/json/*.view"
include: "/map_layers.base.lkml"

datagroup: json_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hours"
}

label: "POC JSON"

persist_with: json_default_datagroup

explore: worldcities {}
