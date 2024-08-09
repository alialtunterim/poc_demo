---
- dashboard: sample
  title: sample
  layout: newspaper
  preferred_viewer: dashboards-next
  description: 'buraya dashboard açıklaması gelecek.'
  preferred_slug: 4Rma1gvciQwjdK91r3ChKo
  elements:
  - title: sample
    name: sample
    model: poc_demos
    explore: order_items
    type: table
    fields: [order_items.order_id, order_items.product_id]
    sorts: [order_items.order_id]
    limit: 500
    column_limit: 50
    query_timezone: UTC
    listen: {}
    row: 0
    col: 0
    width: 8
    height: 6
