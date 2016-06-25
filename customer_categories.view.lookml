- view: customer_categories
  sql_table_name: dbo.CustomerCategories
  fields:

  - dimension: id
    primary_key: true
    hidden: true 
    type: number
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

  - dimension: customer_profile_id
    type: number
    hidden: true
    sql: ${TABLE}.CustomerProfileID

  - dimension: service_category_id
    type: number
    hidden: true
    sql: ${TABLE}.ServiceCategoryID

  - measure: count
    type: count
    hidden: true 
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - customer_profile.id
    - customer_profile.name
    - customer_profile.image_name
    - service_category.id
    - service_category.display_name

