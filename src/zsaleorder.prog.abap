*&---------------------------------------------------------------------*
*& Report ZSALEORDER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZSALEORDER.

* Parameters
* Sales document type
SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 2(20) v_text FOR FIELD p_auart.
PARAMETERS: p_auart TYPE auart OBLIGATORY.
SELECTION-SCREEN END OF LINE.

* Sales organization
SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 2(20) v_text1 FOR FIELD p_vkorg.
PARAMETERS: p_vkorg TYPE vkorg OBLIGATORY.
SELECTION-SCREEN END OF LINE.

* Distribution channel
SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 2(20) v_text2 FOR FIELD p_vtweg.
PARAMETERS: p_vtweg TYPE vtweg OBLIGATORY.
SELECTION-SCREEN END OF LINE.

* Division.
SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 2(20) v_text3 FOR FIELD p_spart.
PARAMETERS: p_spart TYPE spart OBLIGATORY.
SELECTION-SCREEN END OF LINE.

SKIP 1.

* Sold-to
SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 2(20) v_text4 FOR FIELD p_sold.
PARAMETERS: p_sold  TYPE kunnr OBLIGATORY.
SELECTION-SCREEN END OF LINE.

* Ship-to
SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 2(20) v_text5 FOR FIELD p_ship.
PARAMETERS: p_ship  TYPE kunnr OBLIGATORY.
SELECTION-SCREEN END OF LINE.

SKIP 1.

* Material
SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 2(20) v_text6 FOR FIELD p_matnr.
PARAMETERS: p_matnr TYPE matnr   OBLIGATORY.
SELECTION-SCREEN END OF LINE.

* Quantity.
SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 2(20) v_text7 FOR FIELD p_menge.
PARAMETERS: p_menge TYPE kwmeng  OBLIGATORY.
SELECTION-SCREEN END OF LINE.

* Plant
SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 2(20) v_text9 FOR FIELD p_plant.
PARAMETERS: p_plant TYPE werks_d OBLIGATORY.
SELECTION-SCREEN END OF LINE.

* Data declarations.
DATA: v_vbeln            LIKE vbak-vbeln.
DATA: header             LIKE bapisdhead1.
DATA: headerx            LIKE bapisdhead1x.
DATA: item               LIKE bapisditem  OCCURS 0 WITH HEADER LINE.
DATA: itemx              LIKE bapisditemx OCCURS 0 WITH HEADER LINE.
DATA: partner            LIKE bapipartnr  OCCURS 0 WITH HEADER LINE.
DATA: return             LIKE bapiret2    OCCURS 0 WITH HEADER LINE.
DATA: lt_schedules_inx   TYPE STANDARD TABLE OF bapischdlx
                         WITH HEADER LINE.
DATA: lt_schedules_in    TYPE STANDARD TABLE OF bapischdl
                         WITH HEADER LINE.

* Initialization.
INITIALIZATION.
v_text   = 'Order type'.
v_text1  = 'Sales Org'.
v_text2  = 'Distribution channel'.
v_text3  = 'Division'.
v_text4  = 'Sold-to'.
v_text5  = 'Ship-to'.
v_text6  = 'Material'.
v_text7  = 'Quantity'.
v_text9  = 'Plant'.

* Start-of-selection.
START-OF-SELECTION.

* Header data

* Sales document type
  header-doc_type = p_auart.
  headerx-doc_type = 'X'.

* Sales organization
  header-sales_org = p_vkorg.
  headerx-sales_org = 'X'.

* Distribution channel
  header-distr_chan  = p_vtweg.
  headerx-distr_chan = 'X'.

* Division
  header-division = p_spart.
  headerx-division = 'X'.

  headerx-updateflag = 'I'.

* Partner data
* Sold to
  partner-partn_role = 'AG'.
  partner-partn_numb = p_sold.
  APPEND partner.

* Ship to
  partner-partn_role = 'WE'.
  partner-partn_numb = p_ship.
  APPEND partner.

* ITEM DATA
  itemx-updateflag = 'I'.

* Line item number.
  item-itm_number = '000010'.
  itemx-itm_number = 'X'.

* Material
  item-material = p_matnr.
  itemx-material = 'X'.

* Plant
  item-plant    = p_plant.
  itemx-plant   = 'X'.

* Quantity
  item-target_qty = p_menge.
  itemx-target_qty = 'X'.

  APPEND item.
  APPEND itemx.

*   Fill schedule lines
  lt_schedules_in-itm_number = '000010'.
  lt_schedules_in-sched_line = '0001'.
  lt_schedules_in-req_qty    = p_menge.
  APPEND lt_schedules_in.

*   Fill schedule line flags
  lt_schedules_inx-itm_number  = '000010'.
  lt_schedules_inx-sched_line  = '0001'.
  lt_schedules_inx-updateflag  = 'X'.
  lt_schedules_inx-req_qty     = 'X'.
  APPEND lt_schedules_inx.

* Call the BAPI to create the sales order.
* Since 4.6C this BAPI is outdated. Use BAPI_SALESORDER_CREATEFROMDAT2 instead.
  CALL FUNCTION 'BAPI_SALESDOCU_CREATEFROMDATA1'
       EXPORTING
            sales_header_in     = header
            sales_header_inx    = headerx
       IMPORTING
            salesdocument_ex    = v_vbeln
       TABLES
            return              = return
            sales_items_in      = item
            sales_items_inx     = itemx
            sales_schedules_in  = lt_schedules_in
            sales_schedules_inx = lt_schedules_inx
            sales_partners      = partner.

* Check the return table.
  LOOP AT return WHERE type = 'E' OR type = 'A'.
    EXIT.
  ENDLOOP.

  IF sy-subrc = 0.

    WRITE: / 'Error in creating document'.

  ELSE.

* Commit the work.
    COMMIT WORK AND WAIT.

    WRITE: / 'Document ', v_vbeln, ' created'.

  ENDIF.
