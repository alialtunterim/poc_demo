# The name of this view in Looker is "Distribution Centers"
view: distribution_centers {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bigquery-public-data.thelook_ecommerce.distribution_centers`
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
  # This dimension will be called "Latitude" in Explore.

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: name {
    type: string
    label: "Distribution Center"
    description: "Dağıtım Merkezleri"
    sql: ${TABLE}.name ;;
  }

  dimension: Center_Lat_Long{
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
    suggest_dimension: name
  }

  measure: count {
    type: count
    drill_fields: [id, name, products.count]
  }
}
