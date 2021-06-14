FUNCTION ZEBIZ_LOGFILE.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(LOGTEXT) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(STATUS) TYPE  XSDBOOLEAN
*"----------------------------------------------------------------------
  DATA: LV_FILENAME TYPE STRING VALUE 'EBIZERRORLOGFILE.txt',
        LV_FILE     TYPE STRING,
        L_STRING    TYPE STRING,
        DATESTRING  TYPE STRING.
  DATA: DATE(20) TYPE C,
        TIME(10) TYPE C,
        STR      TYPE STRING.

  DATA: XT247 TYPE T247.

  SELECT SINGLE * INTO XT247 FROM T247
            WHERE MNR = SY-DATUM+4(2).

  CONCATENATE  SY-DATUM+6(2) XT247-KTX SY-DATUM(4)
            INTO DATE SEPARATED BY '.'.

  WRITE SY-UZEIT TO TIME.

  CONCATENATE DATE ' :: ' TIME INTO STR SEPARATED BY SPACE.
*           open dataset lv_filename for output in text mode encoding default.
  OPEN DATASET LV_FILENAME FOR APPENDING IN TEXT MODE ENCODING DEFAULT.
  CLEAR LV_FILE.
  LV_FILE = '-----------------------------------------------------------------------------'.
  TRANSFER LV_FILE TO LV_FILENAME.
 CLEAR LV_FILE.
  LV_FILE = '-----------------------------------------------------------------------------'.
  TRANSFER LV_FILE TO LV_FILENAME.
  CLEAR LV_FILE.
  LV_FILE = 'Error Log'.
  TRANSFER LV_FILE TO LV_FILENAME.
  CLEAR LV_FILE.
  LV_FILE = STR.
  TRANSFER LV_FILE TO LV_FILENAME.
  CLEAR LV_FILE.
  LV_FILE = ''.
  TRANSFER LV_FILE TO LV_FILENAME.
  CLEAR LV_FILE.
  LV_FILE = LOGTEXT.
  TRANSFER LV_FILE TO LV_FILENAME.
  CLEAR LV_FILE.

  CLOSE DATASET LV_FILENAME.




ENDFUNCTION.
