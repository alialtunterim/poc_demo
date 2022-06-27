view: basket_analysis {
  derived_table: {
    sql:
    with basket_analysis as
    (select distinct ORD.order_id, ORD.product_id, PRDCT.name from `bigquery-public-data.thelook_ecommerce.order_items`ORD
    inner join `bigquery-public-data.thelook_ecommerce.products` PRDCT on ORD.product_id = PRDCT.id )
    select BSKT.order_id, BSKT.product_id, BSKT.name, ORD2.product_id as other_prdct_id, PRDCT2.name as other_prdct_name, count(ORD2.product_id) over (partition by ORD2.product_id) as other_prod_count
    from basket_analysis BSKT inner join `bigquery-public-data.thelook_ecommerce.order_items` ORD2 on BSKT.order_id = ORD2.order_id
    inner join `bigquery-public-data.thelook_ecommerce.products` PRDCT2 on PRDCT2.id = ORD2.product_id
    where BSKT.name = {% parameter productname %} and PRDCT2.name != {% parameter productname %} and
    ORD2.created_at BETWEEN  {% parameter baslangic_tarihi %} and {% parameter bitis_tarihi %}
    ;;
  }

  parameter: baslangic_tarihi {
    type: date
  }

  parameter: bitis_tarihi {
    type: date
  }

  parameter: productname {
    type: string
    suggest_dimension: products.name
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: other_prdct_id {
    type: number
    sql: ${TABLE}.other_prdct_id ;;
  }

  dimension: other_prdct_name {
    type: string
    sql: ${TABLE}.other_prdct_name ;;
  }

  dimension: other_prod_count {
    type: number
    sql: ${TABLE}.other_prod_count ;;
  }

  measure: total_product_count {
    type: sum
    sql: ${TABLE}.other_prod_count ;;
  }

}
