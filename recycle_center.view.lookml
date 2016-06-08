- view: recycle_center
  sql_table_name: dbo.RecycleCenter
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.ID

  - dimension: active
    type: string
    sql: ${TABLE}.Active

  - dimension: city
    type: string
    sql: ${TABLE}.City

  - dimension_group: create
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.CreateDate

  - dimension: create_user
    type: string
    sql: ${TABLE}.CreateUser

  - dimension: name
    type: string
    sql: ${TABLE}.Name

  - dimension: net_suite_id
    type: number
    sql: ${TABLE}.NetSuiteId

  - dimension: phaseware_id
    type: number
    sql: ${TABLE}.PhasewareId

  - dimension: state
    type: string
    sql: ${TABLE}.State

  - dimension_group: update
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.UpdateDate

  - dimension: update_user
    type: string
    sql: ${TABLE}.UpdateUser

  - measure: count
    type: count
    drill_fields: [id, name, vendor_service.count, vendor_service_bak.count]

