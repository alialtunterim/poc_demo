connection: "komtas-workshop"


include: "/views/e-commerce/*.view.lkml"

datagroup: poc_demos_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM table_name;
  # sql_trigger: SELECT MAX(order_item_id) from order_items ;;
  # sql_trigger: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*6)/(60*60*24));;
  max_cache_age: "24 hours"
}

persist_with: poc_demos_default_datagroup

explore: order_items {}
