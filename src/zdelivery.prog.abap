*&---------------------------------------------------------------------*
*& Report ZDELIVERY
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZDELIVERY.
*----PARAMETERS: p_vbeln LIKE vbak-vbeln.

DATA: BEGIN OF tbl_request OCCURS 0.

INCLUDE STRUCTURE bapideliciousrequest.

DATA: END OF tbl_request.


DATA: BEGIN OF tbl_items OCCURS 0.

INCLUDE STRUCTURE bapideliciouscreateditems.

DATA: END OF tbl_items.


DATA: BEGIN OF tbl_return OCCURS 0.

INCLUDE STRUCTURE bapiret2.

DATA: END OF tbl_return.


DATA: st_vbak LIKE vbak,

st_vbap LIKE vbap.


PARAMETERS: p_vbeln LIKE vbak-vbeln,

p_posnr LIKE vbap-posnr DEFAULT '000010'.

START-OF-SELECTION.

SELECT SINGLE *

INTO st_vbak

FROM vbak

WHERE vbeln = p_vbeln.

CHECK sy-subrc EQ 0.

SELECT SINGLE *

INTO st_vbap

FROM vbap

WHERE vbeln = p_vbeln AND

posnr = p_posnr.


END-OF-SELECTION.

IF st_vbak IS INITIAL.

WRITE:/ 'Invalid Sales Order'.

EXIT.

ENDIF.

tbl_request-document_numb = st_vbap-vbeln.

tbl_request-document_item = st_vbap-posnr.

tbl_request-ship_to = st_vbak-kunnr.

tbl_request-sold_to = st_vbak-kunnr.

tbl_request-sales_organisation = st_vbak-vkorg.

tbl_request-distribution_channel = st_vbak-vtweg.

tbl_request-division = st_vbak-spart.

tbl_request-plant = st_vbap-werks.

tbl_request-quantity_sales_uom = '1'.

tbl_request-sales_unit = st_vbap-vrkme.

tbl_request-base_uom = st_vbap-meins.

tbl_request-material = st_vbap-matnr.

tbl_request-delivery_date = st_vbak-bstdk.

tbl_request-delivery_time = '160000'.

tbl_request-transp_plan_date = st_vbak-bstdk.

tbl_request-loading_date = st_vbak-bstdk.

tbl_request-goods_issue_date = st_vbak-bstdk.

tbl_request-extdelv_no = '98765'.

tbl_request-document_type = 'A'. "Delivery

tbl_request-document_type_predecessor = 'A'. "Sales Ord

tbl_request-document_type_delivery = 'LF'.

APPEND tbl_request.

CALL FUNCTION 'BAPI_DELIVERYPROCESSING_EXEC'

TABLES

request = tbl_request

createditems = tbl_items

return = tbl_return.

CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'.

LOOP AT tbl_return.

WRITE:/ tbl_return-type,

tbl_return-id,

tbl_return-number,

tbl_return-message.

ENDLOOP.
