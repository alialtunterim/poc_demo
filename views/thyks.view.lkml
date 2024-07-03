# The name of this view in Looker is "Thyks"
view: thyks {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `aaltunterim-sandbox.excel.thyks` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Adet" in Explore.

  dimension: adet {
    type: number
    sql: ${TABLE}.Adet ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_adet {
    type: sum
    sql: ${adet} ;;  }
  measure: average_adet {
    type: average
    sql: ${adet} ;;  }

  dimension: gun_sayisi {
    type: number
    sql: ${TABLE}.Gun_Sayisi ;;
  }

  dimension: ort__kay__t {
    type: number
    sql: ${TABLE}.Ort__Kay__t ;;
  }

  dimension: tarih {
    type: string
    sql: ${TABLE}.Tarih ;;
  }
  measure: count {
    type: count
  }
}
