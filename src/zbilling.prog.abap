*&---------------------------------------------------------------------*
*& Report ZBILLING
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZBILLING.
DATA: s_vbap TYPE vbap.

*

TABLES: vbak,vbap,likp, lips.

DATA: t_billing TYPE STANDARD TABLE OF bapivbrk WITH HEADER LINE.

DATA: t_conditions TYPE STANDARD TABLE OF bapikomv WITH HEADER LINE.

DATA: t_return TYPE STANDARD TABLE OF bapireturn1 WITH HEADER LINE.

DATA: t_ccard TYPE STANDARD TABLE OF bapiccard_vf WITH HEADER LINE.

DATA: t_errors TYPE STANDARD TABLE OF bapivbrkerrors WITH HEADER LINE.

DATA: t_success TYPE STANDARD TABLE OF bapivbrksuccess WITH HEADER LINE

.

PARAMETERS: p_vbeln LIKE vbak-vbeln.

select single * from likp

where vbeln = p_vbeln.

SELECT SINGLE * from lips where

vbeln = likp-vbeln.

t_billing-salesorg = likp-vkorg.

t_billing-ref_doc = likp-vbeln.

t_billing-ref_item = lips-posnr.

t_billing-doc_number = p_vbeln.

t_billing-itm_number = lips-posnr.

t_billing-ordbilltyp = 'F2'.

t_billing-price_date = sy-datum.

t_billing-ref_doc_ca = likp-vbtyp.

t_billing-material = lips-matnr.

t_billing-plant = lips-werks.


*t_billing-SALESORG = likp-vkorg.
*
*t_billing-DISTR_CHAN = '01'.
*
*t_billing-DIVISION = '01'.
*
*t_billing-ORDBILLTYP = 'F2'.
*
*t_billing-price_date = sy-datum.
*
*t_billing-SOLD_TO = '14'.
*
*t_billing-ITEM_CATEG = 'DLN'.
*
*t_billing-REQ_QTY = '13'.
*
*t_billing-SALES_UNIT = '13'.
*
*t_billing-CURRENCY = 'USD'.
*
*t_billing-SHORT_TEXT = 'Test'.
*
*t_billing-BILL_DATE = sy-datum.
*
*t_billing-ITM_NUMBER = '10'.
*
*t_billing-ITEM = 'COKE10'.
*
*
*t_billing-COUNTRY = 'AUS'.
*
*t_billing-TAXCL_1MAT = '1'.

APPEND t_billing.

CALL FUNCTION 'BAPI_BILLINGDOC_CREATEMULTIPLE'

TABLES

billingdatain = t_billing

return = t_return

success = t_success

.

LOOP AT t_return.
WRITE:/ t_return-type,

t_return-id,

t_return-number,

t_return-message.
ENDLOOP.
commit work.
