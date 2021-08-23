*----------------------------------------------------------------------*
***INCLUDE MZCUSTOM_SCREEN_GETDATA_409O01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  GETDATA_4098  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE GETDATA_4098 OUTPUT.

  IF SY-DYNNR = '4098' AND SY-UCOMM = 'T\15'.
    CUSTOMERID = VBAK-KUNNR.
    CLEAR: IT_OUTTAB[], IT_FLDCAT[], CWA_MATRIX, CT_MATRIX, ZEBIZ_MATRIX.
    ORDERID = VBAK-VBELN.
    FDATE = ''.
    TDATE = ''.
    CALL FUNCTION 'ZEBIZ_GETPAYMENTTRANSACTIONS'
      EXPORTING
        CUSTOMER_ID                = CUSTOMERID
        ORDERID                    = ORDERID
        FROMDATE                   = FDATE
        TODATE                     = TDATE
      IMPORTING
        SEARCH_TRANSACTIONS_RESULT = SEARCH_TRANSACTIONS_RESULT.
    SORT SEARCH_TRANSACTIONS_RESULT-TRANSACTIONS-TRANSACTION_OBJECT BY DATE_TIME DESCENDING.
    LOOP AT SEARCH_TRANSACTIONS_RESULT-TRANSACTIONS-TRANSACTION_OBJECT INTO 4098_CWA.

      CWA_MATRIX-CUSTOMER_ID = 4098_CWA-CUSTOMER_ID.
      CWA_MATRIX-INVOICE = 4098_CWA-DETAILS-INVOICE.
      CWA_MATRIX-ORDER_ID = 4098_CWA-DETAILS-ORDER_ID.
      CWA_MATRIX-REF_NUM = 4098_CWA-RESPONSE-REF_NUM.
      CWA_MATRIX-AMOUNT = 4098_CWA-DETAILS-AMOUNT.
      CWA_MATRIX-TRANSACTION_TYPE = 4098_CWA-TRANSACTION_TYPE.
      CWA_MATRIX-AUTH_AMOUNT = 4098_CWA-RESPONSE-AUTH_AMOUNT.
      CWA_MATRIX-STATUS = 4098_CWA-RESPONSE-STATUS.
      CWA_MATRIX-TRANSACTION_STATUS = 4098_CWA-STATUS.
      CWA_MATRIX-TRANSACTION_DATE = 4098_CWA-DATE_TIME.
      CWA_MATRIX-DESCRIPTION = 'Sales Order'.
      CWA_MATRIX-CARDHOLDER = 4098_CWA-ACCOUNT_HOLDER.
      CWA_MATRIX-CARDNO = 4098_CWA-CREDIT_CARD_DATA-CARD_NUMBER.
      CWA_MATRIX-AVS = 4098_CWA-RESPONSE-AVS_RESULT.
      CWA_MATRIX-CARDCODE = 4098_CWA-CREDIT_CARD_DATA-CARD_CODE.
      CWA_MATRIX-TRANSACTION_DATE = 4098_CWA-DATE_TIME.

      CWA_MATRIX-EMAIL = CWA_AD6-SMTP_ADDR.
      APPEND CWA_MATRIX TO CT_MATRIX.
    ENDLOOP.
  ENDIF.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  FILL_MATRIX_4098  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE FILL_MATRIX_4098 OUTPUT.
  IF SY-STEPL = 1.
    4098_MATRIX-LINES = 4098_MATRIX-TOP_LINE + SY-LOOPC - 1.
  ENDIF.

*  ZEBIZ_CHARGETRANSACTION_OBJECT-Customer_ID = 4012_CWA-Customer_ID.
  MOVE-CORRESPONDING CWA_MATRIX TO ZEBIZ_MATRIX.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  VOID_4098  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE VOID_4098 INPUT.

  IF SY-DYNNR = '4098' AND SY-UCOMM = 'FCT_VOID'.

*Call Screen 4020 STARTING AT 10 08
*                 ENDING AT 70 16.
    READ TABLE CT_MATRIX INTO CWA_MATRIX INDEX MATRIX-CURRENT_LINE.
    IF CSELECT EQ 'X'.

      TRAN-COMMAND = 'creditvoid'.
      TRAN-REF_NUM = CWA_MATRIX-REF_NUM.

      CALL FUNCTION 'ZEBIZ_RUNTRANSACTIONS'
      EXPORTING
        TRAN                   = TRAN
      IMPORTING
        RUN_TRANSACTION_RESULT = RUN_TRANSACTION_RESULT.
      IF RUN_TRANSACTION_RESULT-RESULT_CODE = 'E'.
        MESSAGE RUN_TRANSACTION_RESULT-ERROR TYPE 'I'.
      ELSE.
        clear msg.
        CONCATENATE 'Transaction has been voided with RefNum:'  CWA_MATRIX-REF_NUM into msg SEPARATED BY space.

        MESSAGE msg TYPE 'I'.
      ENDIF.
    ENDIF.
  ENDIF.

ENDMODULE.
