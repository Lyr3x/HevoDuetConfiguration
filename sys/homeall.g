; homeall.g
; called to home all axes
;
; This makes use of stall detection to perform sensorless homing.
; The initial position is unknown so we may be up against either end
; of the machine. We need to take care to handle hitting either min or max
; endstops and to try and ensure that stall detect operates correctly. To
; do this and to minimise and damage if we hit the machine we operate at a
; reduced current during these moves.
M400					            ; Wait for all moves to stop
G91						            ; Use relative moves
G1 H2 X0.01 Y0.01 Z0.01	  ; Move X, Y and Z a small amount to force enable
G4 P200					          ; Wait to ensure TMC sees this as stopped state
M915 P0 S3 H200 R0	    ; Configure stall detect in case we hit max endstops
M915 P1 S3 H200 R0	    ; Configure stall detect
M574 X1 S3				        ; Configure X endstop
M574 Y1 S3				        ; Configure Y endstop
M913 X50 Y50 Z50		      ; Lower X, Y and Z power
G4 P200					          ; Delay to ensure settings are made
G1 H2 Z5 F2500			      ; Lift Z relative to current position
G1 H1 X20 Y20 F3600		    ; Back away from endstop
M400                      ; Wait for all moves to stop
M915 X S2 H200 R0	    ; Configure stall detect for home, use more sensitive setting
M915 Y S2 H200 R0	    ; Configure stall detect for home detect
G4 P200                   ; Delay to ensure settings are made
G1 H1 X-300 F2800
G1 H1 Y-300 F2800	  ; Move towards endstop until it stalls
M400					            ; Wait for motion to stop, we should now be home
; There is a small chance that the above sequence did not work
; sometimes the inital movements after the printer has been powered
; on trigger stall detection. To avoid having the home position set
; incorrectly, we repeat the home operation again to be safe.
M915 X S1 H200 R0	    ; Configure stall detect
M915 Y S1 H200 R0	    ; Configure stall detect
G1 H1 X10 Y10 F3699	    ; Back away from endstop
M400                      ; Wait for all moves to stop
M915 X S3 H200 R0	    ; Configure stall detect for home detect
M915 Y S3 H200 R0	    ; Configure stall detect for home detect
G4 P200                   ; Delay to ensure settings are made
G1 H1 X-300 F2800
G1 H1 Y-300 F2800	  ; Move towards endstop until it stalls
M400					            ; Wait for all moves to stop
M915 X S2 H200 R0	    ; Configure stall detect to be less sensitive
M915 Y S2 H200 R0	    ; Configure stall detect
G4 P200                   ; Delay to ensure settings are made
G1 X1 Y1 F1000			      ; Move away from stop and cancel stall
M400					            ; Wait for all moves to stop
G90						            ; Absolute positioning
G1 X135 Y140 F5000        ; Go to first bed probe point and home Z
G30                       ; Home Z by probing the bed
M913 X100 Y100 Z100		    ; Back to full power
M915 X S20 H200 R1		    ; Configure stall detect to report stalls
M915 Y S20 H200 R1		    ; on both X and Y