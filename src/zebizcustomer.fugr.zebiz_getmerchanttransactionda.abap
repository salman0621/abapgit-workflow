FUNCTION ZEBIZ_GETMERCHANTTRANSACTIONDA.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  EXPORTING
*"     REFERENCE(GET_MERCHANT_TRANSACTION_DATA) TYPE
*"        ZEBIZ_CHARGEMERCHANT_TRANSACTI
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
        INPUT          TYPE ZEBIZ_CHARGEIE_BIZ_SERVICE_G27,
        OUTPUT         TYPE ZEBIZ_CHARGEIE_BIZ_SERVICE_G26
       .
*     instantiate the object reference
      IF PROXY_TEST IS NOT BOUND.
        CREATE OBJECT PROXY_TEST
          EXPORTING
            LOGICAL_PORT_NAME = 'EBIZ'.
      ENDIF.
      SECURITY-SECURITY_ID = CWA-SECURITYKEY.

*

*     there is one input value for this service call for user id

      INPUT-SECURITY_TOKEN = SECURITY.
*     call the method (web service call) you can use the pattern to generate the code if you wish
      CALL METHOD PROXY_TEST->GET_MERCHANT_TRANSACTION_DATA1
        EXPORTING
          INPUT  = INPUT
        IMPORTING
          OUTPUT = OUTPUT.

*     process the output

      GET_MERCHANT_TRANSACTION_DATA = OUTPUT-GET_MERCHANT_TRANSACTION_DATA.
    CATCH CX_AI_SYSTEM_FAULT INTO EXC.
      msg = exc->GET_TEXT( ).
       CONCATENATE 'Error in ZEBIZ_GETMERCHANTTRANSACTIONDA1 :' msg into msg.
          CALL FUNCTION 'ZEBIZ_LOGFILE'
  EXPORTING
    LOGTEXT = msg.
  .
       MESSAGE  MSG TYPE 'I' DISPLAY LIKE 'E'.
*CATCH zcx_zsqrt_exception.
    CATCH CX_AI_APPLICATION_FAULT INTO EXC.
      msg = exc->GET_TEXT( ).
       CONCATENATE 'Error in ZEBIZ_GETMERCHANTTRANSACTIONDA1 :' msg into msg.
          CALL FUNCTION 'ZEBIZ_LOGFILE'
  EXPORTING
    LOGTEXT = msg.
  .
         MESSAGE  MSG TYPE 'I' DISPLAY LIKE 'E'.
*      MESSAGE msg TYPE 'E'.
  ENDTRY.




ENDFUNCTION.
