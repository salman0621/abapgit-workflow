FUNCTION ZEBIZ_CHECKCUSTOMER.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(CUSTOMER_ID) TYPE  /ASU/CHAR72
*"  EXPORTING
*"     REFERENCE(FOUND) TYPE  /ASU/ADHOC_STEP
*"     REFERENCE(GET_CUSTOMER_RESULT) TYPE  ZEBIZ_CHARGECUSTOMER
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
      input type ZEBIZ_CHARGEIE_BIZ_SERVICE_G43,
      output type ZEBIZ_CHARGEIE_BIZ_SERVICE_G42.

      Security-SECURITY_ID = CWA-SECURITYKEY.
 if proxy_test is not bound.
        create object proxy_test
        EXPORTING
            logical_port_name = 'EBIZ'.
      endif.

*     there is one input value for this service call for user id

      input-SECURITY_TOKEN = Security.
  input-CUSTOMER_ID = CUSTOMER_ID.

*     call the method (web service call) you can use the pattern to generate the code if you wish
      call method proxy_test->GET_CUSTOMER
        exporting
          input  = input
        importing
          output = output.

*     process the output
Found = 'X'.
GET_CUSTOMER_RESULT = output-GET_CUSTOMER_RESULT.

    catch cx_ai_system_fault into exc.
       msg = exc->GET_TEXT( ).
       CONCATENATE 'Error in GET_CUSTOMER :' msg into msg.
          CALL FUNCTION 'ZEBIZ_LOGFILE'
  EXPORTING
    LOGTEXT = msg.
* IMPORTING
*   STATUS  =
  .
           Found = 'N'.
*CATCH zcx_zsqrt_exception.
CATCH cx_ai_application_fault into exc.
  msg = exc->GET_TEXT( ).
       CONCATENATE 'Error in GET_CUSTOMER :' msg into msg.
          CALL FUNCTION 'ZEBIZ_LOGFILE'
  EXPORTING
    LOGTEXT = msg.
* IMPORTING
*   STATUS  =
  .
   Found = 'N'.
  endtry.

ENDFUNCTION.
