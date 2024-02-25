; =========================================================================================================
;
; Set the current and sensitivity for homing, non-printing, routines
;
; =========================================================================================================
;
M915 X S20 H200 R1 F1		    ; Configure stall detect to report stalls
M915 Y S20 H200 R1 F1	    ; on both X and Y
M913 X100 Y100 Z100                                       ; set the x, y, and z drivers current percentage for non-print moves, per config.g.
;
; =========================================================================================================
;