- view: customer_segment
  sql_table_name: dbo.CustomerSegment
  fields:

  - dimension: id
    primary_key: true
    type: number
    hidden: true
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

  - dimension: customer_profile_id
    type: number
    hidden: true
    sql: ${TABLE}.CustomerProfileID

  - dimension: end_year_mo
    type: number
    hidden: true
    sql: ${TABLE}.EndYearMo

  - dimension: level_name
    type: string
    sql: ${TABLE}.LevelName

  - dimension: parent_id
    type: number
    hidden: true
    sql: ${TABLE}.ParentID

  - dimension: start_year_mo
    type: number
    hidden: true
    sql: ${TABLE}.StartYearMo

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
    - level_name
    - customer_profile.id
    - customer_profile.name
    - customer_profile.image_name
    - customer.count
    - customer_bak.count
    - customer_type_customer_segments.count
    - user_geoaccess.count
    - vendor_service.count
    - walmart_master.count

