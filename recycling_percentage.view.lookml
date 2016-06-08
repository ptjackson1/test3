- view: recycling_percentage
  sql_table_name: dbo.RecyclingPercentage
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.ID

  - dimension_group: begin
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.BeginDate

  - dimension: category_recycling_id
    type: number
    # hidden: true
    sql: ${TABLE}.CategoryRecyclingID

  - dimension: customer_id
    type: number
    # hidden: true
    sql: ${TABLE}.CustomerID

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.EndDate

  - dimension: percentage
    type: number
    sql: ${TABLE}.Percentage

  - measure: count
    type: count
    drill_fields: [id, customer.id, customer.name, category_recycling.id]

