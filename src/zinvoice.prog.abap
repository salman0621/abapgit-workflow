*&---------------------------------------------------------------------*
*& Report ZINVOICE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZINVOICE.
*Creation of header for bapi


DATA: wa_header LIKE bapi_incinv_create_header.

DATA: it_item TYPE STANDARD TABLE OF bapi_incinv_create_item,
      wa_item TYPE bapi_incinv_create_item.

DATA: it_ret LIKE bapiret2 OCCURS 0 WITH HEADER LINE.

DATA: g_invno LIKE bapi_incinv_fld-inv_doc_no,
      g_fyear LIKE bapi_incinv_fld-fisc_year.

wa_header-invoice_ind = 'X'.
wa_header-doc_date = sy-datum.   "Enter the document date
wa_header-pstng_date = sy-datum. "Enter the posting date
wa_header-ref_doc_no = 'Test'.
wa_header-comp_code = '001'.
wa_header-gross_amount = '110'.  "Enter the gross amount(aft. tax) for the invoice
wa_header-calc_tax_ind = 'X'.
wa_header-currency = 'USD'.

wa_item-invoice_doc_item = '000001'.
wa_item-po_number = '4590038150'.    "Enter the PO number
wa_item-po_item = '00120'.           "Enter the PO item number
wa_item-ref_doc = '5007548571'.      "Enter the GR number
wa_item-ref_doc_year = '2012'.       "Enter the GR fiscal year
wa_item-ref_doc_it = '0001'.         "Enter the GR item number
wa_item-tax_code = 'V7'.             "Enter the tax code applicable
wa_item-item_amount = '5521.60'.     "Enter the item amount
wa_item-quantity = '2380'.           "Enter the invoice quantity
wa_item-po_unit = 'EA'.              "Enter the UoM
APPEND wa_item TO it_item.

CALL FUNCTION 'BAPI_INCOMINGINVOICE_CREATE'
  EXPORTING
    headerdata                = wa_header
*   ADDRESSDATA               =
 IMPORTING
   invoicedocnumber          = g_invno
   fiscalyear                = g_fyear
  TABLES
    itemdata                  = it_item
*   ACCOUNTINGDATA            =
*   GLACCOUNTDATA             =
*   MATERIALDATA              =
*   TAXDATA                   =
*   WITHTAXDATA               =
*   VENDORITEMSPLITDATA       =
    return                    = it_ret
*   EXTENSIONIN               =
          .

IF g_invno IS NOT INITIAL.
  CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
*   EXPORTING
*     WAIT          =
*   IMPORTING
*     RETURN        =
            .
ENDIF.
WRITE:/1 g_invno, g_fyear.

LOOP AT it_ret.
  WRITE:/1 it_ret-message.
ENDLOOP.
