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
LIBS:nixie_lib
LIBS:nixie
LIBS:eelib
LIBS:teensy
LIBS:test-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 2N3904 Q?
U 1 1 59B03F43
P 4650 2450
F 0 "Q?" H 4850 2525 50  0000 L CNN
F 1 "2N3904" H 4850 2450 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Molded_Narrow" H 4850 2375 50  0001 L CIN
F 3 "" H 4650 2450 50  0001 L CNN
	1    4650 2450
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 59B088D3
P 4750 1900
F 0 "R?" V 4830 1900 50  0000 C CNN
F 1 "4.7k" V 4750 1900 50  0000 C CNN
F 2 "" V 4680 1900 50  0001 C CNN
F 3 "" H 4750 1900 50  0001 C CNN
	1    4750 1900
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 59B08958
P 3950 2300
F 0 "#PWR?" H 3950 2150 50  0001 C CNN
F 1 "+3.3V" H 3950 2440 50  0000 C CNN
F 2 "" H 3950 2300 50  0001 C CNN
F 3 "" H 3950 2300 50  0001 C CNN
	1    3950 2300
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 59B08972
P 4150 2450
F 0 "R?" V 4230 2450 50  0000 C CNN
F 1 "91k" V 4150 2450 50  0000 C CNN
F 2 "" V 4080 2450 50  0001 C CNN
F 3 "" H 4150 2450 50  0001 C CNN
	1    4150 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	3950 2300 3950 2450
Wire Wire Line
	3950 2450 4000 2450
Wire Wire Line
	4300 2450 4450 2450
Text HLabel 4600 2900 0    60   Input ~ 0
3.3V_logic_in
Text HLabel 4900 2150 2    60   Input ~ 0
output
Wire Wire Line
	4600 2900 4750 2900
Wire Wire Line
	4750 2900 4750 2650
Wire Wire Line
	4750 2050 4750 2250
Wire Wire Line
	4900 2150 4750 2150
Connection ~ 4750 2150
$Comp
L +12V #PWR?
U 1 1 59B08A34
P 4750 1600
F 0 "#PWR?" H 4750 1450 50  0001 C CNN
F 1 "+12V" H 4750 1740 50  0000 C CNN
F 2 "" H 4750 1600 50  0001 C CNN
F 3 "" H 4750 1600 50  0001 C CNN
	1    4750 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 1750 4750 1600
$EndSCHEMATC
