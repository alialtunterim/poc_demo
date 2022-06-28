# Define the database connection to be used for this model.
connection: "komtas-workshop"

include: "/views/e-commerce/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: poc_demos_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hours"
}

persist_with: poc_demos_default_datagroup

label: "POC Demo(e-commerce)"   # proje ismini değiştirir

explore: order_items {
  label: "POC model (e-commerce)"   # model ismini değiştirir
  description: "POC"   # proje açıklaması
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

  access_filter: {      # access filter tanımlıyoruz. MODEL İÇERİSİNDE TANIMLANIR
    field: inventory_items.product_category      # hangi tablonun hangi kolonu yetkilendirilecek
    user_attribute: category      # user attribute ü tanımlıyoruz
  }

}

access_grant: object_permissions {      # Access grant ile herhangi bir kolonu yetkilendirebiliriz. Bu satırda isim verdik
  user_attribute: object_permission     # oluşturduğumuz user attribute ü tanımlıyoruz
  allowed_values: ["yetkili"]           # user attribute içerisindeki verilere göre izin veriyoruz
}
