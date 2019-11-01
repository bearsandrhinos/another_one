explore: dt_test {}
view: dt_test {
derived_table: {
  sql:

 --         {% if dt_test.c._in_query or dt_test.d._in_query %}

        SELECT oi.id as a, oi.sale_price as b,
        o.id as c, o.status as d FROM demo_db.order_items as oi
        left join demo_db.orders as o on o.id = oi.order_id

--            {% elsif  dt_test.a._in_query or dt_test.b._in_query   %}

--          SELECT oi.id as a, oi.sale_price as b FROM demo_db.order_items as oi

 --         {% else %}
 --           1=1
 --         {% endif %} ;;
}

dimension: a {
  type: number
  sql: ${TABLE}.a ;;
}

dimension: b {
  type: number
  sql: ${TABLE}.b ;;
}

dimension: c_d {
  label: "This is C and D"
  type: number
  sql: {% if dt_test.a._in_query %}
          ${TABLE}.d
        {% elsif dt_test.b._in_query %}
          ${TABLE}.c
        {% else %}
        null
        {% endif %} ;;
}

# dimension: d {
#   type: string
#   sql: ${TABLE}.d ;;
# }
}
