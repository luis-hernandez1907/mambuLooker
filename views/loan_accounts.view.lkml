# The name of this view in Looker is "Loan Accounts"
view: loan_accounts {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `eon-internal-bigquery.mambuclient.loan_accounts`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: _sdc_batched {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._sdc_batched_at ;;
  }

  dimension_group: _sdc_extracted {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._sdc_extracted_at ;;
  }

  dimension_group: _sdc_received {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._sdc_received_at ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called " Sdc Sequence" in Explore.

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
  }

  dimension: balances__fees_balance {
    type: number
    sql: ${TABLE}.balances.fees_balance ;;
    group_label: "Balances"
    group_item_label: "Fees Balance"
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_balances__fees_balance {
    type: sum
    sql: ${balances__fees_balance} ;;
  }

  measure: average_balances__fees_balance {
    type: average
    sql: ${balances__fees_balance} ;;
  }

  dimension: balances__fees_due {
    type: number
    sql: ${TABLE}.balances.fees_due ;;
    group_label: "Balances"
    group_item_label: "Fees Due"
  }

  dimension: balances__fees_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.balances.fees_paid ;;
    group_label: "Balances"
    group_item_label: "Fees Paid"
  }

  dimension: balances__hold_balance {
    type: number
    sql: ${TABLE}.balances.hold_balance ;;
    group_label: "Balances"
    group_item_label: "Hold Balance"
  }

  dimension: balances__interest_balance {
    type: number
    sql: ${TABLE}.balances.interest_balance ;;
    group_label: "Balances"
    group_item_label: "Interest Balance"
  }

  dimension: balances__interest_due {
    type: number
    sql: ${TABLE}.balances.interest_due ;;
    group_label: "Balances"
    group_item_label: "Interest Due"
  }

  dimension: balances__interest_from_arrears_balance {
    type: number
    sql: ${TABLE}.balances.interest_from_arrears_balance ;;
    group_label: "Balances"
    group_item_label: "Interest From Arrears Balance"
  }

  dimension: balances__interest_from_arrears_due {
    type: number
    sql: ${TABLE}.balances.interest_from_arrears_due ;;
    group_label: "Balances"
    group_item_label: "Interest From Arrears Due"
  }

  dimension: balances__interest_from_arrears_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.balances.interest_from_arrears_paid ;;
    group_label: "Balances"
    group_item_label: "Interest From Arrears Paid"
  }

  dimension: balances__interest_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.balances.interest_paid ;;
    group_label: "Balances"
    group_item_label: "Interest Paid"
  }

  dimension: balances__penalty_balance {
    type: number
    sql: ${TABLE}.balances.penalty_balance ;;
    group_label: "Balances"
    group_item_label: "Penalty Balance"
  }

  dimension: balances__penalty_due {
    type: number
    sql: ${TABLE}.balances.penalty_due ;;
    group_label: "Balances"
    group_item_label: "Penalty Due"
  }

  dimension: balances__penalty_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.balances.penalty_paid ;;
    group_label: "Balances"
    group_item_label: "Penalty Paid"
  }

  dimension: balances__principal_balance {
    type: number
    sql: ${TABLE}.balances.principal_balance ;;
    group_label: "Balances"
    group_item_label: "Principal Balance"
  }

  dimension: balances__principal_due {
    type: number
    sql: ${TABLE}.balances.principal_due ;;
    group_label: "Balances"
    group_item_label: "Principal Due"
  }

  dimension: balances__principal_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.balances.principal_paid ;;
    group_label: "Balances"
    group_item_label: "Principal Paid"
  }

  dimension: balances__redraw_balance {
    type: number
    sql: ${TABLE}.balances.redraw_balance ;;
    group_label: "Balances"
    group_item_label: "Redraw Balance"
  }

  dimension: currency__code {
    type: string
    sql: ${TABLE}.currency.code ;;
    group_label: "Currency"
    group_item_label: "Code"
  }

  dimension_group: last_account_appraisal {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_account_appraisal_date ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: loan_amount {
    type: number
    sql: ${TABLE}.loan_amount ;;
  }

  dimension: loan_name {
    type: string
    sql: ${TABLE}.loan_name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, loan_name]
  }

  measure: sum_balances__principal_balance {
    type: sum
    sql: ${balances__principal_balance} ;;
  }

  measure: sum_loan_amount {
    type: sum
    sql: ${loan_amount} ;;
  }
}
