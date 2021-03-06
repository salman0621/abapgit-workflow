FUNCTION ZEBIZ_GETPAYMENTMETHOD.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(CUSTOMER_ID) TYPE  /ASU/CHAR72
*"     REFERENCE(PAYMENT_METHOD_ID) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(GET_CUSTOMER_PAYMENT_METHOD_PR) TYPE
*"        ZEBIZ_CHARGEPAYMENT_METHOD_PRO
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
        INPUT          TYPE ZEBIZ_CHARGEIE_BIZ_SERVICE_G49,
        OUTPUT         TYPE ZEBIZ_CHARGEIE_BIZ_SERVICE_G48,
        TOKEN_INPUT    TYPE ZEBIZ_CHARGEIE_BIZ_SERVICE_G45,
        TOKEN_OUTPUT   TYPE ZEBIZ_CHARGEIE_BIZ_SERVICE_G44,
        CUSTOMER_TOKEN TYPE STRING.
*     instantiate the object reference
      IF PROXY_TEST IS NOT BOUND.
        CREATE OBJECT PROXY_TEST
          EXPORTING
            LOGICAL_PORT_NAME = 'EBIZ'.
      ENDIF.
      SECURITY-SECURITY_ID = CWA-SECURITYKEY.
      TOKEN_INPUT-SECURITY_TOKEN = SECURITY.
      TOKEN_INPUT-CUSTOMER_ID = CUSTOMER_ID.
      try.
      CALL METHOD PROXY_TEST->GET_CUSTOMER_TOKEN
        EXPORTING
          INPUT  = TOKEN_INPUT
        IMPORTING
          OUTPUT = TOKEN_OUTPUT.
       CATCH CX_AI_SYSTEM_FAULT INTO EXC.
           msg = exc->GET_TEXT( ).
       CONCATENATE 'Error in GET_CUSTOMER_TOKEN :' msg into msg.
          CALL FUNCTION 'ZEBIZ_LOGFILE'
  EXPORTING
    LOGTEXT = msg.
  .
          MESSAGE  W398(00) WITH MSG.
*CATCH zcx_zsqrt_exception.
        CATCH CX_AI_APPLICATION_FAULT INTO EXC.
          msg = exc->GET_TEXT( ).
       CONCATENATE 'Error in GET_CUSTOMER_TOKEN :' msg into msg.
          CALL FUNCTION 'ZEBIZ_LOGFILE'
  EXPORTING
    LOGTEXT = msg.
  .
          MESSAGE  W398(00) WITH MSG.
      ENDTRY.

      CUSTOMER_TOKEN = TOKEN_OUTPUT-GET_CUSTOMER_TOKEN_RESULT.
*

*     there is one input value for this service call for user id

      INPUT-SECURITY_TOKEN = SECURITY.
      INPUT-CUSTOMER_TOKEN = CUSTOMER_TOKEN.
      INPUT-PAYMENT_METHOD_ID = PAYMENT_METHOD_ID.
*     call the method (web service call) you can use the pattern to generate the code if you wish
      CALL METHOD PROXY_TEST->GET_CUSTOMER_PAYMENT_METHOD_P1
        EXPORTING
          INPUT  = INPUT
        IMPORTING
          OUTPUT = OUTPUT.

*     process the output

      GET_CUSTOMER_PAYMENT_METHOD_PR = OUTPUT-GET_CUSTOMER_PAYMENT_METHOD_PR.
    CATCH CX_AI_SYSTEM_FAULT INTO EXC.
      msg = exc->GET_TEXT( ).
       CONCATENATE 'Error in GET_CUSTOMER_PAYMENT_METHOD_P1 :' msg into msg.
          CALL FUNCTION 'ZEBIZ_LOGFILE'
  EXPORTING
    LOGTEXT = msg.
  .
      MESSAGE  W398(00) WITH MSG.
*CATCH zcx_zsqrt_exception.
    CATCH CX_AI_APPLICATION_FAULT INTO EXC.
      msg = exc->GET_TEXT( ).
       CONCATENATE 'Error in GET_CUSTOMER_PAYMENT_METHOD_P1 :' msg into msg.
          CALL FUNCTION 'ZEBIZ_LOGFILE'
  EXPORTING
    LOGTEXT = msg.
  .
      MESSAGE  W398(00) WITH MSG.
*      MESSAGE msg TYPE 'E'.
  ENDTRY.




ENDFUNCTION.
