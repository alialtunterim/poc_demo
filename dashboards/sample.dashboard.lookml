---
- dashboard: sample_dashboard
  title: sample dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: buraya dashboard açıklaması gelecek...
  preferred_slug: kzqRdaouj6xbEMelLjF0iv
  elements:
  - title: sample_look
    name: sample_look
    model: poc_demos
    explore: order_items
    type: table
    fields: [order_items.order_id, order_items.product_id]
    filters:
      order_items.created_month: 1 days
    sorts: [order_items.order_id]
    limit: 500
    column_limit: 50
    query_timezone: UTC
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 8
    height: 6
