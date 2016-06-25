- view: line_of_business
  sql_table_name: dbo.LineOfBusiness
  fields:

  - dimension: id
    primary_key: true
    hidden: true
    type: number
    sql: ${TABLE}.ID

  - dimension: active
    type: string
    sql: ${TABLE}.Active

  - dimension_group: create
    type: time
    hidden: true
    timeframes: [time, date, week, month]
    sql: ${TABLE}.CreateDate

  - dimension: create_user
    type: string
    hidden: true
    sql: ${TABLE}.CreateUser

  - dimension: line_of_business
    type: string
    sql: ${TABLE}.LineOfBusiness

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
    drill_fields: [id, service_category.count, user_data_access.count]

