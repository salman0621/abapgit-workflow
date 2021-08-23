FUNCTION ZCHECKCVVCODE.
*"--------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(CODE) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(RESULT) TYPE  /ASU/ADHOC_STEP
*"--------------------------------------------------------------------
RESULT = 'X'.
if code = 'N' or code = 'P' or code = 'S' or code = 'U' or code = 'x' or code = ''.
  RESULT = ''.
  elseif code = 'M'.
    RESULT = 'X'.
endif.



ENDFUNCTION.
