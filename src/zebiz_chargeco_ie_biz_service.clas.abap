class ZEBIZ_CHARGECO_IE_BIZ_SERVICE definition
  public
  inheriting from CL_PROXY_CLIENT
  create public .

public section.

  methods SEARCH_EBIZ_WEB_FORM_PENDING_P
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_S24
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_S23
    raising
      CX_AI_SYSTEM_FAULT .
  methods SEARCH_CUSTOMER_LIST
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_S28
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_S27
    raising
      CX_AI_SYSTEM_FAULT .
  methods SEARCH_CUSTOMERS
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_S26
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_S25
    raising
      CX_AI_SYSTEM_FAULT .
  methods SEARCH_BATCHES
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_S30
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_S29
    raising
      CX_AI_SYSTEM_FAULT .
  methods SEARCH_APPLICATION_TRANSACTION
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_S32
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_S31
    raising
      CX_AI_SYSTEM_FAULT .
  methods SCHEDULE_RECURRING_PAYMENT
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_SC1
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_SCH
    raising
      CX_AI_SYSTEM_FAULT .
  methods RUN_TRANSACTION
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_RU1
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_RUN
    raising
      CX_AI_SYSTEM_FAULT .
  methods RUN_CUSTOMER_TRANSACTION
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_RU3
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_RU2
    raising
      CX_AI_SYSTEM_FAULT .
  methods RESEND_PAYMENT_FORM_EMAIL
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_RE1
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_RES
    raising
      CX_AI_SYSTEM_FAULT .
  methods RESEND_EBIZ_WEB_FORM_EMAIL
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_RE3
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_RE2
    raising
      CX_AI_SYSTEM_FAULT .
  methods RENDER_RECEIPT
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_RE4
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_REN
    raising
      CX_AI_SYSTEM_FAULT .
  methods MODIFY_SCHEDULED_RECURRING_PAY
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_MO1
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_MOD
    raising
      CX_AI_SYSTEM_FAULT .
  methods MODIFY_SCHEDULED_RECURRING_PA2
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_MO5
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_MO4
    raising
      CX_AI_SYSTEM_FAULT .
  methods MODIFY_SCHEDULED_RECURRING_PA1
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_MO3
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_MO2
    raising
      CX_AI_SYSTEM_FAULT .
  methods MARK_SALES_ORDER_AS_SYNCHRONIZ
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_MA1
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_MAR
    raising
      CX_AI_SYSTEM_FAULT .
  methods MARK_RECURRING_PAYMENT_AS_APPL
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_MA3
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_MA2
    raising
      CX_AI_SYSTEM_FAULT .
  methods MARK_PAYMENT_AS_APPLIED
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_MA5
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_MA4
    raising
      CX_AI_SYSTEM_FAULT .
  methods MARK_INVOICE_AS_SYNCHRONIZED
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_MA7
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_MA6
    raising
      CX_AI_SYSTEM_FAULT .
  methods MARK_EBIZ_WEB_FORM_PAYMENT_AS
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_MA9
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_MA8
    raising
      CX_AI_SYSTEM_FAULT .
  methods MARK_CUSTOMER_AS_INACTIVE
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_M11
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_M10
    raising
      CX_AI_SYSTEM_FAULT .
  methods MARK_APPLICATION_TRANSACTION_A
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_M13
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_M12
    raising
      CX_AI_SYSTEM_FAULT .
  methods LOGIN
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_LO1
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_LOG
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_ZIP_CODE_INFO
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_GE1
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_GET
    raising
      CX_AI_SYSTEM_FAULT .
  methods SEARCH_EBIZ_WEB_FORM_RECEIVED
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_S22
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_S21
    raising
      CX_AI_SYSTEM_FAULT .
  methods UPLOAD_ATTACHMENT
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_UP1
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_UPL
    raising
      CX_AI_SYSTEM_FAULT .
  methods UPDATE_USER_DATA
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_UP2
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_UPD
    raising
      CX_AI_SYSTEM_FAULT .
  methods UPDATE_TERMS
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_UP4
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_UP3
    raising
      CX_AI_SYSTEM_FAULT .
  methods UPDATE_SUB_CUSTOMER
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_UP6
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_UP5
    raising
      CX_AI_SYSTEM_FAULT .
  methods UPDATE_SALES_REP
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_UP8
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_UP7
    raising
      CX_AI_SYSTEM_FAULT .
  methods UPDATE_SALES_ORDER
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_U10
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_UP9
    raising
      CX_AI_SYSTEM_FAULT .
  methods UPDATE_MERCHANT_DATA
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_U12
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_U11
    raising
      CX_AI_SYSTEM_FAULT .
  methods UPDATE_ITEM
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_U14
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_U13
    raising
      CX_AI_SYSTEM_FAULT .
  methods UPDATE_INVOICE
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_U16
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_U15
    raising
      CX_AI_SYSTEM_FAULT .
  methods UPDATE_CUSTOMER_PAYMENT_METHOD
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_U20
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_U19
    raising
      CX_AI_SYSTEM_FAULT .
  methods UPDATE_CUSTOMER
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_U18
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_U17
    raising
      CX_AI_SYSTEM_FAULT .
  methods UPDATE_APPLICATION_DATA
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_U22
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_U21
    raising
      CX_AI_SYSTEM_FAULT .
  methods SET_DEFAULT_CUSTOMER_PAYMENT_M
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_SE1
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_SET
    raising
      CX_AI_SYSTEM_FAULT .
  methods SEARCH_TRANSACTIONS
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_SE2
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_SEA
    raising
      CX_AI_SYSTEM_FAULT .
  methods SEARCH_TERMS
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_SE4
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_SE3
    raising
      CX_AI_SYSTEM_FAULT .
  methods SEARCH_SCHEDULED_RECURRING_PAY
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_SE6
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_SE5
    raising
      CX_AI_SYSTEM_FAULT .
  methods SEARCH_SALES_REPS
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_SE8
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_SE7
    raising
      CX_AI_SYSTEM_FAULT .
  methods SEARCH_SALES_ORDERS
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_S10
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_SE9
    raising
      CX_AI_SYSTEM_FAULT .
  methods SEARCH_RECURRING_PAYMENTS
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_S12
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_S11
    raising
      CX_AI_SYSTEM_FAULT .
  methods SEARCH_PAYMENT_FORM_RECEIVED_P
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_S14
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_S13
    raising
      CX_AI_SYSTEM_FAULT .
  methods SEARCH_PAYMENT_FORM_PENDING_PA
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_S16
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_S15
    raising
      CX_AI_SYSTEM_FAULT .
  methods SEARCH_ITEMS
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_S18
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_S17
    raising
      CX_AI_SYSTEM_FAULT .
  methods SEARCH_INVOICES
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_S20
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_S19
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_USER_DATA
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_GE3
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_GE2
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_BATCH_TRANSACTIONS
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G53
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G52
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_BATCH_STATUS
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G55
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G54
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_APPLICATION_DATA
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G57
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G56
    raising
      CX_AI_SYSTEM_FAULT .
  methods EMAIL_RECEIPT
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_EM1
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_EMA
    raising
      CX_AI_SYSTEM_FAULT .
  methods DELETE_EBIZ_WEB_FORM_PAYMENT
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_DE1
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_DEL
    raising
      CX_AI_SYSTEM_FAULT .
  methods DELETE_CUSTOMER_PAYMENT_METHOD
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_DE3
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_DE2
    raising
      CX_AI_SYSTEM_FAULT .
  methods COPY_CUSTOMER
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_CO1
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_COP
    raising
      CX_AI_SYSTEM_FAULT .
  methods CONSTRUCTOR
    importing
      !LOGICAL_PORT_NAME type PRX_LOGICAL_PORT_NAME optional
    raising
      CX_AI_SYSTEM_FAULT .
  methods CLOSE_BATCH
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_CL1
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_CLO
    raising
      CX_AI_SYSTEM_FAULT .
  methods AUTHENTICATE_SK
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_AU1
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_AUT
    raising
      CX_AI_SYSTEM_FAULT .
  methods ADD_USER_DATA
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_AD1
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_ADD
    raising
      CX_AI_SYSTEM_FAULT .
  methods ADD_TERMS
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_AD3
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_AD2
    raising
      CX_AI_SYSTEM_FAULT .
  methods ADD_SUB_CUSTOMER
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_AD5
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_AD4
    raising
      CX_AI_SYSTEM_FAULT .
  methods ADD_SALES_REP
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_AD7
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_AD6
    raising
      CX_AI_SYSTEM_FAULT .
  methods ADD_SALES_ORDER
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_AD9
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_AD8
    raising
      CX_AI_SYSTEM_FAULT .
  methods ADD_PAYMENT
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_A11
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_A10
    raising
      CX_AI_SYSTEM_FAULT .
  methods ADD_ITEM
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_A13
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_A12
    raising
      CX_AI_SYSTEM_FAULT .
  methods ADD_INVOICE_PAYMENT
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_A17
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_A16
    raising
      CX_AI_SYSTEM_FAULT .
  methods ADD_INVOICE
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_A15
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_A14
    raising
      CX_AI_SYSTEM_FAULT .
  methods ADD_CUSTOMER_PAYMENT_METHOD_PR
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_A21
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_A20
    raising
      CX_AI_SYSTEM_FAULT .
  methods ADD_CUSTOMER
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_A19
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_A18
    raising
      CX_AI_SYSTEM_FAULT .
  methods ADD_APPLICATION_TRANSACTION
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_A23
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_A22
    raising
      CX_AI_SYSTEM_FAULT .
  methods ADD_APPLICATION_DATA
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_A25
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_A24
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_CARD_INFO
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G51
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G50
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_TRANSACTION_DETAILS
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_GE5
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_GE4
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_TERMS
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_GE7
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_GE6
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_SUB_CUSTOMER
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_GE9
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_GE8
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_SALES_REP
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G11
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G10
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_SALES_ORDER
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G13
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G12
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_REPORT_DATA
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G15
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G14
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_RECEIPTS_LIST
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G17
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G16
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_PAYMENT_FORM_URL
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G25
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G24
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_PAYMENTS_COUNT
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G21
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G20
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_PAYMENTS_BY_GATEWAY_REF_NU
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G23
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G22
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_PAYMENTS
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G19
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G18
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_MERCHANT_TRANSACTION_DATA1
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G27
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G26
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_MERCHANT_TRANSACTION_DATA
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G29
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G28
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_MERCHANT_DATA
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G31
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G30
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_INVOICE_PAYMENTS
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G35
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G34
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_INVOICE
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G33
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G32
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_GWCUSTOMER
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G37
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G36
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_EMAIL_TEMPLATES
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G39
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G38
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_EBIZ_WEB_FORM_URL
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G41
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G40
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_CUSTOMER_TOKEN
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G45
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G44
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_CUSTOMER_PAYMENT_METHOD_PR
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G47
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G46
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_CUSTOMER_PAYMENT_METHOD_P1
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G49
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G48
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_CUSTOMER
    importing
      !INPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G43
    exporting
      !OUTPUT type ZEBIZ_CHARGEIE_BIZ_SERVICE_G42
    raising
      CX_AI_SYSTEM_FAULT .
protected section.
private section.
ENDCLASS.



CLASS ZEBIZ_CHARGECO_IE_BIZ_SERVICE IMPLEMENTATION.


  method ADD_APPLICATION_DATA.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'ADD_APPLICATION_DATA'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method ADD_APPLICATION_TRANSACTION.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'ADD_APPLICATION_TRANSACTION'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method ADD_CUSTOMER.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'ADD_CUSTOMER'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method ADD_CUSTOMER_PAYMENT_METHOD_PR.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'ADD_CUSTOMER_PAYMENT_METHOD_PR'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method ADD_INVOICE.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'ADD_INVOICE'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method ADD_INVOICE_PAYMENT.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'ADD_INVOICE_PAYMENT'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method ADD_ITEM.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'ADD_ITEM'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method ADD_PAYMENT.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'ADD_PAYMENT'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method ADD_SALES_ORDER.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'ADD_SALES_ORDER'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method ADD_SALES_REP.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'ADD_SALES_REP'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method ADD_SUB_CUSTOMER.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'ADD_SUB_CUSTOMER'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method ADD_TERMS.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'ADD_TERMS'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method ADD_USER_DATA.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'ADD_USER_DATA'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method AUTHENTICATE_SK.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'AUTHENTICATE_SK'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method CLOSE_BATCH.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'CLOSE_BATCH'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method CONSTRUCTOR.

  super->constructor(
    class_name          = 'ZEBIZ_CHARGECO_IE_BIZ_SERVICE'
    logical_port_name   = logical_port_name
  ).

  endmethod.


  method COPY_CUSTOMER.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'COPY_CUSTOMER'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method DELETE_CUSTOMER_PAYMENT_METHOD.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'DELETE_CUSTOMER_PAYMENT_METHOD'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method DELETE_EBIZ_WEB_FORM_PAYMENT.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'DELETE_EBIZ_WEB_FORM_PAYMENT'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method EMAIL_RECEIPT.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'EMAIL_RECEIPT'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_APPLICATION_DATA.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_APPLICATION_DATA'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_BATCH_STATUS.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_BATCH_STATUS'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_BATCH_TRANSACTIONS.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_BATCH_TRANSACTIONS'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_CARD_INFO.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_CARD_INFO'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_CUSTOMER.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_CUSTOMER'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_CUSTOMER_PAYMENT_METHOD_P1.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_CUSTOMER_PAYMENT_METHOD_P1'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_CUSTOMER_PAYMENT_METHOD_PR.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_CUSTOMER_PAYMENT_METHOD_PR'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_CUSTOMER_TOKEN.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_CUSTOMER_TOKEN'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_EBIZ_WEB_FORM_URL.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_EBIZ_WEB_FORM_URL'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_EMAIL_TEMPLATES.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_EMAIL_TEMPLATES'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_GWCUSTOMER.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_GWCUSTOMER'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_INVOICE.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_INVOICE'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_INVOICE_PAYMENTS.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_INVOICE_PAYMENTS'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_MERCHANT_DATA.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_MERCHANT_DATA'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_MERCHANT_TRANSACTION_DATA.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_MERCHANT_TRANSACTION_DATA'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_MERCHANT_TRANSACTION_DATA1.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_MERCHANT_TRANSACTION_DATA1'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_PAYMENTS.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_PAYMENTS'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_PAYMENTS_BY_GATEWAY_REF_NU.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_PAYMENTS_BY_GATEWAY_REF_NU'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_PAYMENTS_COUNT.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_PAYMENTS_COUNT'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_PAYMENT_FORM_URL.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_PAYMENT_FORM_URL'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_RECEIPTS_LIST.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_RECEIPTS_LIST'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_REPORT_DATA.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_REPORT_DATA'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_SALES_ORDER.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_SALES_ORDER'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_SALES_REP.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_SALES_REP'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_SUB_CUSTOMER.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_SUB_CUSTOMER'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_TERMS.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_TERMS'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_TRANSACTION_DETAILS.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_TRANSACTION_DETAILS'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_USER_DATA.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_USER_DATA'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method GET_ZIP_CODE_INFO.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'GET_ZIP_CODE_INFO'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method LOGIN.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'LOGIN'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method MARK_APPLICATION_TRANSACTION_A.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'MARK_APPLICATION_TRANSACTION_A'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method MARK_CUSTOMER_AS_INACTIVE.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'MARK_CUSTOMER_AS_INACTIVE'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method MARK_EBIZ_WEB_FORM_PAYMENT_AS.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'MARK_EBIZ_WEB_FORM_PAYMENT_AS'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method MARK_INVOICE_AS_SYNCHRONIZED.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'MARK_INVOICE_AS_SYNCHRONIZED'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method MARK_PAYMENT_AS_APPLIED.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'MARK_PAYMENT_AS_APPLIED'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method MARK_RECURRING_PAYMENT_AS_APPL.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'MARK_RECURRING_PAYMENT_AS_APPL'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method MARK_SALES_ORDER_AS_SYNCHRONIZ.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'MARK_SALES_ORDER_AS_SYNCHRONIZ'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method MODIFY_SCHEDULED_RECURRING_PA1.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'MODIFY_SCHEDULED_RECURRING_PA1'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method MODIFY_SCHEDULED_RECURRING_PA2.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'MODIFY_SCHEDULED_RECURRING_PA2'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method MODIFY_SCHEDULED_RECURRING_PAY.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'MODIFY_SCHEDULED_RECURRING_PAY'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method RENDER_RECEIPT.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'RENDER_RECEIPT'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method RESEND_EBIZ_WEB_FORM_EMAIL.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'RESEND_EBIZ_WEB_FORM_EMAIL'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method RESEND_PAYMENT_FORM_EMAIL.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'RESEND_PAYMENT_FORM_EMAIL'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method RUN_CUSTOMER_TRANSACTION.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'RUN_CUSTOMER_TRANSACTION'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method RUN_TRANSACTION.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'RUN_TRANSACTION'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method SCHEDULE_RECURRING_PAYMENT.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'SCHEDULE_RECURRING_PAYMENT'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method SEARCH_APPLICATION_TRANSACTION.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'SEARCH_APPLICATION_TRANSACTION'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method SEARCH_BATCHES.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'SEARCH_BATCHES'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method SEARCH_CUSTOMERS.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'SEARCH_CUSTOMERS'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method SEARCH_CUSTOMER_LIST.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'SEARCH_CUSTOMER_LIST'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method SEARCH_EBIZ_WEB_FORM_PENDING_P.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'SEARCH_EBIZ_WEB_FORM_PENDING_P'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method SEARCH_EBIZ_WEB_FORM_RECEIVED.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'SEARCH_EBIZ_WEB_FORM_RECEIVED'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method SEARCH_INVOICES.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'SEARCH_INVOICES'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method SEARCH_ITEMS.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'SEARCH_ITEMS'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method SEARCH_PAYMENT_FORM_PENDING_PA.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'SEARCH_PAYMENT_FORM_PENDING_PA'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method SEARCH_PAYMENT_FORM_RECEIVED_P.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'SEARCH_PAYMENT_FORM_RECEIVED_P'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method SEARCH_RECURRING_PAYMENTS.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'SEARCH_RECURRING_PAYMENTS'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method SEARCH_SALES_ORDERS.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'SEARCH_SALES_ORDERS'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method SEARCH_SALES_REPS.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'SEARCH_SALES_REPS'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method SEARCH_SCHEDULED_RECURRING_PAY.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'SEARCH_SCHEDULED_RECURRING_PAY'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method SEARCH_TERMS.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'SEARCH_TERMS'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method SEARCH_TRANSACTIONS.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'SEARCH_TRANSACTIONS'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method SET_DEFAULT_CUSTOMER_PAYMENT_M.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'SET_DEFAULT_CUSTOMER_PAYMENT_M'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method UPDATE_APPLICATION_DATA.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'UPDATE_APPLICATION_DATA'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method UPDATE_CUSTOMER.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'UPDATE_CUSTOMER'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method UPDATE_CUSTOMER_PAYMENT_METHOD.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'UPDATE_CUSTOMER_PAYMENT_METHOD'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method UPDATE_INVOICE.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'UPDATE_INVOICE'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method UPDATE_ITEM.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'UPDATE_ITEM'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method UPDATE_MERCHANT_DATA.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'UPDATE_MERCHANT_DATA'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method UPDATE_SALES_ORDER.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'UPDATE_SALES_ORDER'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method UPDATE_SALES_REP.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'UPDATE_SALES_REP'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method UPDATE_SUB_CUSTOMER.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'UPDATE_SUB_CUSTOMER'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method UPDATE_TERMS.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'UPDATE_TERMS'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method UPDATE_USER_DATA.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'UPDATE_USER_DATA'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method UPLOAD_ATTACHMENT.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'UPLOAD_ATTACHMENT'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.
ENDCLASS.
