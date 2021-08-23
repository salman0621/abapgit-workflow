FUNCTION ZCHECKAVSCODE.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(CODE) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(RESULT) TYPE  /ASU/ADHOC_STEP
*"----------------------------------------------------------------------

if code = 'YYY' or code = 'Y' or code = 'YYD' or code = 'YYA' or code = 'YYX'
   or code = 'X'.
  RESULT = 'X'.
  else.
    RESULT = ''.
endif.



ENDFUNCTION.
