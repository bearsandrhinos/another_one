explore: products {}

view: products {
  sql_table_name: thelook_events.PRODUCTS ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.BRAND ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.CATEGORY ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.COST ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.DEPARTMENT ;;
  }

  dimension: distribution_center_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.DISTRIBUTION_CENTER_ID ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.RETAIL_PRICE ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.SKU ;;
  }

  measure: count {
    type: count
    drill_fields: [brand, count]
    link: {
      label: "drill 1"
      url: "{{link | remove: '&limit=500' }},products.department&pivots=products.department&limit=500"
    }
  }
}