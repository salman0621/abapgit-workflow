FUNCTION ZEBIZ_SETPAYMENTMETHOD_DEFAULT.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(CUSTOMER_ID) TYPE  /ASU/CHAR72
*"     REFERENCE(PAYMENT_METHOD_ID) TYPE  CHAR40
*"  EXPORTING
*"     REFERENCE(SET_DEFAULT_CUSTOMER_PAYMENT_M) TYPE  XSDBOOLEAN
*"----------------------------------------------------------------------
data: exc type ref to cx_root.
data: msg type string.
Data: proxy_test type REF to ZEBIZ_CHARGECO_IE_BIZ_SERVICE,
      Security type ZEBIZ_CHARGESECURITY_TOKEN.

DATA: CWA        TYPE ZEBIZ_CONFIG
      .
SELECT SINGLE * FROM ZEBIZ_CONFIG INTO CWA
  .

  try.
    Data:
      input type ZEBIZ_CHARGEIE_BIZ_SERVICE_SE1,
      output type ZEBIZ_CHARGEIE_BIZ_SERVICE_SET,
      token_input type ZEBIZ_CHARGEIE_BIZ_SERVICE_G45,
      token_output type ZEBIZ_CHARGEIE_BIZ_SERVICE_G44,
      Customer_Token type string.
*     instantiate the object reference
      if proxy_test is not bound.
        create object proxy_test
        EXPORTING
            logical_port_name = 'EBIZ'.
      endif.
      Security-SECURITY_ID = CWA-SECURITYKEY.
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
Customer_Token = token_output-GET_CUSTOMER_TOKEN_RESULT.
*

*     there is one input value for this service call for user id

      input-SECURITY_TOKEN = Security.
  input-CUSTOMER_TOKEN = Customer_Token.
  input-PAYMENT_METHOD_ID = PAYMENT_METHOD_ID.
*     call the method (web service call) you can use the pattern to generate the code if you wish
      call method proxy_test->SET_DEFAULT_CUSTOMER_PAYMENT_M
        exporting
          input  = input
        importing
          output = output.

*     process the output

    SET_DEFAULT_CUSTOMER_PAYMENT_M = output-SET_DEFAULT_CUSTOMER_PAYMENT_M.
    catch cx_ai_system_fault into exc.
         msg = exc->GET_TEXT( ).
       CONCATENATE 'Error in SET_DEFAULT_CUSTOMER_PAYMENT_M :' msg into msg.
          CALL FUNCTION 'ZEBIZ_LOGFILE'
  EXPORTING
    LOGTEXT = msg.
  .
       MESSAGE  W398(00) WITH msg.
*CATCH zcx_zsqrt_exception.
CATCH cx_ai_application_fault into exc.
      msg = exc->GET_TEXT( ).
       CONCATENATE 'Error in SET_DEFAULT_CUSTOMER_PAYMENT_M :' msg into msg.
          CALL FUNCTION 'ZEBIZ_LOGFILE'
  EXPORTING
    LOGTEXT = msg.
  .
    MESSAGE  W398(00) WITH msg.
*      MESSAGE msg TYPE 'E'.
  endtry.




ENDFUNCTION.
