FUNCTION ZEBIZ_RUNCUSTOMERTRANSACTION.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(CUSTOMER_ID) TYPE  STRING
*"     REFERENCE(PAYMENT_METHOD_ID) TYPE  STRING
*"     REFERENCE(TRAN) TYPE  ZEBIZ_CHARGECUSTOMER_TRANSACTI
*"  EXPORTING
*"     REFERENCE(RUN_CUSTOMER_TRANSACTION_RESUL) TYPE
*"        ZEBIZ_CHARGETRANSACTION_RESPON
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
        INPUT          TYPE ZEBIZ_CHARGEIE_BIZ_SERVICE_RU3,
        OUTPUT         TYPE ZEBIZ_CHARGEIE_BIZ_SERVICE_RU2,
          TOKEN_INPUT    TYPE ZEBIZ_CHARGEIE_BIZ_SERVICE_G45,
        TOKEN_OUTPUT   TYPE ZEBIZ_CHARGEIE_BIZ_SERVICE_G44,
        CUSTOMER_TOKEN TYPE STRING.
      IF PROXY_TEST IS NOT BOUND.
        CREATE OBJECT PROXY_TEST
          EXPORTING
            LOGICAL_PORT_NAME = 'EBIZ'.
      ENDIF.
      SECURITY-SECURITY_ID = CWA-SECURITYKEY.
 token_input-SECURITY_TOKEN = security.
       token_input-CUSTOMER_ID = Customer_ID.
       try.
call method proxy_test->GET_CUSTOMER_TOKEN
        exporting
          input  = token_input
        importing
          output = token_output.
  CATCH CX_AI_SYSTEM_FAULT INTO EXC.
           msg = exc->GET_TEXT( ).
       CONCATENATE 'Error in GET_CUSTOMER_TOKEN :' msg into msg.
          CALL FUNCTION 'ZEBIZ_LOGFILE'
  EXPORTING
    LOGTEXT = msg.
  .
          MESSAGE  MSG TYPE 'I' DISPLAY LIKE 'E'.
*CATCH zcx_zsqrt_exception.
        CATCH CX_AI_APPLICATION_FAULT INTO EXC.
          msg = exc->GET_TEXT( ).
       CONCATENATE 'Error in GET_CUSTOMER_TOKEN :' msg into msg.
          CALL FUNCTION 'ZEBIZ_LOGFILE'
  EXPORTING
    LOGTEXT = msg.
  .
           MESSAGE  MSG TYPE 'I'.
      ENDTRY.
*     there is one input value for this service call for user id

      INPUT-SECURITY_TOKEN = SECURITY.
      INPUT-CUST_NUM = token_output-GET_CUSTOMER_TOKEN_RESULT.
      INPUT-PAYMENT_METHOD_ID = PAYMENT_METHOD_ID.
      INPUT-TRAN = TRAN.

*     call the method (web service call) you can use the pattern to generate the code if you wish
      CALL METHOD PROXY_TEST->RUN_CUSTOMER_TRANSACTION
        EXPORTING
          INPUT  = INPUT
        IMPORTING
          OUTPUT = OUTPUT.

*     process the output
      RUN_CUSTOMER_TRANSACTION_RESUL = OUTPUT-RUN_CUSTOMER_TRANSACTION_RESUL.
    CATCH CX_AI_SYSTEM_FAULT INTO EXC.
   msg = exc->GET_TEXT( ).
       CONCATENATE 'Error in RUN_CUSTOMER_TRANSACTION :' msg into msg.
          CALL FUNCTION 'ZEBIZ_LOGFILE'
  EXPORTING
    LOGTEXT = msg.
  .
   DATA itab(64) OCCURS 0 WITH HEADER LINE.

    SPLIT MSG AT 'Error:' INTO TABLE itab.

    LOOP AT itab.

      RUN_CUSTOMER_TRANSACTION_RESUL-Error = itab.

    ENDLOOP.
*RUN_CUSTOMER_TRANSACTION_RESUL-Error = MSG.
      MESSAGE  MSG TYPE 'I' DISPLAY LIKE 'E'.
*CATCH zcx_zsqrt_exception.
    CATCH CX_AI_APPLICATION_FAULT INTO EXC.
     msg = exc->GET_LONGTEXT( ).
       CONCATENATE 'Error in RUN_CUSTOMER_TRANSACTION :' msg into msg.
          CALL FUNCTION 'ZEBIZ_LOGFILE'
  EXPORTING
    LOGTEXT = msg.
  .
          MESSAGE  MSG TYPE 'I'.
*      MESSAGE msg TYPE 'E'.
  ENDTRY.
ENDFUNCTION.
