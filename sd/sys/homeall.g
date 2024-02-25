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
M98 P"current-sense-normal.g"     ; Configure stall detect
M574 X1 S3				        ; Configure X endstop
M574 Y1 S3				        ; Configure Y endstop
G4 P200					          ; Delay to ensure settings are made
G1 H2 Z10 F2500			      ; Lift Z relative to current position
G1 H1 X10 Y5 F3600		    ; Back away from endstop
M400                      ; Wait for all moves to stop
M98 P"current-sense-homing.g"     ; Ensure the current and sensitivity is set for homing routines.
G4 P200                   ; Delay to ensure settings are made
G1 H1 X-300 F2800
G1 H1 Y-300 F2800	  ; Move towards endstop until it stalls
M400					            ; Wait for motion to stop, we should now be home
; There is a small chance that the above sequence did not work
; sometimes the inital movements after the printer has been powered
; on trigger stall detection. To avoid having the home position set
; incorrectly, we repeat the home operation again to be safe.
M915 X S5 H400 R1		    ; Configure stall detect to report stalls
M915 Y S5 H400 R1		    ; on both X and Y
G1 X15Y10
G90							; Back to absolute position
M98 P"current-sense-stall.g"     ; Configure stall detect
G4 P200					          ; Delay to ensure settings are made