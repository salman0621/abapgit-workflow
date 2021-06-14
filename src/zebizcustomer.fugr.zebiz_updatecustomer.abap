FUNCTION ZEBIZ_UPDATECUSTOMER.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(CUSTOMER) TYPE  ZEBIZ_CHARGECUSTOMER
*"     REFERENCE(CUSTOMER_ID) TYPE  STRING
*"     REFERENCE(CUSTOMER_INTERNAL_ID) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(SUCCESSS) TYPE  /ASU/ADHOC_STEP
*"     REFERENCE(CUSTOMER_RESPONSE) TYPE  ZEBIZ_CHARGECUSTOMER_RESPONSE
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
      input type ZEBIZ_CHARGEIE_BIZ_SERVICE_U18,
      output type ZEBIZ_CHARGEIE_BIZ_SERVICE_U17.
      if proxy_test is not bound.
        create object proxy_test
        EXPORTING
            logical_port_name = 'EBIZ'.
      endif.
      Security-SECURITY_ID = CWA-SECURITYKEY.

*

*     there is one input value for this service call for user id

      input-SECURITY_TOKEN = Security.
      input-CUSTOMER = CUSTOMER.
 input-CUSTOMER_ID = CUSTOMER_ID.
 input-CUSTOMER_INTERNAL_ID = CUSTOMER_INTERNAL_ID.

*     call the method (web service call) you can use the pattern to generate the code if you wish
      call method proxy_test->UPDATE_CUSTOMER
        exporting
          input  = input
        importing
          output = output.

*     process the output
    CUSTOMER_RESPONSE = output-UPDATE_CUSTOMER_RESULT.
    successs = 'X'.
    catch cx_ai_system_fault into exc.
          msg = exc->GET_TEXT( ).
            msg = exc->GET_TEXT( ).
       CONCATENATE 'Error in UPDATE_CUSTOMER :' msg into msg.
          CALL FUNCTION 'ZEBIZ_LOGFILE'
  EXPORTING
    LOGTEXT = msg.
  .
       MESSAGE  W398(00) WITH msg.
       successs = 'Y'.
*CATCH zcx_zsqrt_exception.
CATCH cx_ai_application_fault into exc.
      msg = exc->GET_TEXT( ).
        msg = exc->GET_TEXT( ).
       CONCATENATE 'Error in UPDATE_CUSTOMER :' msg into msg.
          CALL FUNCTION 'ZEBIZ_LOGFILE'
  EXPORTING
    LOGTEXT = msg.
  .
    MESSAGE  W398(00) WITH msg.
     successs = 'Y'.
*      MESSAGE msg TYPE 'E'.
  endtry.




ENDFUNCTION.
