; =========================================================================================================
;
; Set the current and sensitivity for homing, non-printing, routines
;
; =========================================================================================================
;
M915 X S3 F0 H400 R0                                   ; set the x axis sensitivity.
M915 Y S3 F0 H400 R0                                   ; set the y axis sensitivity.
M913 X100 Y100 Z100                                       ; set the x, y, and z drivers current percentage for non-print moves, per config.g.
;
; =========================================================================================================
;