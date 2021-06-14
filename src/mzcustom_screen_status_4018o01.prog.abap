*----------------------------------------------------------------------*
***INCLUDE MZCUSTOM_SCREEN_STATUS_4018O01.
*----------------------------------------------------------------------*

*     Data for screen 4018
DATA: 4018_CUSTOMERID      TYPE C LENGTH 50,
      4018_CUSTOMER_NAME   TYPE C LENGTH 50,
      4018_EMAIL_TEMPLATE  TYPE C LENGTH 50,
      4018_EMAIL_SUBJECT   TYPE C LENGTH 50,
      4018_CUSTOMER_EMAIL  TYPE C LENGTH 50,
      EMAIL_SUBJECT        TYPE C LENGTH 50,
      TEMPLATE_INTERNAL_ID TYPE STRING
      .

DATA: WA_ETEMP_CUD                TYPE ZEBIZ_CHARGEEMAIL_TEMPLATE,
      WA_ETEMP                    TYPE ZEBIZ_CHARGEEMAIL_TEMPLATE_TAB,
      E_PAYMENT_FORM              TYPE ZEBIZ_CHARGEEBIZ_WEB_FORM,
      BILL_ADDRESS                TYPE ZEBIZ_CHARGEADDRESS,
      SHIP_ADDRESS                TYPE ZEBIZ_CHARGEADDRESS,
      GET_EBIZ_WEB_FORM_URLRESULT TYPE STRING.
*&---------------------------------------------------------------------*
*&      Module  STATUS_4018  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE STATUS_4018 OUTPUT.
  IF SY-UCOMM = 'EBIZ_FC4'.
    CLEAR: GS_VALUES, GT_VALUES[], GT_ID.
    SELECT SINGLE *  FROM ADR6 INTO  CWA_AD6
WHERE ADDRNUMBER = KNA1-ADRNR.
    CONCATENATE KNA1-NAME1 KNA1-NAME2 INTO NAME SEPARATED BY space.
    4018_CUSTOMERID = CUSTOMERID = KNA1-KUNNR.
    4018_CUSTOMER_NAME = NAME.
    4018_EMAIL_TEMPLATE = ''.
    4018_EMAIL_SUBJECT = ''.
    4018_CUSTOMER_EMAIL = CWA_AD6-SMTP_ADDR.

    CALL FUNCTION 'ZEBIZ_GETEMAILTEMPLATE'
      EXPORTING
        CUSTOMER_ID    = CUSTOMERID
      IMPORTING
        EMAIL_TEMPLATE = WA_ETEMP.
    LOOP AT WA_ETEMP INTO WA_ETEMP_CUD.
      IF WA_ETEMP_CUD-TEMPLATE_TYPE_ID = 'AddPaymentMethodFormEmail'.
        GS_VALUES-TEXT = WA_ETEMP_CUD-TEMPLATE_NAME.
        GS_VALUES-KEY = WA_ETEMP_CUD-TEMPLATE_INTERNAL_ID.
        EMAIL_SUBJECT = WA_ETEMP_CUD-TEMPLATE_SUBJECT.
        APPEND GS_VALUES TO GT_VALUES.
      ENDIF.
    ENDLOOP.
    GT_ID = '4018_EMAIL_TEMPLATE'.

    CALL FUNCTION 'VRM_SET_VALUES'
      EXPORTING
        ID     = GT_ID
        VALUES = GT_VALUES.
*  EXCEPTIONS
*    ID_ILLEGAL_NAME       = 1
*    OTHERS                = 2
    CLEAR: GS_VALUES, GT_VALUES[], GT_ID.
  ENDIF.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  SEND_COMMAND_4018  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE SEND_COMMAND_4018 INPUT.
  IF SY-UCOMM = 'FCT_SEND'.
    LV_DATE = SY-DATUM.
    LV_TIME = SY-UZEIT.
    CONVERT DATE LV_DATE TIME LV_TIME INTO TIME STAMP TSTP TIME ZONE GDATE .
    TEMPLATE_INTERNAL_ID = 4018_EMAIL_TEMPLATE.
    CALL FUNCTION 'ZEBIZ_GETEMAILTEMPLATEBYID'
      EXPORTING
        CUSTOMER_ID          = CUSTOMERID
        TEMPLATE_INTERNAL_ID = TEMPLATE_INTERNAL_ID
      IMPORTING
        EMAIL_TEMPLATE       = WA_ETEMP.
    LOOP AT WA_ETEMP INTO WA_ETEMP_CUD.
      E_PAYMENT_FORM-Form_Type = 'PmRequestForm'.
     E_PAYMENT_FORM-Pay_By_Type = 'cc:ach'.
     E_PAYMENT_FORM-EMAIL_ADDRESS = 4018_CUSTOMER_EMAIL.
      E_PAYMENT_FORM-EMAIL_SUBJECT = 4018_EMAIL_SUBJECT.
      E_PAYMENT_FORM-EMAIL_TEMPLATE_ID = 4018_EMAIL_TEMPLATE.
      E_PAYMENT_FORM-EMAIL_TEMPLATE_NAME = WA_ETEMP_CUD-TEMPLATE_NAME.
      E_PAYMENT_FORM-SEND_EMAIL_TO_CUSTOMER = 'X'.
      E_PAYMENT_FORM-CUSTOMER_ID = CUSTOMERID.
      E_PAYMENT_FORM-CUST_FULL_NAME = 4018_CUSTOMER_NAME.
      E_PAYMENT_FORM-DATE = TSTP.
      E_PAYMENT_FORM-DUE_DATE = TSTP.
      E_PAYMENT_FORM-Invoice_Number = 'INV000'.
      E_PAYMENT_FORM-TOTAL_AMOUNT = '0.1'.
      E_PAYMENT_FORM-AMOUNT_DUE = '0.1'.
      E_Payment_Form-TIP_AMOUNT = 0.
       E_Payment_Form-SHIPPING_AMOUNT = 0.
       E_Payment_Form-DUTY_AMOUNT = 0.
       E_Payment_Form-TAX_AMOUNT = 0.

*     Billing address.
      BILL_ADDRESS-First_NAME = KNA1-NAME1.
     BILL_ADDRESS-LAST_NAME = KNA1-NAME2.
    BILL_ADDRESS-COMPANY_NAME = 4018_CUSTOMER_NAME.
     BILL_ADDRESS-ADDRESS1 = KNA1-STRAS.
          BILL_ADDRESS-CITY = KNA1-ORT01.
          BILL_ADDRESS-STATE = KNA1-REGIO.
          BILL_ADDRESS-ZIP_CODE = KNA1-PSTLZ.
BILL_ADDRESS-COUNTRY = KNA1-LAND1.
BILL_ADDRESS-is_Default = 'X'.
E_PAYMENT_FORM-BILLING_ADDRESS = BILL_ADDRESS.
*      Shipping Address
SHIP_ADDRESS-First_NAME = KNA1-NAME1.
     SHIP_ADDRESS-LAST_NAME = KNA1-NAME2.
    SHIP_ADDRESS-COMPANY_NAME = 4018_CUSTOMER_NAME.
     SHIP_ADDRESS-ADDRESS1 = KNA1-STRAS.
          SHIP_ADDRESS-CITY = KNA1-ORT01.
          SHIP_ADDRESS-STATE = KNA1-REGIO.
          SHIP_ADDRESS-ZIP_CODE = KNA1-PSTLZ.
SHIP_ADDRESS-COUNTRY = KNA1-LAND1.
SHIP_ADDRESS-is_Default = 'X'.
E_PAYMENT_FORM-SHIPPING_ADDRESS = BILL_ADDRESS.
    ENDLOOP.

    CALL FUNCTION 'ZEBIZ_GETWEBFORMURL'
      EXPORTING
        CUSTOMER_ID                 = CUSTOMERID
        E_PAYMENT_FORM              = E_PAYMENT_FORM
      IMPORTING
        GET_EBIZ_WEB_FORM_URLRESULT = GET_EBIZ_WEB_FORM_URLRESULT.
     4018_EMAIL_TEMPLATE = TEMPLATE_INTERNAL_ID.
    MESSAGE 'Request send successfully check the email.' TYPE 'S'.
  ENDIF.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  EMAIL_COMMAND_4018  INPUT
*&---------------------------------------------------------------------*
*       text

*----------------------------------------------------------------------*
MODULE EMAIL_COMMAND_4018 INPUT.
  IF SY-UCOMM = 'FCT_EMAIL'.
    CUSTOMERID = KNA1-KUNNR.
    CALL FUNCTION 'ZEBIZ_GETEMAILTEMPLATE'
      EXPORTING
        CUSTOMER_ID    = CUSTOMERID
      IMPORTING
        EMAIL_TEMPLATE = WA_ETEMP.
    LOOP AT WA_ETEMP INTO WA_ETEMP_CUD.
      IF WA_ETEMP_CUD-TEMPLATE_TYPE_ID = 'AddPaymentMethodFormEmail'.
       4018_EMAIL_TEMPLATE = WA_ETEMP_CUD-TEMPLATE_INTERNAL_ID.
        4018_EMAIL_SUBJECT = WA_ETEMP_CUD-TEMPLATE_SUBJECT.
      ENDIF.
    ENDLOOP.
  ENDIF.
ENDMODULE.