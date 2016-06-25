- view: recycle_center
  sql_table_name: dbo.RecycleCenter
  fields:

  - dimension: id
    primary_key: true
    hidden: true
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
    hidden: true
    timeframes: [time, date, week, month]
    sql: ${TABLE}.CreateDate

  - dimension: create_user
    type: string
    hidden: true
    sql: ${TABLE}.CreateUser

  - dimension: name
    type: string
    sql: ${TABLE}.Name

  - dimension: net_suite_id
    type: number
    hidden: true
    sql: ${TABLE}.NetSuiteId

  - dimension: phaseware_id
    type: number
    hidden: true
    sql: ${TABLE}.PhasewareId

  - dimension: state
    type: string
    hidden: true
    sql: ${TABLE}.State

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
    drill_fields: [id, name, vendor_service.count, vendor_service_bak.count]

