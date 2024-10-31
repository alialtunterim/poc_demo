# The name of this view in Looker is "Users"
view: users {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bigquery-public-data.thelook_ecommerce.users`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Age" in Explore.

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  # tablo özelinde case when yazarak ayrı bir kolon oluşturuldu.
  dimension: age_group {
    type: string
    case: {
      when: {
        sql: ${age} between 0 and 18  ;;
        label: "0-18"
      }
      when: {
        sql: ${age} between 19 and 25 ;;
        label: "19-25"
      }
      when: {
        sql: ${age} between 26 and 40 ;;
        label: "26-40"
      }
      when: {
        sql: ${age} between 41 and 55 ;;
        label: "41-55"
      }
      when: {
        sql: ${age} between 56 and 70 ;;
        label: "56-70"
      }
      else: "71+"
    }
  }

  measure: average_age {
    type: average
    sql: ${age} ;;
  }

  dimension: city {
    group_label: "Geography"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: city_lat_long {
    group_label: "Geography"
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
    suggest_dimension: city
  }

  dimension: country {
    group_label: "Geography"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: latitude {
    group_label: "Geography"
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    group_label: "Geography"
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: postal_code {
    group_label: "Geography"
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: state {
    group_label: "Geography"
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: street_address {
    group_label: "Geography"
    type: string
    sql: ${TABLE}.street_address ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      last_name,
      first_name,
      orders.count,
      events.count,
      order_items.count
    ]
  }
}
