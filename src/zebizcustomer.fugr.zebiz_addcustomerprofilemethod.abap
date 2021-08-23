FUNCTION ZEBIZ_ADDCUSTOMERPROFILEMETHOD.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(CUSTOMERPRM) TYPE  ZEBIZ_CHARGEPAYMENT_METHOD_PRO
*"     REFERENCE(CUSTOMER_INTERNAL_ID) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(SUCCESSS) TYPE  /ASU/ADHOC_STEP
*"     REFERENCE(ADD_CUSTOMER_PAYMENT_METHOD_PR) TYPE  STRING
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
      input type ZEBIZ_CHARGEIE_BIZ_SERVICE_A21,
      output type ZEBIZ_CHARGEIE_BIZ_SERVICE_A20.
      if proxy_test is not bound.
        create object proxy_test
        EXPORTING
            logical_port_name = 'EBIZ'.
      endif.
      Security-SECURITY_ID = CWA-SECURITYKEY.

*

*     there is one input value for this service call for user id

      input-SECURITY_TOKEN = Security.
      input-CUSTOMER_INTERNAL_ID = CUSTOMER_INTERNAL_ID.
      input-PAYMENT_METHOD_PROFILE = CUSTOMERPRM.

*     call the method (web service call) you can use the pattern to generate the code if you wish
      call method proxy_test->ADD_CUSTOMER_PAYMENT_METHOD_PR
        exporting
          input  = input
        importing
          output = output.

*     process the output
    ADD_CUSTOMER_PAYMENT_METHOD_PR = output-ADD_CUSTOMER_PAYMENT_METHOD_PR.
    successs = 'X'.
    catch cx_ai_system_fault into exc.
          msg = exc->GET_TEXT( ).
          CONCATENATE 'Error in ADD_CUSTOMER_PAYMENT_METHOD_PR :' msg into msg.
          CALL FUNCTION 'ZEBIZ_LOGFILE'
  EXPORTING
    LOGTEXT = msg.
* IMPORTING
*   STATUS  =
  .
        MESSAGE  MSG TYPE 'I'.
       successs = 'Y'.
*CATCH zcx_zsqrt_exception.
CATCH cx_ai_application_fault into exc.
      msg = exc->GET_TEXT( ).
       CONCATENATE 'Error in ADD_CUSTOMER_PAYMENT_METHOD_PR :' msg into msg.
          CALL FUNCTION 'ZEBIZ_LOGFILE'
  EXPORTING
    LOGTEXT = msg.
* IMPORTING
*   STATUS  =
  .
     MESSAGE  MSG TYPE 'I'.
     successs = 'Y'.
*      MESSAGE msg TYPE 'E'.
  endtry.




ENDFUNCTION.
