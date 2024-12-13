# The name of this view in Looker is "Order Items"
view: order_items {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bigquery-public-data.thelook_ecommerce.order_items`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: delivered {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.delivered_at ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Inventory Item ID" in Explore.

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    label: "order_id"
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: product_id {
    type: number
    label: "product_id"
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    label: "satistutar"
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  measure: total_sale_price {
    label: "toplamsatistutar"
    type: sum
    value_format: "#,##0"
    sql: ${sale_price} ;;
  }

  dimension: reporting_period {
    group_label: "Order Date"
    sql: CASE
        WHEN EXTRACT(YEAR from ${delivered_date}) = EXTRACT(YEAR from CURRENT_TIMESTAMP())
        AND ${delivered_date} < CURRENT_TIMESTAMP()
        THEN 'This Year to Date'

      WHEN EXTRACT(YEAR from ${delivered_date}) + 1 = EXTRACT(YEAR from CURRENT_TIMESTAMP())
      AND CAST(FORMAT_TIMESTAMP('%j', ${delivered_date}) AS INT64) <= CAST(FORMAT_TIMESTAMP('%j', CURRENT_TIMESTAMP()) AS INT64)
      THEN 'Last Year to Date'

      END
      ;;
  }

  # satış datası filtrelendi.
  measure: total_sale_price_filtered {
    description: "statü filtreli satış datası"
    type: sum
    value_format: "#,##0"
    sql: ${sale_price} ;;
    filters: [status: "Complete,Processing,Shipped"]    # sadece 3 statu gelecek şekilde filtrelendi
  }

  measure: total_sales_today_filtered {
    type: sum
    value_format: "#,##0"
    sql: ${sale_price} ;;
    filters: [status: "Complete,Processing,Shipped", delivered_date: "today"]
  }

  measure: average_sale_price {
    type: average
    value_format: "#,##0.00"
    sql: ${sale_price} ;;
  }

  dimension_group: shipped {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.shipped_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    drill_fields: [products.category, products.brand, products.name]
  }

  # bu filtre ile herhangi bir viewdaki bir alana ait filtreleme yapılabilir.
  filter: status_filter {
    type: string
    suggest_dimension: status
    # sql: status ='Complete'  ;;
    sql: {% condition %} ${status} {% endcondition %} ;;
    default_value: "Complete"
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.last_name,
      users.id,
      users.first_name,
      inventory_items.id,
      inventory_items.product_name,
      products.name,
      products.id,
      orders.order_id
    ]
  }
}
