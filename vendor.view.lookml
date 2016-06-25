- view: vendor
  sql_table_name: dbo.Vendor
  fields:

  - dimension: id
    primary_key: true
    type: number
    hidden: true 
    sql: ${TABLE}.ID

  - dimension_group: create
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.CreateDate

  - dimension: create_user
    type: 
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
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - name
    - net_suite_item_mapping.count
    - staging_file_load.count
    - staging_msw.count
    - staging_mswraw.count
    - vendor_service.count
    - vendor_service_bak.count

