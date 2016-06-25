- view: category_recycling
  sql_table_name: dbo.CategoryRecycling
  fields:

  - dimension: id
    type: number
    primary_key: true
    hidden: true 
    sql: ${TABLE}.ID

  - dimension_group: create
    type: time
    hidden: true 
    timeframes: [time, date, week, month]
    sql: ${TABLE}.CreateDate

  - dimension: create_user
    type: string
    hidden: true
    sql: ${TABLE}.CreateUser

  - dimension: percentage
    type: number
    sql: ${TABLE}.Percentage

  - dimension: recycling_method_id
    type: number
    hidden: true
    sql: ${TABLE}.RecyclingMethodID

  - dimension: service_category_id
    type: number
    hidden: true
    sql: ${TABLE}.ServiceCategoryID

  - measure: percentageRecycle
    type: number
    sql: ${TABLE}.Percentage
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

