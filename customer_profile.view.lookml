- view: customer_profile
  sql_table_name: dbo.CustomerProfile
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

  - dimension: derive_ssrvolume
    type: string
    hidden: true
    sql: ${TABLE}.DeriveSSRVolume

  - dimension: documents_url
    type: string
    hidden: true 
    sql: ${TABLE}.DocumentsURL

  - dimension: entity_id
    type: number
    hidden: true 
    sql: ${TABLE}.EntityID

  - dimension: image_name
    type: string
    hidden: true
    sql: ${TABLE}.ImageName

  - dimension: name
    type: string
    sql: ${TABLE}.Name

  - dimension: net_suite_parent_id
    type: number
    hidden: true
    sql: ${TABLE}.NetSuiteParentID

  - dimension: phaseware_parent_id
    type: number
    hidden: true
    sql: ${TABLE}.PhasewareParentID

  - dimension: some_other_prefs
    type: string
    hidden: true
    sql: ${TABLE}.SomeOtherPrefs

  - dimension_group: update
    type: time
    timeframes: [time, date, week, month]
    hidden: true
    sql: ${TABLE}.UpdateDate

  - dimension: update_user
    type: string
    hidden: true
    sql: ${TABLE}.UpdateUser

  - measure: count
    type: count
    hidden: true
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - name
    - image_name
    - customer.count
    - customer_bak.count
    - customer_categories.count
    - customer_documents.count
    - customer_segment.count
    - customer_segment_label.count
    - customer_type.count
    - file_import_log.count
    - file_import_log_bak.count
    - file_import_log_bak0925.count
    - user_customers.count
    - walmart_master.count

