class ZCL_IM_SD_537_DEL_HEAD definition
  public
  final
  create public .

public section.

  interfaces IF_EX_LE_SHP_TAB_CUST_HEAD .
protected section.
private section.
ENDCLASS.



CLASS ZCL_IM_SD_537_DEL_HEAD IMPLEMENTATION.


  method IF_EX_LE_SHP_TAB_CUST_HEAD~ACTIVATE_TAB_PAGE.
     ef_caption = 'Aditional Data'. "Screen Caption
  ef_program = 'SAPMZCUSTOM_SCREEN'."SAPL Followed by the Function group created ZSD537_HEAD
  ef_position = 4. " Tab Position
  ef_dynpro  = '4098'. " Screen Number
  cs_v50agl_cust = 'X'.
  endmethod.


  method IF_EX_LE_SHP_TAB_CUST_HEAD~PASS_FCODE_TO_SUBSCREEN.

  endmethod.


  method IF_EX_LE_SHP_TAB_CUST_HEAD~TRANSFER_DATA_FROM_SUBSCREEN.
  endmethod.


  method IF_EX_LE_SHP_TAB_CUST_HEAD~TRANSFER_DATA_TO_SUBSCREEN.
  endmethod.
ENDCLASS.
