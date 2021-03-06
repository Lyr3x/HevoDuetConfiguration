; Configuration file for Duet 3 (firmware version 3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.2.3 on Wed Jun 09 2021 21:02:13 GMT+0200 (Mitteleuropäische Sommerzeit)

; General preferences
G90                                          ; send absolute coordinates...
M83                                          ; ...but relative extruder moves
M550 P"Duet 3"                               ; set printer name
M669 K1                                      ; select CoreXY mode

; Drives
M569 P0.0 S1 D3 H50 v50                      ; physical drive 0.0 goes forwards
M569 P0.1 S1 D3 H50 v50                      ; physical drive 0.1 goes forwards
M569 P0.2 S0                                 ; physical drive 0.2 goes backwards
M569 P0.3 S0                                 ; physical drive 0.3 goes backwards
M569 P0.4 S0                                 ; physical drive 0.4 goes backwards
M584 X0.0 Y0.1 Z2:3 E0.4                     ; set drive mapping

M350 X16 Y16 Z16 E16 I1                      ; configure microstepping with interpolation
M92 X160.00 Y160.00 Z400.00 E409.00            ; set steps per mm
M566 X1000.00 Y1000.00 Z120.00 E120.00          ; set maximum instantaneous speed changes (mm/min)
M203 X6000.00 Y6000.00 Z600.00 E1200.00      ; set maximum speeds (mm/min)
M201 X3000.00 Y3000.00 Z200.00 E500.00          ; set accelerations (mm/s^2)
M906 X1300 Y1300 Z950 E920 I60              ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                      ; Set idle timeout

; Axis Limits
M208 X0 Y0 Z0 S1                             ; set axis minima
M208 X285 Y270 Z270 S0                       ; set axis maxima

; Endstops
M574 X1 S3                                   ; configure sensorless endstop for low end on X
M574 Y1 S3                                   ; configure sensorless endstop for low end on Y
M915 X R0 F0 S2								 ; Set X Stallguard values (-63/+63) - is more sensitive
M915 Y R0 F0 S1								 ; Set Y Stallguard values (-63/+63) - is more sensitive

; Z-Probe
M558 P8 L1 C"io3.in+io3.out" H2 F600 T6000      ; set Z probe type to unmodulated and the dive height + speeds
G31 P500 X-22 Y26 Z0.94                         ; set Z probe trigger value, offset and trigger height
M557 X30:215 Y15:195 S20                        ; define mesh grid
M671 X-15.0:300.0 Y125.0:-20.0			        ; Z leadscrews

; Heaters
M308 S0 P"temp0" Y"thermistor" T100000 B3950 ; configure sensor 0 as thermistor on pin temp0
M950 H0 C"out0" T0                           ; create bed heater output on out0 and map it to sensor 0
M307 H0 R0.488 C266.9 D2.95 S1.00 V24.1                             ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                      ; map heated bed to heater 0
M143 H0 S120                                 ; set temperature limit for heater 0 to 120C
M308 S1 P"temp1" Y"thermistor" T100000 B4725 C7.06e-8; configure sensor 1 as thermistor on pin temp1
M950 H1 C"out1" T1                           ; create nozzle heater output on out1 and map it to sensor 1
M307 H1 B0 R1.879 C256.2:160.3 D5.40 S1.00 V24.0     ; disable bang-bang mode for heater  and set PWM limit
M143 H1 S280                                 ; set temperature limit for heater 1 to 280C

; Fans
M950 F0 C"out5" Q500                         ; create fan 0 on pin out5 and set its frequency
M106 P0 S0 H-1                            	 ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"out4" Q500                         ; create fan 1 on pin out4 and set its frequency
M106 P1 S1 H1 T45                             ; set fan 1 value. Thermostatic control is turned on


; Tools
M563 P0 S"Hemera" D0 H1 F0                   ; define tool 0
G10 P0 X0 Y0 Z0                              ; set tool 0 axis offsets
G10 P0 R0 S0                                 ; set initial tool 0 active and standby temperatures to 0C

; Custom settings are not defined

; Miscellaneous
M575 P1 S1 B57600                           ; enable support for PanelDue
;M501                                         ; load saved parameters from non-volatile memory
T0                                           ; select first tool

M557 X0:250 Y26:250 S50

M501                                                   ; use config-override (for Thermistor Parameters and other settings)

