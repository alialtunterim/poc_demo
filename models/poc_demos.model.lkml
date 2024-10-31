# Define the database connection to be used for this model.
connection: "komtas-workshop"

include: "/views/e-commerce/*.view.lkml"
#include: "/dashboards/sample.dashboard.lookml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: poc_demos_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM table_name;
  # sql_trigger: SELECT MAX(order_item_id) from order_items ;;
  # sql_trigger: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*6)/(60*60*24));;
  max_cache_age: "24 hours"
}

persist_with: poc_demos_default_datagroup

label: "DEMO e-commerce"   # proje ismini değiştirir

explore: order_items {
  label: "DEMO model e-commerce"   # model ismini değiştirir
  description: "DEMO"   # proje açıklaması
  #persist_for: "0  seconds"

  # bu filtre ile kullanıcının zorunlu bir seçim yapması sağlanır. model kısmında tanımlama yapılmalıdır.
  # always_filter: {
  #  filters: [orders.status: "Complete"]
  # }

  join: orders {
    relationship: many_to_one
    #type: left_outer
    sql_on: ${orders.order_id} = ${order_items.order_id} ;;
    # bu filtre ile kullanıcıya seçim yaptırmadan direk modeldeki ilgili tablonun filtrelenmiş olarak gelmesi sağlanır.
    # sql_where: ${orders.status} = "Complete" ;;
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
    sql_on: ${inventory_items.id}=${order_items.inventory_item_id};;
    #and ${inventory_items.product_id}=${products.id}
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

#satır bazlı yetki
  access_filter: {      # access filter tanımlıyoruz. MODEL İÇERİSİNDE TANIMLANIR
    field: inventory_items.product_category      # hangi tablonun hangi kolonu yetkilendirilecek
    user_attribute: category      # user attribute ü tanımlıyoruz
  }

}


access_grant: object_permissions {      # Access grant ile herhangi bir kolonu yetkilendirebiliriz. Bu satırda isim verdik
  user_attribute: object_permission     # oluşturduğumuz user attribute ü tanımlıyoruz
  allowed_values: ["yetkili"]           # user attribute içerisindeki verilere göre izin veriyoruz
  ## nventory_items.total_cost ##       # yetki tanımı yapılan obje
}
