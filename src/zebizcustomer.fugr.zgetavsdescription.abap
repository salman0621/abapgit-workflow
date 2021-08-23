FUNCTION ZGETAVSDESCRIPTION.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(CODE) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(STRDESCRIPTION) TYPE  STRING
*"----------------------------------------------------------------------

  CASE CODE.
    WHEN 'YYY' OR 'Y' OR 'YYA' OR 'YYD'.
      STRDESCRIPTION = 'Address: Match & 5 Digit Zip: Match'.
      RETURN.
  WHEN 'NYZ' OR 'Z'.
    STRDESCRIPTION = 'Address: Not a match & 5 Digit Zip: Match'.
    RETURN.
  WHEN 'YNA' OR 'A' OR 'YNY'.
    STRDESCRIPTION = 'Address: Match & 5 Digit Zip: Not a match'.
    RETURN.
  WHEN 'NNN' OR 'N' OR 'NN'.
    STRDESCRIPTION = 'Address: Not a match & 5 Digit Zip: Not a match'.
    RETURN.
  WHEN 'YYX' OR 'X'.
    STRDESCRIPTION = 'Address: Match & 9 Digit Zip: Match'.
    RETURN.
  WHEN 'NYW' OR 'W'.
    STRDESCRIPTION = 'Address: Not a match & 9 Digit Zip: Match'.
    RETURN.
  WHEN 'XXW'.
    STRDESCRIPTION = 'Card Number Not On File'.
    RETURN.
  WHEN 'XXU'.
    STRDESCRIPTION = 'Address Information Not Verified For Domestic Transaction'.
    RETURN.
  WHEN 'XXR' OR 'R' OR 'U' OR 'E'.
    STRDESCRIPTION = 'Retry / System Unavailable'.
    RETURN.
  WHEN 'XXS' OR 'S'.
    STRDESCRIPTION = 'Service Not Supported'.
    RETURN.
  WHEN 'XXE'.
    STRDESCRIPTION = 'Address Verification Not Allowed For Card Type'.
    RETURN.
  WHEN 'XXG' OR 'G' OR 'C' OR 'I'.
    STRDESCRIPTION = 'Global Non-AVS Participant'.
    RETURN.
  WHEN 'YYG' OR 'B' OR 'M'.
    STRDESCRIPTION = 'International Address: Match & 5 Digit Zip: Not Compatible'.
    RETURN.
  WHEN 'GGG' OR 'D'.
    STRDESCRIPTION = 'International Address: Match & Zip: Match'.
    RETURN.
  WHEN 'YGG' OR 'P'.
    STRDESCRIPTION = 'International Address: Not Compatible & Zip: Not Compatible'.
    RETURN.

  ENDCASE.



ENDFUNCTION.
