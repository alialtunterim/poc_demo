connection: "komtas-workshop"

include: "/views/e-commerce/*.view.lkml"

explore: order_items {

  join: orders {
    relationship: many_to_one
    sql_on: ${orders.order_id} = ${order_items.order_id} ;;
  }

  join: events {
    relationship: many_to_one
    sql_on: ${events.user_id} = ${order_items.user_id} ;;
  }

  join: users {
    relationship: many_to_one
    sql_on: ${order_items.user_id} = ${users.id} ;;
  }

  join: products {
    relationship: many_to_one
    sql_on: ${products.id} = ${order_items.product_id} ;;
  }

}
