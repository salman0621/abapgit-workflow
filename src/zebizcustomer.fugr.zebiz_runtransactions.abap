FUNCTION ZEBIZ_RUNTRANSACTIONS.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(TRAN) TYPE  ZEBIZ_CHARGETRANSACTION_REQUES
*"  EXPORTING
*"     REFERENCE(RUN_TRANSACTION_RESULT) TYPE
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
        INPUT  TYPE ZEBIZ_CHARGEIE_BIZ_SERVICE_RU1,
        OUTPUT TYPE ZEBIZ_CHARGEIE_BIZ_SERVICE_RUN.
*     instantiate the object reference
      IF PROXY_TEST IS NOT BOUND.
        CREATE OBJECT PROXY_TEST
          EXPORTING
            LOGICAL_PORT_NAME = 'EBIZ'.
      ENDIF.
      SECURITY-SECURITY_ID = CWA-SECURITYKEY.
*     there is one input value for this service call for user id

      INPUT-SECURITY_TOKEN = SECURITY.
      INPUT-TRAN = TRAN.
*     call the method (web service call) you can use the pattern to generate the code if you wish
      CALL METHOD PROXY_TEST->RUN_TRANSACTION
        EXPORTING
          INPUT  = INPUT
        IMPORTING
          OUTPUT = OUTPUT.
      RUN_TRANSACTION_RESULT = OUTPUT-RUN_TRANSACTION_RESULT.

    CATCH CX_AI_SYSTEM_FAULT INTO EXC.
      MSG = EXC->GET_TEXT( ).
      CONCATENATE 'Error in RUN_TRANSACTION :' MSG INTO MSG.
      CALL FUNCTION 'ZEBIZ_LOGFILE'
        EXPORTING
          LOGTEXT = MSG.
      .

       MESSAGE  MSG TYPE 'I'.
*CATCH zcx_zsqrt_exception.
    CATCH CX_AI_APPLICATION_FAULT INTO EXC.
      MSG = EXC->GET_TEXT( ).
      CONCATENATE 'Error in RUN_TRANSACTION :' MSG INTO MSG.
      CALL FUNCTION 'ZEBIZ_LOGFILE'
        EXPORTING
          LOGTEXT = MSG.
      .

       MESSAGE  MSG TYPE 'I'.
*      MESSAGE msg TYPE 'E'.
  ENDTRY.




ENDFUNCTION.
