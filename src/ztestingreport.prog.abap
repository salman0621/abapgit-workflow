*&---------------------------------------------------------------------*
*& Report ZTESTINGREPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTESTINGREPORT.
DATA: EXC TYPE REF TO CX_ROOT.
DATA: MSG TYPE STRING.
DATA: wa_get_cud type ZEBIZ_CHARGEPAYMENT_METHOD_PRO,
      wa_get type ZEBIZ_CHARGEPAYMENT_METHOD_TAB.

TRY.
CALL FUNCTION 'ZEBIZ_PAYMENTMETHODS'
  EXPORTING
    CUSTOMER_ID = 'salman'
 IMPORTING
   PAYMENT_METHOD_PR       = wa_get
  .

    LOOP AT wa_get INTO WA_GET_CUD.
      WRITE: 'Method Type: ', WA_GET_CUD-METHOD_TYPE.
  WRITE:/ 'Card Number: ', WA_GET_CUD-Card_NUMber.
* write:/ 'First Name: ', wa_get_cud-First_Name.
* write:/ 'Last Name: ', wa_get_cud-Last_Name.
*write:/ 'Phone: ', wa_get_cud-Phone.
    ENDLOOP.
  CATCH CX_AI_SYSTEM_FAULT INTO EXC.
    MSG = EXC->GET_TEXT( ).
    WRITE:/  MSG.
*CATCH zcx_zsqrt_exception.
  CATCH CX_AI_APPLICATION_FAULT INTO EXC.
    MSG = EXC->GET_TEXT( ).
    WRITE:/  MSG.
ENDTRY.
