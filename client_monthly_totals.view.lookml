- view: client_monthly_totals
  sql_table_name: dbo.ClientMonthlyTotals
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.ID

  - dimension: acctg_category
    type: string
    sql: ${TABLE}.AcctgCategory

  - dimension: amount
    type: number
    sql: ${TABLE}.Amount

  - dimension: client_name
    type: string
    sql: ${TABLE}.ClientName

  - dimension_group: fin
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.FinDate

  - dimension: income_or_expense
    type: string
    sql: ${TABLE}.IncomeOrExpense

  - measure: count
    type: count
    drill_fields: [id, client_name]

