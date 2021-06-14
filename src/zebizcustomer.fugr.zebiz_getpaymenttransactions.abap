FUNCTION ZEBIZ_GETPAYMENTTRANSACTIONS.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(CUSTOMER_ID) TYPE  /ASU/CHAR72
*"     REFERENCE(FROMDATE) TYPE  STRING
*"     REFERENCE(TODATE) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(SEARCH_TRANSACTIONS_RESULT) TYPE
*"        ZEBIZ_CHARGETRANSACTION_SEARCH
*"----------------------------------------------------------------------
  DATA: EXC TYPE REF TO CX_ROOT.
  DATA: MSG TYPE STRING.
  DATA: PROXY_TEST TYPE REF TO ZEBIZ_CHARGECO_IE_BIZ_SERVICE,
        SECURITY   TYPE ZEBIZ_CHARGESECURITY_TOKEN.

  DATA: CWA        TYPE ZEBIZ_CONFIG
        .
  SELECT SINGLE * FROM ZEBIZ_CONFIG INTO CWA
    .

  TRY.
      DATA:
        INPUT  TYPE ZEBIZ_CHARGEIE_BIZ_SERVICE_SE2,
        OUTPUT TYPE ZEBIZ_CHARGEIE_BIZ_SERVICE_SEA,
        FILTER TYPE ZEBIZ_CHARGESEARCH_FILTER,
        ITAB   LIKE TABLE OF FILTER.
*     instantiate the object reference
      IF PROXY_TEST IS NOT BOUND.
        CREATE OBJECT PROXY_TEST
          EXPORTING
            LOGICAL_PORT_NAME = 'EBIZ'.
      ENDIF.
      SECURITY-SECURITY_ID = CWA-SECURITYKEY.
      FILTER-FIELD_NAME = 'CustomerID'.
      FILTER-COMPARISON_OPERATOR = 'eq'.
      FILTER-FIELD_VALUE = CUSTOMER_ID.
      APPEND FILTER TO ITAB.
      if FromDate <> ''.
          FILTER-FIELD_NAME = 'Created'.
      FILTER-COMPARISON_OPERATOR = 'gt'.
      FILTER-FIELD_VALUE = FromDate.
      APPEND FILTER TO ITAB.
        endif.
 if ToDate <> ''.
          FILTER-FIELD_NAME = 'Created'.
      FILTER-COMPARISON_OPERATOR = 'lt'.
      FILTER-FIELD_VALUE = ToDate.
      APPEND FILTER TO ITAB.
        endif.
*

*     there is one input value for this service call for user id

      INPUT-SECURITY_TOKEN = SECURITY.
      INPUT-FILTERS-SEARCH_FILTER = ITAB.
      INPUT-match_All = 'X'.
 INPUT-limit = '100000'.
*     call the method (web service call) you can use the pattern to generate the code if you wish
      CALL METHOD PROXY_TEST->SEARCH_TRANSACTIONS
        EXPORTING
          INPUT  = INPUT
        IMPORTING
          OUTPUT = OUTPUT.
      SEARCH_TRANSACTIONS_RESULT = OUTPUT-SEARCH_TRANSACTIONS_RESULT.

    CATCH CX_AI_SYSTEM_FAULT INTO EXC.
      MSG = EXC->GET_TEXT( ).
      CONCATENATE 'Error in SEARCH_TRANSACTIONS :' MSG INTO MSG.
      CALL FUNCTION 'ZEBIZ_LOGFILE'
        EXPORTING
          LOGTEXT = MSG.
      .

      MESSAGE  W398(00) WITH MSG.
*CATCH zcx_zsqrt_exception.
    CATCH CX_AI_APPLICATION_FAULT INTO EXC.
      MSG = EXC->GET_TEXT( ).
      CONCATENATE 'Error in SEARCH_TRANSACTIONS :' MSG INTO MSG.
      CALL FUNCTION 'ZEBIZ_LOGFILE'
        EXPORTING
          LOGTEXT = MSG.
      .

      MESSAGE  W398(00) WITH MSG.
*      MESSAGE msg TYPE 'E'.
  ENDTRY.




ENDFUNCTION.
