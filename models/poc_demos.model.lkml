# Define the database connection to be used for this model.
connection: "komtas-workshop"

include: "/views/e-commerce/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: poc_demos_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: poc_demos_default_datagroup

label: "POC Demo(e-com)"   # proje ismini değiştirir

explore: order_items {
  label: "Demo POC model (e-commerce)"   # model ismini değiştirir
  description: "Demolarda kullanılacak POC"   # proje açıklaması
  #persist_for: "0  seconds"

  join: orders {
    relationship: many_to_one
    sql_on: ${orders.order_id} = ${order_items.order_id} ;;
  }

  join: products {
    relationship: many_to_one
    sql_on: ${products.id}=${order_items.product_id} ;;
  }

  join: distribution_centers {
    relationship: many_to_one
    sql_on: ${distribution_centers.id}=${products.distribution_center_id} ;;
  }

  join: inventory_items {
    relationship: many_to_one
    sql_on: ${inventory_items.product_id}=${products.id} ;;
    # and ${inventory_items.id}=${order_items.inventory_item_id};;
  }

  join: events{
    relationship: many_to_one
    sql_on: ${events.user_id}=${order_items.user_id}
      and ${events.user_id}=${orders.user_id};;
  }

  join: users {
    relationship: many_to_one
    sql_on: ${users.id}=${events.user_id} ;;
  }

}
