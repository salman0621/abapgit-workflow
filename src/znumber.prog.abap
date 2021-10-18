*&---------------------------------------------------------------------*
*& Report ZNUMBER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZNUMBER.
DATA: C_CORSE    TYPE KUNNR, IMX TYPE /ASU/UACC_STEP_ORDER,TRANSENTRY TYPE /ASU/UACC_STEP_ORDER, LINID TYPE N.

CALL FUNCTION 'NUMBER_GET_NEXT'
EXPORTING
  NR_RANGE_NR             = ''
  OBJECT                  = 'VBRK'
IMPORTING
  NUMBER                  = IMX
EXCEPTIONS
  INTERVAL_NOT_FOUND      = 1
  NUMBER_RANGE_NOT_INTERN = 2
  OBJECT_NOT_FOUND        = 3
  QUANTITY_IS_0           = 4
  QUANTITY_IS_NOT_1       = 5
  INTERVAL_OVERFLOW       = 6
  BUFFER_OVERFLOW         = 7
  OTHERS                  = 8.

Write IMX.
