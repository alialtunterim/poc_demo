connection: "komtas-workshop"

include: "/views/basket_analysis/*.view.lkml"                # include all views in the views/ folder in this project
include: "/views/e-commerce/*.view.lkml"

datagroup: basket_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hours"
}

persist_with: basket_default_datagroup

label: "Demo Basket Analysis"   # proje ismini değiştirir

explore: basket_analysis{
  join: order_items{
    sql: ${basket_analysis.product_id}=${order_items.product_id} ;;
    relationship: many_to_one
  }

  join: products {
    sql: ${order_items.product_id}=${products.id} ;;
    relationship: many_to_one
  }

}
