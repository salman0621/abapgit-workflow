class ZZSLS_HEAD_SCR_CUS_HEAD_CLASS definition
  public
  final
  create public .

public section.

  interfaces IF_BADI_INTERFACE .
  interfaces IF_EX_SLS_HEAD_SCR_CUS .
protected section.
private section.
ENDCLASS.



CLASS ZZSLS_HEAD_SCR_CUS_HEAD_CLASS IMPLEMENTATION.


  method IF_EX_SLS_HEAD_SCR_CUS~ACTIVATE_TAB_PAGE.
     data:ls_head_tab like line of ct_cus_head_tab.

    ls_head_tab-head_caption = 'CUSTOM SCREEN'.        "Tab Description
    ls_head_tab-head_program = 'SAPMZCUSTOM_SCREEN'. "Program name
    ls_head_tab-head_dynpro = '4020'.                      "Sub Screen Name
    append ls_head_tab to ct_cus_head_tab.
  endmethod.
ENDCLASS.
