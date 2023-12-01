---
  dashboard: 01_sales_summary
  title: 01- Sales Summary
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: S1zPLxXgFr5jOvB6Zr2a2i
  elements:
  - title: Yesterday Sales
    name: Yesterday Sales
    model: poc_demos
    explore: order_items
    type: single_value
    fields: [order_items.total_sale_price, order_items.delivered_date]
    fill_fields: [order_items.delivered_date]
    filters:
      order_items.delivered_date: yesterday
    sorts: [order_items.delivered_date desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#023535"
    single_value_title: Yesterday Sales
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    title_hidden: true
    listen: {}
    row: 0
    col: 8
    width: 4
    height: 4
  - title: Last Week Sales
    name: Last Week Sales
    model: poc_demos
    explore: order_items
    type: single_value
    fields: [order_items.total_sale_price, order_items.delivered_date]
    fill_fields: [order_items.delivered_date]
    filters:
      order_items.delivered_date: 7 days ago
    sorts: [order_items.delivered_date desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#023535"
    single_value_title: Last Week Sales
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    title_hidden: true
    listen: {}
    row: 0
    col: 12
    width: 4
    height: 4
  - title: Last Year Sales
    name: Last Year Sales
    model: poc_demos
    explore: order_items
    type: single_value
    fields: [order_items.total_sale_price, order_items.delivered_date]
    fill_fields: [order_items.delivered_date]
    sorts: [order_items.delivered_date desc]
    limit: 500
    filter_expression: extract_days(now())=extract_days(${order_items.delivered_date})
      AND extract_months(now())=extract_months(${order_items.delivered_date}) AND
      (extract_years(now())-1)=extract_years(${order_items.delivered_date})
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#023535"
    single_value_title: Last Year Sales
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    title_hidden: true
    listen: {}
    row: 0
    col: 20
    width: 4
    height: 4
  - title: Last Month Sales
    name: Last Month Sales
    model: poc_demos
    explore: order_items
    type: single_value
    fields: [order_items.total_sale_price, order_items.delivered_date]
    fill_fields: [order_items.delivered_date]
    sorts: [order_items.delivered_date desc]
    limit: 500
    filter_expression: extract_days(now())=extract_days(${order_items.delivered_date})
      AND (extract_months(now())-1)=extract_months(${order_items.delivered_date})
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#023535"
    single_value_title: Last Month Sales
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    title_hidden: true
    listen: {}
    row: 0
    col: 16
    width: 4
    height: 4
  - name: Category Based Sales
    title: Category Based Sales
    model: poc_demos
    explore: order_items
    type: looker_grid
    fields: [products.category, order_items.total_sale_price]
    sorts: [order_items.total_sale_price desc]
    limit: 500
    query_timezone: Turkey
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      order_items.total_sale_price: Total Sales
    series_cell_visualizations:
      order_items.total_sale_price:
        is_active: true
        palette:
          palette_id: fd92a18e-e411-f5a7-d14e-139106efc067
          collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
          custom_colors:
          - "#0FC2C0"
          - "#008F8C"
          - "#023535"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 4
    col: 0
    width: 8
    height: 8
  - name: Brand Based Sales (Top 10)
    title: Brand Based Sales (Top 10)
    model: poc_demos
    explore: order_items
    type: looker_bar
    fields: [products.brand, order_items.total_sale_price]
    filters:
      order_items.status: Complete
    sorts: [order_items.total_sale_price desc 0]
    limit: 10
    column_limit: 50
    query_timezone: Turkey
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_sale_price,
            id: order_items.total_sale_price, name: Total Sale Price}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    font_size: ''
    series_colors:
      order_items.total_sale_price: "#008F8C"
    series_labels:
      order_items.total_sale_price: Total Sales
    label_color: [white]
    x_axis_datetime_label: ''
    defaults_version: 1
    listen: {}
    row: 4
    col: 8
    width: 8
    height: 8
  - name: Product Based Sales (Top10)
    title: Product Based Sales (Top10)
    model: poc_demos
    explore: order_items
    type: looker_grid
    fields: [order_items.total_sale_price, products.name]
    sorts: [order_items.total_sale_price desc]
    limit: 10
    query_timezone: Turkey
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      order_items.total_sale_price: Total Sales
    series_column_widths:
      order_items.total_sale_price: 135
    series_cell_visualizations:
      order_items.total_sale_price:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#FCCF41",
        font_color: !!null '', color_application: {collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a,
          custom: {id: c7f6f294-c700-9267-b81f-7371f9906d0d, label: Custom, type: continuous,
            stops: [{color: "#0CABA8", offset: 0}, {color: "#008F8C", offset: 50},
              {color: "#015958", offset: 100}]}, options: {steps: 5, reverse: false}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    truncate_column_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    map: auto
    map_projection: ''
    quantize_colors: false
    listen: {}
    row: 4
    col: 16
    width: 8
    height: 8
  - name: Monthly Based Sales
    title: Monthly Based Sales
    model: poc_demos
    explore: order_items
    type: looker_line
    fields: [order_items.total_sale_price, order_items.created_month_name, order_items.created_year]
    pivots: [order_items.created_year]
    fill_fields: [order_items.created_year, order_items.created_month_name]
    filters:
      order_items.created_date: before 0 minutes ago
    sorts: [order_items.created_year, order_items.created_month_name]
    limit: 500
    column_limit: 50
    query_timezone: Turkey
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_sale_price,
            id: order_items.total_sale_price, name: Total Sale Price}], showLabels: false,
        showValues: false, valueFormat: '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: ''
    series_colors:
      2022 - order_items.total_sale_price: "#0099DD"
      2021 - order_items.total_sale_price: "#026E81"
      2020 - order_items.total_sale_price: "#A1C7E0"
      2019 - order_items.total_sale_price: "#FF9933"
    label_color: [black]
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 12
    col: 0
    width: 17
    height: 8
  - name: Status Based Sales
    title: Status Based Sales
    model: poc_demos
    explore: order_items
    type: looker_pie
    fields: [order_items.status, order_items.total_sale_price]
    sorts: [order_items.total_sale_price desc]
    limit: 500
    query_timezone: Turkey
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    series_colors:
      Cancelled: "#EA5D2C"
      Complete: "#378F93"
      Processing: "#425267"
      Shipped: "#7FBACC"
      Returned: "#F5A335"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    font_size: 12
    listen: {}
    row: 12
    col: 17
    width: 7
    height: 8
  - name: Daily Sales (Forecasting)
    title: Daily Sales (Forecasting)
    model: poc_demos
    explore: order_items
    type: looker_line
    fields: [order_items.total_sale_price, order_items.created_date]
    fill_fields: [order_items.created_date]
    filters:
      order_items.created_date: before 0 days ago
      order_items.created_month: 120 days
      order_items.status: Complete
    sorts: [order_items.created_date desc]
    limit: 120
    column_limit: 50
    query_timezone: Turkey
    analysis_config:
      forecasting:
      - confidence_interval: 0.95
        field_name: order_items.total_sale_price
        forecast_n: 7
        forecast_interval: day
        seasonality: 7
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_colors:
      order_items.total_sale_price: "#015958"
    series_labels:
      order_items.total_sale_price: Total Sales
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#FF8168", label: ''}]
    trend_lines: [{color: "#0FC2C0", label_position: right, order: 3, period: 7, regression_type: logarithmic,
        series_index: 1, show_label: true}]
    defaults_version: 1
    listen: {}
    row: 20
    col: 0
    width: 24
    height: 8
  - title: New Tile
    name: New Tile
    model: poc_demos
    explore: order_items
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [today_sales, yesterday_sales]
    limit: 500
    dynamic_fields:
    - category: measure
      expression:
      label: Today Sales
      value_format:
      value_format_name:
      based_on: order_items.total_sale_price
      _kind_hint: measure
      measure: today_sales
      type: sum
      _type_hint: number
      filters:
        order_items.delivered_date: today
    - category: measure
      expression:
      label: Yesterday Sales
      value_format:
      value_format_name:
      based_on: order_items.total_sale_price
      _kind_hint: measure
      measure: yesterday_sales
      type: sum
      _type_hint: number
      filters:
        order_items.delivered_date: yesterday
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    font_size_main: '16'
    orientation: auto
    style_today_sales: "#3A4245"
    show_title_today_sales: true
    title_placement_today_sales: above
    value_format_today_sales: ''
    show_comparison_yesterday_sales: true
    comparison_style_yesterday_sales: percentage_change
    comparison_show_label_yesterday_sales: true
    pos_is_bad_yesterday_sales: false
    comparison_label_placement_yesterday_sales: below
    comp_value_format_yesterday_sales: ''
    style_yesterday_sales: "#3A4245"
    show_title_yesterday_sales: true
    title_placement_yesterday_sales: above
    value_format_yesterday_sales: ''
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
    custom_color_enabled: true
    custom_color: "#023535"
    show_single_value_title: true
    single_value_title: Today Sales
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: greater than, value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a,
          palette_id: 99d2d3ac-7579-41a0-b16c-a381b7ae96da}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 0
    value_labels: legend
    label_type: labPer
    title_hidden: true
    listen: {}
    row: 0
    col: 0
    width: 8
    height: 4
