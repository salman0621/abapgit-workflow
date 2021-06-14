FUNCTION ZEBIZ_PAYMENTMETHODS.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(CUSTOMER_ID) TYPE  /ASU/CHAR72
*"  EXPORTING
*"     REFERENCE(PAYMENT_METHOD_PR) TYPE
*"        ZEBIZ_CHARGEPAYMENT_METHOD_TAB
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
      input type ZEBIZ_CHARGEIE_BIZ_SERVICE_G47,
      output type ZEBIZ_CHARGEIE_BIZ_SERVICE_G46,
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

*     call the method (web service call) you can use the pattern to generate the code if you wish
      call method proxy_test->GET_CUSTOMER_PAYMENT_METHOD_PR
        exporting
          input  = input
        importing
          output = output.

*     process the output

      data: wa_get type ZEBIZ_CHARGEARRAY_OF_PAYMENT_M,
            wa_get_cud type ZEBIZ_CHARGEPAYMENT_METHOD_PRO

            .
*      wa_get = output-GET_CUSTOMER_PAYMENT_METHOD_PR.
            PAYMENT_METHOD_PR = output-GET_CUSTOMER_PAYMENT_METHOD_PR-PAYMENT_METHOD_PROFILE.
*      loop at output-GET_CUSTOMER_PAYMENT_METHOD_PR-PAYMENT_METHOD_PROFILE into wa_get_cud.
*        write: 'Method Type: ', wa_get_cud-Method_Type.
** write:/ 'First Name: ', wa_get_cud-First_Name.
** write:/ 'Last Name: ', wa_get_cud-Last_Name.
**write:/ 'Phone: ', wa_get_cud-Phone.
*      endloop.
    catch cx_ai_system_fault into exc.
          msg = exc->GET_TEXT( ).
       CONCATENATE 'Error in GET_CUSTOMER_PAYMENT_METHOD_PR :' msg into msg.
          CALL FUNCTION 'ZEBIZ_LOGFILE'
  EXPORTING
    LOGTEXT = msg.
  .

       MESSAGE  W398(00) WITH msg.
*CATCH zcx_zsqrt_exception.
CATCH cx_ai_application_fault into exc.
      msg = exc->GET_TEXT( ).
       CONCATENATE 'Error in GET_CUSTOMER_PAYMENT_METHOD_PR :' msg into msg.
          CALL FUNCTION 'ZEBIZ_LOGFILE'
  EXPORTING
    LOGTEXT = msg.
  .

    MESSAGE  W398(00) WITH msg.
*      MESSAGE msg TYPE 'E'.
  endtry.




ENDFUNCTION.
