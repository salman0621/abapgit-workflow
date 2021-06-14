*----------------------------------------------------------------------*
***INCLUDE MZCUSTOM_SCREEN_STATUS_4014O01.
*----------------------------------------------------------------------*

*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  STATUS_4010  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE STATUS_4017 OUTPUT.
  IF SY-UCOMM = 'CARD_FC2'.
    CLEAR:  EXDATE.
    4017_TRANSENTERY = 0.
    4017_CURRENCY = ''.
    4017_ACTIVE = ''.
    4017_DEFAULT_CARD = ''.
    4017_CARDNUMBER = ''.
    4017_EXPDATE = ''.
    4017_CARDCODE = ''.
    4017_ACCTHOLD = ''.
    4017_ADDRESS = ''.
    4017_CITY = ''.
    4017_STATE = ''.
    4017_ZIP = ''.
    4017_EMAIL = ''.
    4017_METHOD_NAME = ''.
    4017_CARD_NAME = ''.

* Implement suitable error handling here
    CLEAR: GS_VALUES, GT_VALUES[].
    TRY.

        CUSTOMERID = KNA1-KUNNR.
        CALL FUNCTION 'ZEBIZ_PAYMENTMETHODS'
          EXPORTING
            CUSTOMER_ID       = CUSTOMERID
          IMPORTING
            PAYMENT_METHOD_PR = WA_GET.
        LOOP AT WA_GET INTO WA_GET_CUD.
          IF WA_GET_CUD-CARD_NUMBER <> ''.
            GS_VALUES-TEXT = WA_GET_CUD-CARD_NUMBER.
            GS_VALUES-KEY = WA_GET_CUD-METHOD_ID.
            APPEND GS_VALUES TO GT_VALUES.
            TRY.

                GET_CUSTOMER_PAYMENT_METHOD_PR = WA_GET_CUD.

                IF GET_CUSTOMER_PAYMENT_METHOD_PR-SECONDARY_SORT = '0'.
                   CONCATENATE GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_EXPIRATION+5(2) GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_EXPIRATION+2(2)
            into EXDATE.

                  4017_PAYMENT_METHOD = GET_CUSTOMER_PAYMENT_METHOD_PR-METHOD_ID.
                  4017_CARDNUMBER = GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_NUMBER.
                  4017_CARDCODE = GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_CODE.
                  4017_ACCTHOLD = GET_CUSTOMER_PAYMENT_METHOD_PR-ACCOUNT_HOLDER_NAME.
                  4017_ADDRESS = GET_CUSTOMER_PAYMENT_METHOD_PR-AVS_STREET.
                  4017_ZIP = GET_CUSTOMER_PAYMENT_METHOD_PR-AVS_ZIP.
                  4017_METHOD_NAME = GET_CUSTOMER_PAYMENT_METHOD_PR-METHOD_NAME.
                  4017_EXPDATE = EXDATE.
                  IF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE = 'V'.
                    4017_CARD_NAME = 'VISA'.
                  ELSEIF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE = 'M'.
                    4017_CARD_NAME = 'Ma'.
                  ELSEIF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE = 'A'.
                    4017_CARD_NAME = 'Am'.
                  ELSEIF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE = 'DS'.
                    4017_CARD_NAME = 'Disc'.
                  ELSEIF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE = ''.
                    4017_CARD_NAME = 'eCheck'.
                  ELSE.
                    4017_CARD_NAME = GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE.

                  ENDIF.
                ENDIF.
              CATCH CX_AI_SYSTEM_FAULT INTO EXC.
                MSG = EXC->GET_TEXT( ).
                WRITE:/  MSG.
*CATCH zcx_zsqrt_exception.
              CATCH CX_AI_APPLICATION_FAULT INTO EXC.
                MSG = EXC->GET_TEXT( ).
                WRITE:/  MSG.
            ENDTRY.

          ENDIF.
        ENDLOOP.
      CATCH CX_AI_SYSTEM_FAULT INTO EXC.
        MSG = EXC->GET_TEXT( ).
        WRITE:/  MSG.
*CATCH zcx_zsqrt_exception.
      CATCH CX_AI_APPLICATION_FAULT INTO EXC.
        MSG = EXC->GET_TEXT( ).
        WRITE:/  MSG.
    ENDTRY.


    GT_ID = '4017_PAYMENT_METHOD'.

    CALL FUNCTION 'VRM_SET_VALUES'
      EXPORTING
        ID     = GT_ID
        VALUES = GT_VALUES.
*  EXCEPTIONS
*    ID_ILLEGAL_NAME       = 1
*    OTHERS                = 2
    .
  ELSE.

    LOOP AT SCREEN.
      CASE SCREEN-NAME.
        WHEN '4017_CARDNUMBER'.
          IF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_NUMBER <> ''.
            SCREEN-INPUT = '0'. "Input Disabled for VBELN
            MODIFY SCREEN.
          ENDIF.
        WHEN '4017_CARD_NAME'.
          SCREEN-INPUT = '0'. "Input Disabled for POSNR
          MODIFY SCREEN.
      ENDCASE.
    ENDLOOP.

  ENDIF.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  GETDATA_4010  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*

MODULE GETDATA_4017 OUTPUT.
  IF SY-UCOMM = 'CARD_FC2'.
    SELECT SINGLE * FROM ZEBIZ_CUSTOMER INTO CWA
      WHERE CUSTOMERID = KNA1-KUNNR AND DEFAULT_CARD = 'X' AND CARDNUMBER <> ''
*      AND PAYMENT_METHOD = 4017_PAYMENT_METHOD
    .
    IF SY-SUBRC IS INITIAL.
      IF CWA-TRANSENTERY <> ''.
        TRY.
            PAYMENT_METHOD_ID = CWA-PAYMENT_METHOD.
            CALL FUNCTION 'ZEBIZ_GETPAYMENTMETHOD'
              EXPORTING
                CUSTOMER_ID                    = CUSTOMERID
                PAYMENT_METHOD_ID              = PAYMENT_METHOD_ID
              IMPORTING
                GET_CUSTOMER_PAYMENT_METHOD_PR = GET_CUSTOMER_PAYMENT_METHOD_PR.

 CONCATENATE GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_EXPIRATION+5(2) GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_EXPIRATION+2(2)
            into EXDATE.

            4017_EXPDATE = EXDATE.
        4017_PAYMENT_METHOD = GET_CUSTOMER_PAYMENT_METHOD_PR-METHOD_ID.
            4017_CARDNUMBER = GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_NUMBER.
*
            4017_ACCTHOLD = GET_CUSTOMER_PAYMENT_METHOD_PR-ACCOUNT_HOLDER_NAME.
            4017_ADDRESS = GET_CUSTOMER_PAYMENT_METHOD_PR-AVS_STREET.
            4017_ZIP = GET_CUSTOMER_PAYMENT_METHOD_PR-AVS_ZIP.
            4017_METHOD_NAME = GET_CUSTOMER_PAYMENT_METHOD_PR-METHOD_NAME.
            IF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE = 'V'.
              4017_CARD_NAME = 'VISA'.
            ELSEIF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE = 'M'.
              4017_CARD_NAME = 'Ma'.
            ELSEIF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE = 'A'.
              4017_CARD_NAME = 'Am'.
            ELSEIF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE = 'DS'.
              4017_CARD_NAME = 'Disc'.
            ELSEIF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE = ''.
              4017_CARD_NAME = 'eCheck'.
            ELSE.
              4017_CARD_NAME = GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE.

            ENDIF.
            IF GET_CUSTOMER_PAYMENT_METHOD_PR-SECONDARY_SORT = '0'.
              4017_DEFAULT_CARD = 'X'.
            ELSE.
              4017_DEFAULT_CARD = ''.
            ENDIF.
          CATCH CX_AI_SYSTEM_FAULT INTO EXC.
            MSG = EXC->GET_TEXT( ).
            WRITE:/  MSG.
*CATCH zcx_zsqrt_exception.
          CATCH CX_AI_APPLICATION_FAULT INTO EXC.
            MSG = EXC->GET_TEXT( ).
            WRITE:/  MSG.
        ENDTRY.
        4017_TRANSENTERY = CWA-TRANSENTERY.
        4017_CUSTOMERID = CWA-CUSTOMERID.
        4017_ACTIVE = CWA-ACTIVE.

        4017_CITY = CWA-CITY.
        4017_STATE = CWA-STATE.
        4017_EMAIL = CWA-EMAIL.
        LOOP AT SCREEN.
          CASE SCREEN-NAME.
            WHEN '4017_CARDNUMBER'.
              IF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_NUMBER <> ''.
                SCREEN-INPUT = '0'. "Input Disabled for VBELN
                MODIFY SCREEN.
              ENDIF.
            WHEN '4017_CARD_NAME'.
              SCREEN-INPUT = '0'. "Input Disabled for POSNR
              MODIFY SCREEN.
          ENDCASE.
        ENDLOOP.
*

      ENDIF.

    ENDIF.
  ELSE.

    LOOP AT SCREEN.
      CASE SCREEN-NAME.
        WHEN '4017_CARDNUMBER'.
          IF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_NUMBER <> ''.
            SCREEN-INPUT = '0'. "Input Disabled for VBELN
            MODIFY SCREEN.
          ENDIF.
        WHEN '4017_CARD_NAME'.
          SCREEN-INPUT = '0'. "Input Disabled for POSNR
          MODIFY SCREEN.
      ENDCASE.
    ENDLOOP.
*
  ENDIF.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  SAVE_COMMAND_4014  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE SAVE_COMMAND_4017 INPUT.

  IF SY-UCOMM = 'FCT_SAVE1'.
    LV_DATE = SY-DATUM.
    LV_TIME = SY-UZEIT.
    CLEAR C_CORSE.
    CLEAR: IMX, TSTP.
*    CLEAR LINID.
    IMX = 0.
*    LINID = 0.

    TRY.
        CALL FUNCTION 'POPUP_TO_CONFIRM'
          EXPORTING
            TITLEBAR              = 'Save Payment Method'
            TEXT_QUESTION         = 'Do you want to save payment method ?'
            TEXT_BUTTON_1         = 'Yes'
            ICON_BUTTON_1         = 'ICON_CHECKED'
            TEXT_BUTTON_2         = 'No'
            ICON_BUTTON_2         = 'ICON_CANCEL'
            DISPLAY_CANCEL_BUTTON = ' '
            POPUP_TYPE            = 'ICON_MESSAGE_ERROR'
          IMPORTING
            ANSWER                = ANS.
        IF ANS = '2'.
          RETURN.
        ENDIF.

        CUSTOMERID = KNA1-KUNNR.
        CALL FUNCTION 'ZEBIZ_CHECKCUSTOMER'
          EXPORTING
            CUSTOMER_ID         = CUSTOMERID
          IMPORTING
            FOUND               = FOUND
            GET_CUSTOMER_RESULT = CUSTOMER.
        SELECT SINGLE *  FROM ADR6 INTO  CWA_AD6
  WHERE ADDRNUMBER = KNA1-ADRNR.
        IF FOUND = 'N'.

          CUSTOMER-CUSTOMER_ID = KNA1-KUNNR.
          CUSTOMER-FIRST_NAME = KNA1-NAME1.
          CUSTOMER-LAST_NAME = KNA1-NAME2.
          CUSTOMER-PHONE = KNA1-TELF2.
          CUSTOMER-CELL_PHONE = KNA1-TELF1.
          CUSTOMER-FAX = KNA1-TELFX.
          CUSTOMER-EMAIL = CWA_AD6-SMTP_ADDR.
          "/// Billing Adrress Information
          BILL_CUSTOMER-FIRST_NAME = KNA1-NAME1.
          BILL_CUSTOMER-LAST_NAME = KNA1-NAME2.
          BILL_CUSTOMER-ADDRESS1 = KNA1-STRAS.
          BILL_CUSTOMER-CITY = KNA1-ORT01.
          BILL_CUSTOMER-STATE = KNA1-REGIO.
          BILL_CUSTOMER-ZIP_CODE = KNA1-PSTLZ.
          BILL_CUSTOMER-COUNTRY = KNA1-LAND1.
          "///"
          CUSTOMER-BILLING_ADDRESS = BILL_CUSTOMER.
          CUSTOMER-SHIPPING_ADDRESS = BILL_CUSTOMER.
          CALL FUNCTION 'ZEBIZ_ADDCUSTOMER'
            EXPORTING
              CUSTOMER          = CUSTOMER
            IMPORTING
              SUCCESSS          = SUCCESS
              CUSTOMER_RESPONSE = CUSTOMER_RESPONSE.
          IF CUSTOMER_RESPONSE-STATUS_CODE <> '1'.
            MESSAGE CUSTOMER_RESPONSE-ERROR TYPE 'E'.
          ELSEIF CUSTOMER_RESPONSE-STATUS_CODE = '1'.

          ENDIF.
        ELSE.
          CUSTOMER-CUSTOMER_ID = KNA1-KUNNR.
          CUSTOMER-FIRST_NAME = KNA1-NAME1.
          CUSTOMER-LAST_NAME = KNA1-NAME2.
          CUSTOMER-PHONE = KNA1-TELF2.
          CUSTOMER-CELL_PHONE = KNA1-TELF1.
          CUSTOMER-FAX = KNA1-TELFX.
          CUSTOMER-EMAIL = CWA_AD6-SMTP_ADDR.
          "/// Billing Adrress Information
          BILL_CUSTOMER-FIRST_NAME = KNA1-NAME1.
          BILL_CUSTOMER-LAST_NAME = KNA1-NAME2.
          BILL_CUSTOMER-ADDRESS1 = KNA1-STRAS.
          BILL_CUSTOMER-CITY = KNA1-ORT01.
          BILL_CUSTOMER-STATE = KNA1-REGIO.
          BILL_CUSTOMER-ZIP_CODE = KNA1-PSTLZ.
          BILL_CUSTOMER-COUNTRY = KNA1-LAND1.
          "///"
          CUSTOMER-BILLING_ADDRESS = BILL_CUSTOMER.
          CUSTOMER-SHIPPING_ADDRESS = BILL_CUSTOMER.
          CALL FUNCTION 'ZEBIZ_UPDATECUSTOMER'
            EXPORTING
              CUSTOMER             = CUSTOMER
              CUSTOMER_ID          = CUSTOMER-CUSTOMER_ID
              CUSTOMER_INTERNAL_ID = CUSTOMER-CUSTOMER_INTERNAL_ID
            IMPORTING
              SUCCESSS             = SUCCESS
              CUSTOMER_RESPONSE    = CUSTOMER_RESPONSE.
          IF CUSTOMER_RESPONSE-STATUS_CODE <> '1'.
            MESSAGE CUSTOMER_RESPONSE-ERROR TYPE 'E'.
          ENDIF.

        ENDIF.
      CATCH CX_AI_SYSTEM_FAULT INTO EXC.
        MSG = EXC->GET_TEXT( ).
        MESSAGE  W398(00) WITH MSG.
*CATCH zcx_zsqrt_exception.
      CATCH CX_AI_APPLICATION_FAULT INTO EXC.
        MSG = EXC->GET_TEXT( ).
        MESSAGE  W398(00) WITH MSG.
    ENDTRY.
*    READ TABLE CT INTO CWA INDEX EBIZ_TABLE-CURRENT_LINE.
*    SELECT SINGLE CUSTOMERID  FROM ZEBIZ_CUSTOMER INTO  C_CORSE
*       WHERE CUSTOMERID = KNA1-KUNNR
*      .
    IF 4017_TRANSENTERY > 0.
*        CONCATENATE  4017_EXPDATE+0(4) '-' 4017_EXPDATE+4(2) INTO EDATE.
        CONVERT DATE LV_DATE TIME LV_TIME INTO TIME STAMP TSTP TIME ZONE GDATE .
        IF 4017_CARDNUMBER <> ''.
          CUSTOMERPRM-METHOD_TYPE = 'cc'.
          CUSTOMERPRM-CARD_NUMBER = 4017_CARDNUMBER.
          CUSTOMERPRM-CARD_EXPIRATION = 4017_EXPDATE.
         ENDIF.
        CUSTOMERPRM-METHOD_ID = 4017_PAYMENT_METHOD.
        CUSTOMERPRM-METHOD_NAME = 4017_METHOD_NAME.
        CUSTOMERPRM-AVS_STREET = 4017_ADDRESS.
        CUSTOMERPRM-AVS_ZIP = 4017_ZIP.

        CUSTOMERPRM-ACCOUNT_HOLDER_NAME = 4017_ACCTHOLD.
        CUSTOMERPRM-CARD_CODE = 4017_CARDCODE.
        CUSTOMERPRM-CREATED = TSTP.
        CUSTOMERPRM-MODIFIED = TSTP.
        CUSTOMERPRM-BALANCE = 0.
        CUSTOMERPRM-MAX_BALANCE = 0.

        CALL FUNCTION 'ZEBIZ_UPDATECUSTOMERPAYMETHOD'
          EXPORTING
            CUSTOMERPRM                    = CUSTOMERPRM
            CUSTOMER_ID                    = CUSTOMERID
          IMPORTING
            SUCCESSS                       = SUCCESS
            UPDATE_CUSTOMER_PAYMENT_METHOD = UPDATE_CUSTOMER_PAYMENT_METHOD.
        IF SUCCESS = 'Y'.
          MSG = UPDATE_CUSTOMER_PAYMENT_METHOD.
          MESSAGE  W398(00) WITH MSG.
        ELSEIF SUCCESS = 'X'.

          PAYMENT_METHOD_ID = 4017_PAYMENT_METHOD.
          CALL FUNCTION 'ZEBIZ_GETPAYMENTMETHOD'
            EXPORTING
              CUSTOMER_ID                    = CUSTOMERID
              PAYMENT_METHOD_ID              = PAYMENT_METHOD_ID
            IMPORTING
              GET_CUSTOMER_PAYMENT_METHOD_PR = GET_CUSTOMER_PAYMENT_METHOD_PR.
          IF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE = 'V'.
            4017_CARD_NAME = 'VISA'.
          ELSEIF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE = 'M'.
            4017_CARD_NAME = 'Ma'.
          ELSEIF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE = 'A'.
            4017_CARD_NAME = 'Am'.
          ELSEIF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE = 'DS'.
            4017_CARD_NAME = 'Disc'.
          ELSEIF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE = ''.
            4017_CARD_NAME = 'eCheck'.
          ELSE.
            4017_CARD_NAME = GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE.

          ENDIF.
          IF 4017_DEFAULT_CARD = 'X'.
            CALL FUNCTION 'ZEBIZ_SETPAYMENTMETHOD_DEFAULT'
              EXPORTING
                CUSTOMER_ID                    = CUSTOMERID
                PAYMENT_METHOD_ID              = 4017_PAYMENT_METHOD
              IMPORTING
                SET_DEFAULT_CUSTOMER_PAYMENT_M = SET_DEFAULT_CUSTOMER_PAYMENT_M.

          ENDIF.
        ENDIF.


      CWA-TRANSENTERY = 4017_TRANSENTERY.
      CWA-CUSTOMERID = 4017_CUSTOMERID.
      CWA-ACTIVE = 4017_ACTIVE.
      CWA-DEFAULT_CARD = 4017_DEFAULT_CARD.
      CWA-PAYMENT_METHOD = 4017_PAYMENT_METHOD.
      CWA-CARDNUMBER = 4017_CARDNUMBER.
      CWA-EXPDATE = 4017_EXPDATE.
      CWA-CARDCODE = 4017_CARDCODE.
      CWA-ACCTHOLD = 4017_ACCTHOLD.
     CWA-ADDRESS = 4017_ADDRESS.
      CWA-CITY = 4017_CITY.
      CWA-STATE = 4017_STATE.
      CWA-ZIP = 4017_ZIP.
      CWA-EMAIL = 4017_EMAIL.
      CWA-METHOD_NAME = 4017_METHOD_NAME.
      CWA-CARD_NAME = 4017_CARD_NAME.

      MODIFY ZEBIZ_CUSTOMER FROM CWA.
      MESSAGE 'Customer Ebiz Data Save' TYPE 'S'.
    ELSE.
      IF 4017_PAYMENT_METHOD <> '-2'.
*        CONCATENATE  4017_EXPDATE+0(4) '-' 4017_EXPDATE+4(2) INTO EDATE.
        CONVERT DATE LV_DATE TIME LV_TIME INTO TIME STAMP TSTP TIME ZONE GDATE .
        IF 4017_CARDNUMBER <> ''.
          CUSTOMERPRM-METHOD_TYPE = 'cc'.
          CUSTOMERPRM-CARD_NUMBER = 4017_CARDNUMBER.
          CUSTOMERPRM-CARD_EXPIRATION = 4017_EXPDATE.
       ENDIF.

        CUSTOMERPRM-METHOD_ID = 4017_PAYMENT_METHOD.
        CUSTOMERPRM-METHOD_NAME = 4017_METHOD_NAME.
        CUSTOMERPRM-AVS_STREET = 4017_ADDRESS.
        CUSTOMERPRM-AVS_ZIP = 4017_ZIP.
        CUSTOMERPRM-ACCOUNT_HOLDER_NAME = 4017_ACCTHOLD.
        CUSTOMERPRM-CARD_CODE = 4017_CARDCODE.
        CUSTOMERPRM-CREATED = TSTP.
        CUSTOMERPRM-MODIFIED = TSTP.
        CUSTOMERPRM-BALANCE = 0.
        CUSTOMERPRM-MAX_BALANCE = 0.

        CALL FUNCTION 'ZEBIZ_UPDATECUSTOMERPAYMETHOD'
          EXPORTING
            CUSTOMERPRM                    = CUSTOMERPRM
            CUSTOMER_ID                    = CUSTOMERID
          IMPORTING
            SUCCESSS                       = SUCCESS
            UPDATE_CUSTOMER_PAYMENT_METHOD = UPDATE_CUSTOMER_PAYMENT_METHOD.
        IF SUCCESS = 'Y'.
          MSG = UPDATE_CUSTOMER_PAYMENT_METHOD.
          MESSAGE  W398(00) WITH MSG.
        ELSEIF SUCCESS = 'X'.

          PAYMENT_METHOD_ID = 4017_PAYMENT_METHOD.
          CALL FUNCTION 'ZEBIZ_GETPAYMENTMETHOD'
            EXPORTING
              CUSTOMER_ID                    = CUSTOMERID
              PAYMENT_METHOD_ID              = PAYMENT_METHOD_ID
            IMPORTING
              GET_CUSTOMER_PAYMENT_METHOD_PR = GET_CUSTOMER_PAYMENT_METHOD_PR.
          IF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE = 'V'.
            4017_CARD_NAME = 'VISA'.
          ELSEIF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE = 'M'.
            4017_CARD_NAME = 'Ma'.
          ELSEIF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE = 'A'.
            4017_CARD_NAME = 'Am'.
          ELSEIF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE = 'DS'.
            4017_CARD_NAME = 'Disc'.
          ELSEIF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE = ''.
            4017_CARD_NAME = 'eCheck'.
          ELSE.
            4017_CARD_NAME = GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE.

          ENDIF.
          IF 4017_DEFAULT_CARD = 'X'.
            CALL FUNCTION 'ZEBIZ_SETPAYMENTMETHOD_DEFAULT'
              EXPORTING
                CUSTOMER_ID                    = CUSTOMERID
                PAYMENT_METHOD_ID              = 4017_PAYMENT_METHOD
              IMPORTING
                SET_DEFAULT_CUSTOMER_PAYMENT_M = SET_DEFAULT_CUSTOMER_PAYMENT_M.

          ENDIF.
        ENDIF.
      ENDIF.



        CALL FUNCTION 'NUMBER_GET_NEXT'
EXPORTING
   nr_range_nr = '01'
   object = 'ZTRANS'
IMPORTING
  NUMBER = IMX
EXCEPTIONS
  INTERVAL_NOT_FOUND = 1
  NUMBER_RANGE_NOT_INTERN = 2
  OBJECT_NOT_FOUND = 3
  QUANTITY_IS_0 = 4
  QUANTITY_IS_NOT_1 = 5
  INTERVAL_OVERFLOW = 6
  BUFFER_OVERFLOW = 7
  OTHERS = 8
.
      CWA-TRANSENTERY = IMX.
      CWA-CUSTOMERID = KNA1-KUNNR.
      CWA-ACTIVE = 4017_ACTIVE.
      CWA-DEFAULT_CARD = 4017_DEFAULT_CARD.
      CWA-PAYMENT_METHOD = 4017_PAYMENT_METHOD.
      CWA-CARDNUMBER = 4017_CARDNUMBER.
      CWA-EXPDATE = 4017_EXPDATE.
      CWA-CARDCODE = 4017_CARDCODE.
      CWA-ACCTHOLD = 4017_ACCTHOLD.
      CWA-ADDRESS = 4017_ADDRESS.
      CWA-CITY = 4017_CITY.
      CWA-STATE = 4017_STATE.
      CWA-ZIP = 4017_ZIP.
      CWA-EMAIL = 4017_EMAIL.
      CWA-METHOD_NAME = 4017_METHOD_NAME.
      CWA-CARD_NAME = 4017_CARD_NAME.

      INSERT INTO ZEBIZ_CUSTOMER VALUES CWA.
      MESSAGE 'Customer Ebiz Data Save' TYPE 'S'.
    ENDIF.
  ENDIF.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  REFRESH_COMMAND_4010  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE REFRESH_COMMAND_4017 INPUT.
  IF SY-UCOMM = 'FCT_REF'.
    CLEAR: GS_VALUES, GT_VALUES[], VAL.

    TRY.
        CALL FUNCTION 'ZEBIZ_PAYMENTMETHODS'
          EXPORTING
            CUSTOMER_ID       = CUSTOMERID
          IMPORTING
            PAYMENT_METHOD_PR = WA_GET.
*        GS_VALUES-TEXT = 'New Card'.
*        GS_VALUES-KEY = '-1'.
*        APPEND GS_VALUES TO GT_VALUES.
*        GS_VALUES-TEXT = 'New eCheck'.
*        GS_VALUES-KEY = '-2'.
*        APPEND GS_VALUES TO GT_VALUES.
        LOOP AT WA_GET INTO WA_GET_CUD.
          IF WA_GET_CUD-CARD_NUMBER <> ''.
            GS_VALUES-TEXT = WA_GET_CUD-CARD_NUMBER.
            GS_VALUES-KEY = WA_GET_CUD-METHOD_ID.
            APPEND GS_VALUES TO GT_VALUES.
          ENDIF.
        ENDLOOP.
      CATCH CX_AI_SYSTEM_FAULT INTO EXC.
        MSG = EXC->GET_TEXT( ).
        WRITE:/  MSG.
*CATCH zcx_zsqrt_exception.
      CATCH CX_AI_APPLICATION_FAULT INTO EXC.
        MSG = EXC->GET_TEXT( ).
        WRITE:/  MSG.
    ENDTRY.


    GT_ID = '4017_PAYMENT_METHOD'.

    CALL FUNCTION 'VRM_SET_VALUES'
      EXPORTING
        ID     = GT_ID
        VALUES = GT_VALUES.
*  EXCEPTIONS
*    ID_ILLEGAL_NAME       = 1
*    OTHERS                = 2
    .
    IF SY-SUBRC <> 0.
* Implement suitable error handling here
    ENDIF.
    CLEAR: GS_VALUES, GT_VALUES[].

      LOOP AT SCREEN.
        CASE SCREEN-NAME.
          WHEN '4017_CARDNUMBER'.
            SCREEN-INPUT = '0'. "Input Disabled for VBELN
            MODIFY SCREEN.
          WHEN '4017_CARD_NAME'.
            SCREEN-INPUT = '0'. "Input Disabled for POSNR
            MODIFY SCREEN.

        ENDCASE.
      ENDLOOP.
*
  ENDIF.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  DELETE_COMMAND_4010  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE DELETE_COMMAND_4017 INPUT.
  IF SY-UCOMM = 'FCT_DEL'.
    TRY.
        CALL FUNCTION 'POPUP_TO_CONFIRM'
          EXPORTING
            TITLEBAR              = 'Delete Payment Method'
            TEXT_QUESTION         = 'Do you want to delete payment method ?'
            TEXT_BUTTON_1         = 'Yes'
            ICON_BUTTON_1         = 'ICON_CHECKED'
            TEXT_BUTTON_2         = 'No'
            ICON_BUTTON_2         = 'ICON_CANCEL'
            DISPLAY_CANCEL_BUTTON = ' '
            POPUP_TYPE            = 'ICON_MESSAGE_ERROR'
          IMPORTING
            ANSWER                = ANS.
        IF ANS = '2'.
          RETURN.
        ENDIF.
        PAYMENT_METHOD_ID = 4017_PAYMENT_METHOD.
        CUSTOMERID = KNA1-KUNNR.
        CALL FUNCTION 'ZEBIZ_DELETEPAYMENTMETHOD'
          EXPORTING
            CUSTOMER_ID                    = CUSTOMERID
            PAYMENT_METHOD_ID              = PAYMENT_METHOD_ID
          IMPORTING
            DELETE_CUSTOMER_PAYMENT_METHOD = DELETE_CUSTOMER_PAYMENT_METHOD.
        IF DELETE_CUSTOMER_PAYMENT_METHOD = 'X'.
          CWA-TRANSENTERY = 4017_TRANSENTERY.
          DELETE ZEBIZ_CUSTOMER FROM CWA.
          MESSAGE 'Customer Payment Method Deleted' TYPE 'S'.
        ENDIF.
      CATCH CX_AI_SYSTEM_FAULT INTO EXC.
        MSG = EXC->GET_TEXT( ).
        MESSAGE  W398(00) WITH MSG.
*CATCH zcx_zsqrt_exception.
      CATCH CX_AI_APPLICATION_FAULT INTO EXC.
        MSG = EXC->GET_TEXT( ).
        MESSAGE  W398(00) WITH MSG.
    ENDTRY.

  ENDIF.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  PAYMETHOD_COMMAND_4014  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*

MODULE PAYMETHOD_COMMAND_4017 INPUT.
  IF SY-UCOMM = 'FCT_PAY2'.
    VAL = 4017_PAYMENT_METHOD.
          4017_TRANSENTERY = 0.
      4017_CURRENCY = ''.
      4017_ACTIVE = ''.
      4017_DEFAULT_CARD = ''.
      4017_CARDNUMBER = ''.
      4017_EXPDATE = ''.
      4017_CARDCODE = ''.
      4017_ACCTHOLD = ''.
      4017_ADDRESS = ''.
      4017_CITY = ''.
      4017_STATE = ''.
      4017_ZIP = ''.
      4017_EMAIL = ''.
      4017_METHOD_NAME = ''.
      4017_CARD_NAME = ''.
    IF VAL = '-1' OR VAL = '-2'.

    ELSE.
*      CLEAR: CWA, GET_CUSTOMER_PAYMENT_METHOD_PR,ZEBIZ_CUSTOMER.
      SELECT SINGLE * FROM ZEBIZ_CUSTOMER INTO CWA
WHERE CUSTOMERID = KNA1-KUNNR AND PAYMENT_METHOD = VAL.
      .
        TRY.
            PAYMENT_METHOD_ID = VAL.
            CALL FUNCTION 'ZEBIZ_GETPAYMENTMETHOD'
              EXPORTING
                CUSTOMER_ID                    = CUSTOMERID
                PAYMENT_METHOD_ID              = PAYMENT_METHOD_ID
              IMPORTING
                GET_CUSTOMER_PAYMENT_METHOD_PR = GET_CUSTOMER_PAYMENT_METHOD_PR.

            CONCATENATE GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_EXPIRATION+5(2) GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_EXPIRATION+2(2)
            into EXDATE.
            4017_EXPDATE = EXDATE.
            4017_PAYMENT_METHOD = GET_CUSTOMER_PAYMENT_METHOD_PR-METHOD_ID.
            4017_CARDNUMBER = GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_NUMBER.
*              4017_CARDCODE = GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_CODE.
            4017_ACCTHOLD = GET_CUSTOMER_PAYMENT_METHOD_PR-ACCOUNT_HOLDER_NAME.
            4017_ADDRESS = GET_CUSTOMER_PAYMENT_METHOD_PR-AVS_STREET.
            4017_ZIP = GET_CUSTOMER_PAYMENT_METHOD_PR-AVS_ZIP.
            4017_METHOD_NAME = GET_CUSTOMER_PAYMENT_METHOD_PR-METHOD_NAME.
            IF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE = 'V'.
              4017_CARD_NAME = 'VISA'.
            ELSEIF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE = 'M'.
              4017_CARD_NAME = 'Ma'.
            ELSEIF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE = 'A'.
              4017_CARD_NAME = 'Am'.
            ELSEIF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE = 'DS'.
              4017_CARD_NAME = 'Disc'.
            ELSEIF GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE = ''.
              4017_CARD_NAME = 'eCheck'.
            ELSE.
              4017_CARD_NAME = GET_CUSTOMER_PAYMENT_METHOD_PR-CARD_TYPE.

            ENDIF.
            IF GET_CUSTOMER_PAYMENT_METHOD_PR-SECONDARY_SORT = '0'.
              4017_DEFAULT_CARD = 'X'.
            ELSE.
              4017_DEFAULT_CARD = ''.
            ENDIF.
          CATCH CX_AI_SYSTEM_FAULT INTO EXC.
            MSG = EXC->GET_TEXT( ).
            WRITE:/  MSG.
*CATCH zcx_zsqrt_exception.
          CATCH CX_AI_APPLICATION_FAULT INTO EXC.
            MSG = EXC->GET_TEXT( ).
            WRITE:/  MSG.
        ENDTRY.

        IF CWA-TRANSENTERY <> ''.
          4017_TRANSENTERY = CWA-TRANSENTERY.
          4017_CUSTOMERID = CWA-CUSTOMERID.
          4017_CURRENCY = CWA-CURRENCY.
          4017_ACTIVE = CWA-ACTIVE.


          4017_CITY = CWA-CITY.
          4017_STATE = CWA-STATE.
          4017_EMAIL = CWA-EMAIL.
**          MODIFY ZEBIZ_CUSTOMER FROM CWA.
        ENDIF.

      CLEAR: CWA, GET_CUSTOMER_PAYMENT_METHOD_PR.
    ENDIF.

    LOOP AT SCREEN.
      CASE SCREEN-NAME.
        WHEN '4017_CARDNUMBER'.
          SCREEN-INPUT = '0'. "Input Disabled for VBELN
          MODIFY SCREEN.
        WHEN '4017_CARD_NAME'.
          SCREEN-INPUT = '0'. "Input Disabled for POSNR
          MODIFY SCREEN.
      ENDCASE.
    ENDLOOP.

  ENDIF.
ENDMODULE.
