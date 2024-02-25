; =========================================================================================================
;
; Set the current and sensitivity for non-homing, non-printing, routines
;
; =========================================================================================================
;
M915 X S2 F1 H400 R1                                   ; set the x axis sensitivity.
M915 Y S2 F1 H400 R1                                   ; set the y axis sensitivity.
M913 X100 Y100 Z100                                       ; set the x, y, and z drivers current percentage for non-print moves, per config.g.
;
; =========================================================================================================
;