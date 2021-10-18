FUNCTION ZHANDLERESPONSE_CUSTOMER.
*"--------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(RUN_CUSTOMER_TRANSACTION_RESUL) TYPE
*"                             ZEBIZ_CHARGETRANSACTION_RESPON
*"  EXPORTING
*"     REFERENCE(RESULT) TYPE  /ASU/ADHOC_STEP
*"--------------------------------------------------------------------
  DATA: EXC TYPE REF TO CX_ROOT.
  DATA: MSG TYPE STRING.
  DATA: MSG1 TYPE STRING,
        MSG2 TYPE STRING,
        MSG3 TYPE STRING,
        MSG4 TYPE STRING,
        MSG5 TYPE STRING,
        MSG6 TYPE STRING.
  DATA: TRAN                   TYPE ZEBIZ_CHARGETRANSACTION_REQUES,
        RUN_TRANSACTION_RESULT TYPE ZEBIZ_CHARGETRANSACTION_RESPON.
  DATA ERR TYPE STRING.
  DATA: RES    TYPE  /ASU/ADHOC_STEP,
        ANS    TYPE C,
        BERROR TYPE /ASU/ADHOC_STEP.
  DATA: CWA        TYPE ZEBIZ_CONFIG
        .
  DATA: BEGIN OF ITAB OCCURS 0,
          NAME(200) TYPE C,
        END OF ITAB.
  DATA GET_MERCHANT_TRANSACTION_DATA TYPE   ZEBIZ_CHARGEMERCHANT_TRANSACTI.
  TRY.
      SELECT SINGLE * FROM ZEBIZ_CONFIG INTO CWA
       .
      ERR = RUN_CUSTOMER_TRANSACTION_RESUL-ERROR.
      TRANSLATE ERR TO LOWER CASE.
      CALL FUNCTION 'ZEBIZ_GETMERCHANTTRANSACTIONDA'
        IMPORTING
          GET_MERCHANT_TRANSACTION_DATA = GET_MERCHANT_TRANSACTION_DATA.

      IF RUN_CUSTOMER_TRANSACTION_RESUL-RESULT_CODE = 'A' .
        MSG1 = 'Security Mismatch'.

        " ENABLE AVS WARNINGS
        IF GET_MERCHANT_TRANSACTION_DATA-ENABLE_AVSWARNINGS = 'X'.
          CALL FUNCTION 'ZCHECKAVSCODE'
            EXPORTING
              CODE   = RUN_CUSTOMER_TRANSACTION_RESUL-AVS_RESULT_CODE
            IMPORTING
              RESULT = RES.
          IF RES <> 'X'.
            BERROR = 'X'.
            CALL FUNCTION 'ZGETAVSDESCRIPTION'
              EXPORTING
                CODE           = RUN_CUSTOMER_TRANSACTION_RESUL-AVS_RESULT_CODE
              IMPORTING
                STRDESCRIPTION = MSG2.

          ENDIF.
        ENDIF.

        " ENABLE CVV WARNINGS
        IF GET_MERCHANT_TRANSACTION_DATA-ENABLE_CVVWARNINGS = 'X'.
          CALL FUNCTION 'ZCHECKCVVCODE'
            EXPORTING
              CODE   = RUN_CUSTOMER_TRANSACTION_RESUL-CARD_CODE_RESULT_CODE
            IMPORTING
              RESULT = RES.
          IF RES <> 'X'.
            BERROR = 'X'.
            CONCATENATE 'CVV:' RUN_CUSTOMER_TRANSACTION_RESUL-CARD_CODE_RESULT INTO MSG3
             SEPARATED BY SPACE.

          ELSE.
            CONCATENATE 'CVV:' RUN_CUSTOMER_TRANSACTION_RESUL-CARD_CODE_RESULT INTO MSG3
        SEPARATED BY SPACE.

          ENDIF.
        ENDIF.

        IF BERROR = 'X'.
          MSG4 = 'Your transaction was processed, but our card '.
          MSG5 = 'verification indicates this could result in a chargeback.'.
          MSG6 = 'Do you still wish to process the payment?'.

          CALL FUNCTION 'POPUP_WITH_2_BUTTONS_TO_CHOOSE'
            EXPORTING
*             DEFAULTOPTION = '1'
              DIAGNOSETEXT1 = MSG1
              DIAGNOSETEXT2 = MSG2
              DIAGNOSETEXT3 = MSG3
              TEXTLINE1     = MSG4
              TEXTLINE2     = MSG5
              TEXTLINE3     = MSG6
              TEXT_OPTION1  = 'Yes, Process'
              TEXT_OPTION2  = 'Cancel'
              TITEL         = 'Information'
            IMPORTING
              ANSWER        = ANS.
          IF ANS = '1'.
            RESULT = 'X'.
            RETURN.
          ELSEIF ANS = '2'.
            RESULT = ''.
            RETURN.
          ENDIF.       .
       else.
          RESULT = 'X'.
            RETURN.
        ENDIF.
      ELSEIF ERR EQ 'approved' .
        RESULT = 'X'.
        RETURN.
      ELSE.
 RESULT = ''.
            RETURN.
      ENDIF.

    CATCH CX_AI_SYSTEM_FAULT INTO EXC.
      MSG = EXC->GET_TEXT( ).
      CONCATENATE 'Error in HANDLERESPONSE :' MSG INTO MSG.
      CALL FUNCTION 'ZEBIZ_LOGFILE'
        EXPORTING
          LOGTEXT = MSG.
      .

      MESSAGE  MSG TYPE 'I'.
*CATCH zcx_zsqrt_exception.
    CATCH CX_AI_APPLICATION_FAULT INTO EXC.
      MSG = EXC->GET_TEXT( ).
      CONCATENATE 'Error in HANDLERESPONSE :' MSG INTO MSG.
      CALL FUNCTION 'ZEBIZ_LOGFILE'
        EXPORTING
          LOGTEXT = MSG.
      .

      MESSAGE  MSG TYPE 'I'.
*      MESSAGE msg TYPE 'E'.
  ENDTRY.


ENDFUNCTION.
