; homey.g
; called to home the Y axis

M400					          ; Wait for all moves to stop
G91						          ; Use relative moves
G1 H2 Y0.01	Z0.01		    ; Move X a small amount to enable
M400					          ; Wait for all moves to stop
G4 P200					        ; Delay to allow TMC to detect stopped state
M915 Y S1 H400 R0	  ; Configure stall detect
M574 Y1 S3				      ; Configure X endstop
M913 Y50 Z50			      ; Lower X and Z power
G4 P200					        ; Delay to ensure settings are made
G1 H2 Z5 F4000			    ; Lift Z relative to current position
G1 H1 Y20 F4000			    ; Back away from endstop
M400					          ; Wait for all moves to stop
M915 Y S3 H400 R0	  ; Configure stall detect
G4 P200					        ; Delay to ensure settings are made
G1 H1 Y-230 F4000		    ; Move towards endstop until it stalls
M400					          ; Wait for all moves to stop
M915 Y S1 H400 R0	  ; Configure stall detect
G4 P200					        ; Delay to ensure settings are made
G1 H1 Y10 F4000			    ; Back away from endstop
M400					          ; Wait for all moves to stop
M915 Y S3 H400 R0	  ; Configure stall detect
G4 P200                 ; Delay to ensure settings are made
G1 H1 Y-230 F4000		    ; Move towards endstop until it stalls
M915 Y S1 H400 R0	  ; Configure stall detect to be less sensitive
G1 Y1 F1000				      ; Move away from stop and clear stall
G1 H2 Z-5 F2500			    ; Return Z to original position
M400					          ; Wait for all moves to stop
G90						          ; Absolute positioning
M913 Y100 Z100			    ; Back to full power
M915 P0 S20 H400 R1		  ; Report any stalls