- view: vendor_service
  sql_table_name: dbo.VendorService
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.ID

  - dimension: amount
    type: number
    sql: ${TABLE}.Amount

  - dimension: collected_units
    type: number
    sql: ${TABLE}.CollectedUnits

  - dimension: collected_uom
    type: string
    sql: ${TABLE}.CollectedUOM

  - dimension_group: create
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.CreateDate

  - dimension: create_user
    type: string
    sql: ${TABLE}.CreateUser

  - dimension: customer_id
    type: number
    # hidden: true
    sql: ${TABLE}.CustomerID

  - dimension: customer_segment_id
    type: number
    # hidden: true
    sql: ${TABLE}.CustomerSegmentID

  - dimension: data_source_id
    type: number
    # hidden: true
    sql: ${TABLE}.DataSourceID

  - dimension: equipment_type
    type: string
    sql: ${TABLE}.EquipmentType

  - dimension: exception_id
    type: number
    # hidden: true
    sql: ${TABLE}.ExceptionID

  - dimension: exception_notes
    type: string
    sql: ${TABLE}.ExceptionNotes

  - dimension: file_import_log_id
    type: number
    # hidden: true
    sql: ${TABLE}.FileImportLogID

  - dimension: hauler_name
    type: string
    sql: ${TABLE}.HaulerName

  - dimension: include_rec_in_summary
    type: string
    sql: ${TABLE}.IncludeRecInSummary

  - dimension_group: invoice
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.InvoiceDate

  - dimension: invoice_number
    type: string
    sql: ${TABLE}.InvoiceNumber

  - dimension: item_id
    type: number
    sql: ${TABLE}.ItemID

  - dimension: manifest_number
    type: string
    sql: ${TABLE}.ManifestNumber

  - dimension: recycle_center_id
    type: number
    # hidden: true
    sql: ${TABLE}.RecycleCenterID

  - dimension: service_category_id
    type: number
    # hidden: true
    sql: ${TABLE}.ServiceCategoryID

  - dimension_group: service
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.ServiceDate

  - dimension: service_type
    type: string
    sql: ${TABLE}.ServiceType

  - dimension: transaction_id
    type: number
    sql: ${TABLE}.Transaction_ID

  - dimension: transaction_line_id
    type: number
    sql: ${TABLE}.Transaction_Line_ID

  - dimension_group: update
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.UpdateDate

  - dimension: update_user
    type: string
    sql: ${TABLE}.UpdateUser

  - dimension: vendor_id
    type: number
    # hidden: true
    sql: ${TABLE}.VendorID

  - measure: count
    type: count
    drill_fields: detail*
  
  - measure: total_collected_units
    type: sum
    sql: ${collected_units}
    value_format_name: decimal_2
    drill_fields: detail*
    
  - measure: total_amount
    type: sum
    sql: ${amount}
    value_format_name: decimal_2
    drill_fields: detail*

  - measure: percentageRecycle
    type: number
    sql: category_recycling.Percentage
    
  - measure: Units_Recycled 
    type: number
    sql: ${total_collected_units} * ${percentageRecycle}

  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - hauler_name
    - customer.id
    - customer.name
    - customer_segment.id
    - customer_segment.level_name
    - vendor.id
    - vendor.name
    - service_category.id
    - service_category.display_name
    - recycle_center.id
    - recycle_center.name
    - exception.id
    - data_source.id
    - file_import_log.id
    - file_import_log.file_name
    - service_category_attribute_value.count
    - service_category_attribute_value_bk.count
    - vendor_service_excess_columns.count

