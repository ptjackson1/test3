- view: category_recycling
  sql_table_name: dbo.CategoryRecycling
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.ID

  - dimension_group: create
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.CreateDate

  - dimension: create_user
    type: string
    sql: ${TABLE}.CreateUser

  - dimension: recycling_method_id
    type: number
    # hidden: true
    sql: ${TABLE}.RecyclingMethodID

  - dimension: service_category_id
    type: number
    # hidden: true
    sql: ${TABLE}.ServiceCategoryID

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - service_category.id
    - service_category.display_name
    - recycling_method.id
    - recycling_method.name
    - recycling_percentage.count

