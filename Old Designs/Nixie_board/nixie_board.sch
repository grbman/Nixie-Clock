EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:nixie_board-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 11
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 7100 5350 1500 800 
U 594C4A53
F0 "can" 60
F1 "can.sch" 60
F2 "RX" I L 7100 5500 60 
F3 "TX" I L 7100 5700 60 
F4 "~STANDBY" I L 7100 5900 60 
$EndSheet
$Sheet
S 5050 650  1450 1100
U 597EA609
F0 "power" 60
F1 "power.sch" 60
F2 "170HV" O L 5050 1600 60 
$EndSheet
$Sheet
S 4500 3250 900  150 
U 59B03D9A
F0 "level_shifter_1" 60
F1 "level_shifter.sch" 60
F2 "3.3V_logic_in" I L 4500 3300 60 
F3 "output" I R 5400 3350 60 
$EndSheet
$Comp
L teensy_3_2 U1
U 1 1 59B05D9C
P 2250 5750
F 0 "U1" H 2500 5800 60  0000 C CNN
F 1 "teensy_3_2" H 2500 4275 60  0000 C CNN
F 2 "tubes:teensy_3.2" H 2250 5700 60  0001 C CNN
F 3 "" H 2250 5700 60  0001 C CNN
	1    2250 5750
	1    0    0    -1  
$EndComp
$Sheet
S 4500 3700 900  150 
U 59B0973E
F0 "level_shifter_2" 60
F1 "level_shifter.sch" 60
F2 "3.3V_logic_in" I L 4500 3750 60 
F3 "output" I R 5400 3800 60 
$EndSheet
$Sheet
S 4500 4100 900  150 
U 59B0B489
F0 "level_shifter_3" 60
F1 "level_shifter.sch" 60
F2 "3.3V_logic_in" I L 4500 4150 60 
F3 "output" I R 5400 4200 60 
$EndSheet
$Sheet
S 4500 4500 900  150 
U 59B0B5C1
F0 "level_shifter_4" 60
F1 "level_shifter.sch" 60
F2 "3.3V_logic_in" I L 4500 4550 60 
F3 "output" I R 5400 4600 60 
$EndSheet
$Sheet
S 4500 4850 900  150 
U 59B0B6F4
F0 "level_shifter_5" 60
F1 "level_shifter.sch" 60
F2 "3.3V_logic_in" I L 4500 4900 60 
F3 "output" I R 5400 4950 60 
$EndSheet
$Comp
L +5V #PWR01
U 1 1 59B1FC17
P 3250 5750
F 0 "#PWR01" H 3250 5600 50  0001 C CNN
F 1 "+5V" H 3250 5890 50  0000 C CNN
F 2 "" H 3250 5750 50  0001 C CNN
F 3 "" H 3250 5750 50  0001 C CNN
	1    3250 5750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 59B203EC
P 1125 5800
F 0 "#PWR02" H 1125 5550 50  0001 C CNN
F 1 "GND" H 1125 5650 50  0000 C CNN
F 2 "" H 1125 5800 50  0001 C CNN
F 3 "" H 1125 5800 50  0001 C CNN
	1    1125 5800
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR03
U 1 1 59B20A9C
P 3450 5800
F 0 "#PWR03" H 3450 5650 50  0001 C CNN
F 1 "+3.3V" H 3450 5940 50  0000 C CNN
F 2 "" H 3450 5800 50  0001 C CNN
F 3 "" H 3450 5800 50  0001 C CNN
	1    3450 5800
	1    0    0    -1  
$EndComp
Text Notes 2100 5525 0    60   ~ 0
need pullups enabled
Text Label 6650 5700 0    60   ~ 0
CAN_TX
Text Label 6650 5500 0    60   ~ 0
CAN_RX
Text Label 1600 6300 0    60   ~ 0
CAN_RX
Text Label 1600 6200 0    60   ~ 0
CAN_TX
Wire Wire Line
	5050 1600 4850 1600
Wire Wire Line
	4850 1600 4850 2150
Wire Wire Line
	4850 2150 5000 2150
Wire Wire Line
	5400 3350 7100 3350
Wire Wire Line
	5400 3800 7100 3800
Wire Wire Line
	5400 4200 7100 4200
Wire Wire Line
	5400 4600 7100 4600
Wire Wire Line
	5400 4950 7100 4950
Wire Wire Line
	1125 5800 2050 5800
Wire Wire Line
	7100 5500 6600 5500
Wire Wire Line
	7100 5700 6600 5700
Wire Wire Line
	2050 6300 1550 6300
Wire Wire Line
	2050 6200 1550 6200
Wire Wire Line
	4500 3300 3850 3300
Wire Wire Line
	4500 3750 3850 3750
Wire Wire Line
	4500 4150 3850 4150
Wire Wire Line
	4500 4550 3850 4550
Wire Wire Line
	4500 4900 3850 4900
Text Label 3900 3300 0    60   ~ 0
SR_CLK
Text Label 3900 3750 0    60   ~ 0
SR_DATA
Text Label 3900 4150 0    60   ~ 0
SR_LATCH
Text Label 3900 4550 0    60   ~ 0
SR_POL
Text Label 3900 4900 0    60   ~ 0
SR_BLANK
Wire Wire Line
	2050 7000 1400 7000
Text Label 1450 7000 0    60   ~ 0
SR_DATA
Wire Wire Line
	3900 7100 3250 7100
Text Label 3300 7100 0    60   ~ 0
SR_CLK
Wire Wire Line
	3250 5800 3250 5750
Wire Wire Line
	3250 6000 3450 6000
Wire Wire Line
	3450 6000 3450 5800
Wire Wire Line
	3900 6100 3250 6100
Text Label 3300 6200 0    60   ~ 0
SR_LATCH
Wire Wire Line
	3900 6200 3250 6200
Text Label 3300 6300 0    60   ~ 0
SR_POL
Wire Wire Line
	3900 6300 3250 6300
Text Label 3300 6100 0    60   ~ 0
SR_BLANK
$Comp
L GND #PWR04
U 1 1 59B3511B
P 700 6900
F 0 "#PWR04" H 700 6650 50  0001 C CNN
F 1 "GND" H 700 6750 50  0000 C CNN
F 2 "" H 700 6900 50  0001 C CNN
F 3 "" H 700 6900 50  0001 C CNN
	1    700  6900
	1    0    0    -1  
$EndComp
Text Label 6650 5900 0    60   ~ 0
CAN_STBY
Wire Wire Line
	7100 5900 6600 5900
Text Label 3300 6400 0    60   ~ 0
CAN_STBY
Wire Wire Line
	3750 6400 3250 6400
$Sheet
S 5000 2000 1500 950 
U 594C1F03
F0 "tubes" 60
F1 "tubes.sch" 60
F2 "170HV" I L 5000 2150 60 
$EndSheet
$Sheet
S 7100 2000 1500 3050
U 594B07AB
F0 "shift_registers" 60
F1 "shift_registers.sch" 60
F2 "CLK" I L 7100 3350 60 
F3 "DATA" I L 7100 3800 60 
F4 "~LATCH_ENABLE" I L 7100 4200 60 
F5 "~POLARITY" I L 7100 4600 60 
F6 "~BLANKING" I L 7100 4950 60 
$EndSheet
NoConn ~ 3250 5900
NoConn ~ 3250 6600
NoConn ~ 3250 6500
NoConn ~ 3250 6700
NoConn ~ 2050 6400
NoConn ~ 2050 6500
NoConn ~ 2050 6600
NoConn ~ 2050 6700
NoConn ~ 2050 6800
NoConn ~ 2050 6900
NoConn ~ 2050 7100
NoConn ~ 3250 6800
NoConn ~ 3250 6900
NoConn ~ 3250 7000
$Sheet
S 6950 725  1200 775 
U 59D6C374
F0 "LEDs" 60
F1 "LEDs.sch" 60
$EndSheet
$Comp
L SW_Push SW1
U 1 1 59D7E3C3
P 900 6150
F 0 "SW1" H 950 6250 50  0000 L CNN
F 1 "SW_Push" H 900 6090 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm" H 900 6350 50  0001 C CNN
F 3 "" H 900 6350 50  0001 C CNN
	1    900  6150
	1    0    0    -1  
$EndComp
$Comp
L SW_Push SW2
U 1 1 59D7E728
P 900 6425
F 0 "SW2" H 950 6525 50  0000 L CNN
F 1 "SW_Push" H 900 6365 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm" H 900 6625 50  0001 C CNN
F 3 "" H 900 6625 50  0001 C CNN
	1    900  6425
	1    0    0    -1  
$EndComp
$Comp
L SW_Push SW3
U 1 1 59D807A6
P 900 6700
F 0 "SW3" H 950 6800 50  0000 L CNN
F 1 "SW_Push" H 900 6640 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm" H 900 6900 50  0001 C CNN
F 3 "" H 900 6900 50  0001 C CNN
	1    900  6700
	1    0    0    -1  
$EndComp
Text Label 4850 2000 1    60   ~ 0
170HV
Wire Wire Line
	1100 6150 1300 6150
Wire Wire Line
	1300 6150 1300 5900
Wire Wire Line
	1300 5900 2050 5900
Wire Wire Line
	1100 6425 1350 6425
Wire Wire Line
	1350 6425 1350 6000
Wire Wire Line
	1350 6000 2050 6000
Wire Wire Line
	1100 6700 1425 6700
Wire Wire Line
	1425 6700 1425 6100
Wire Wire Line
	1425 6100 2050 6100
Wire Wire Line
	700  6150 700  6900
Connection ~ 700  6425
Connection ~ 700  6700
Text Label 6000 3350 0    60   ~ 0
SR_CLK_12V
Text Label 6025 3800 0    60   ~ 0
SR_DATA_12V
Text Label 6050 4200 0    60   ~ 0
SR_LATCH_12V
Text Label 6050 4600 0    60   ~ 0
SR_POL_12V
Text Label 6050 4950 0    60   ~ 0
SR_BLANK_12V
$Comp
L Conn_01x01_Male J3
U 1 1 59DFA7BB
P 1875 1725
F 0 "J3" H 1875 1825 50  0000 C CNN
F 1 "Conn_01x01_Male" H 1875 1625 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_DIN965_Pad" H 1875 1725 50  0001 C CNN
F 3 "" H 1875 1725 50  0001 C CNN
	1    1875 1725
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x01_Male J4
U 1 1 59DFA944
P 1875 2025
F 0 "J4" H 1875 2125 50  0000 C CNN
F 1 "Conn_01x01_Male" H 1875 1925 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_DIN965_Pad" H 1875 2025 50  0001 C CNN
F 3 "" H 1875 2025 50  0001 C CNN
	1    1875 2025
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x01_Male J5
U 1 1 59DFA9E7
P 1875 2350
F 0 "J5" H 1875 2450 50  0000 C CNN
F 1 "Conn_01x01_Male" H 1875 2250 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_DIN965_Pad" H 1875 2350 50  0001 C CNN
F 3 "" H 1875 2350 50  0001 C CNN
	1    1875 2350
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x01_Male J6
U 1 1 59DFAA88
P 1875 2625
F 0 "J6" H 1875 2725 50  0000 C CNN
F 1 "Conn_01x01_Male" H 1875 2525 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_DIN965_Pad" H 1875 2625 50  0001 C CNN
F 3 "" H 1875 2625 50  0001 C CNN
	1    1875 2625
	1    0    0    -1  
$EndComp
NoConn ~ 2075 1725
NoConn ~ 2075 2025
NoConn ~ 2075 2350
NoConn ~ 2075 2625
Text Notes 1600 1525 0    60   ~ 0
mounting holes
Wire Notes Line
	1450 1550 2375 1550
Wire Notes Line
	2375 1550 2375 2875
Wire Notes Line
	2375 2875 1450 2875
Wire Notes Line
	1450 2875 1450 1550
$EndSCHEMATC
