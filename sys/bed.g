; bed.g
; called to perform automatic bed compensation via G32
;

M671 X-15.0:280 Y125.0:125			; Z leadscrews

if !move.axes[0].homed || !move.axes[1].homed	        ; If the printer hasn't been homed, home it
	G28 XY	; home y and x
;
G28 Z			                                        ; home z
;
M561							                        ; clear any bed transform
M98 P"bed_screws.g"		                                ; perform bed tramming
echo "BTC: 1 - Difference was " ^ move.calibration.initial.deviation ^ "mm"
;
while move.calibration.initial.deviation >= 0.01		; perform additional tramming if previous deviation was over 0.01mm
  if iterations = 5
    abort "Too many auto tramming attempts"
  M98 P"bed_screws.g"		; perform bed tramming
  echo "BTC: " ^ iterations + 2 ^ " - Difference was " ^ move.calibration.initial.deviation ^ "mm"
  continue
;
G28 Z							                        ; home z
;29


