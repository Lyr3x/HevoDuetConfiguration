; homex.g
; called to home the X axis
;
M400					          ; Wait for all moves to stop
G91						          ; Use relative moves
G1 H2 X0.01	Z0.01		    ; Move X a small amount to enable
M400					          ; Wait for all moves to stop
G4 P200					        ; Delay to allow TMC to detect stopped state
M98 P"current-sense-normal.g"     ; Configure stall detect
M574 X1 S3				        ; Configure X endstop
G4 P200					        ; Delay to ensure settings are made
G1 H2 Z5 F4000			    ; Lift Z relative to current position
G1 H1 X5 F4000			    ; Back away from endstop
M400					          ; Wait for all moves to stop
M98 P"current-sense-homing.g"     ; Ensure the current and sensitivity is set for homing routines.
G4 P200					        ; Delay to ensure settings are made
G1 H1 X-230 F4000		    ; Move towards endstop until it stalls
M400					          ; Wait for all moves to stop
G90						          ; Absolute positioning
M98 P"current-sense-stall.g"     ; Configure stall detect