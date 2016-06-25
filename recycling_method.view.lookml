- view: recycling_method
  sql_table_name: dbo.RecyclingMethod
  fields:

  - dimension: id
    primary_key: true
    type: number
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

  - dimension: description
    type: string
    hidden: true
    sql: ${TABLE}.Description

  - dimension: name
    type: string
    sql: ${TABLE}.Name

  - dimension_group: update
    type: time
    hidden: true
    timeframes: [time, date, week, month]
    sql: ${TABLE}.UpdateDate

  - dimension: update_user
    type: string
    hidden: true
    sql: ${TABLE}.UpdateUser

  - measure: count
    type: count
    drill_fields: [id, name, category_recycling.count, recycling_method_summary.count]

