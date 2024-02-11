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
Sheet 4 11
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
L R R25
U 1 1 59B088D3
P 4750 1900
AR Path="/59B0973E/59B088D3" Ref="R25"  Part="1" 
AR Path="/59B03D9A/59B088D3" Ref="R23"  Part="1" 
AR Path="/59B0B489/59B088D3" Ref="R27"  Part="1" 
AR Path="/59B0B5C1/59B088D3" Ref="R29"  Part="1" 
AR Path="/59B0B6F4/59B088D3" Ref="R31"  Part="1" 
F 0 "R23" V 4830 1900 50  0000 C CNN
F 1 "10k" V 4750 1900 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4680 1900 50  0001 C CNN
F 3 "" H 4750 1900 50  0001 C CNN
	1    4750 1900
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR019
U 1 1 59B08958
P 3950 2300
AR Path="/59B0973E/59B08958" Ref="#PWR019"  Part="1" 
AR Path="/59B03D9A/59B08958" Ref="#PWR017"  Part="1" 
AR Path="/59B0B489/59B08958" Ref="#PWR021"  Part="1" 
AR Path="/59B0B5C1/59B08958" Ref="#PWR023"  Part="1" 
AR Path="/59B0B6F4/59B08958" Ref="#PWR025"  Part="1" 
F 0 "#PWR025" H 3950 2150 50  0001 C CNN
F 1 "+3.3V" H 3950 2440 50  0000 C CNN
F 2 "" H 3950 2300 50  0001 C CNN
F 3 "" H 3950 2300 50  0001 C CNN
	1    3950 2300
	1    0    0    -1  
$EndComp
$Comp
L R R24
U 1 1 59B08972
P 4150 2450
AR Path="/59B0973E/59B08972" Ref="R24"  Part="1" 
AR Path="/59B03D9A/59B08972" Ref="R22"  Part="1" 
AR Path="/59B0B489/59B08972" Ref="R26"  Part="1" 
AR Path="/59B0B5C1/59B08972" Ref="R28"  Part="1" 
AR Path="/59B0B6F4/59B08972" Ref="R30"  Part="1" 
F 0 "R22" V 4230 2450 50  0000 C CNN
F 1 "1k" V 4150 2450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4080 2450 50  0001 C CNN
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
L +12V #PWR020
U 1 1 59B08A34
P 4750 1600
AR Path="/59B0973E/59B08A34" Ref="#PWR020"  Part="1" 
AR Path="/59B03D9A/59B08A34" Ref="#PWR018"  Part="1" 
AR Path="/59B0B489/59B08A34" Ref="#PWR022"  Part="1" 
AR Path="/59B0B5C1/59B08A34" Ref="#PWR024"  Part="1" 
AR Path="/59B0B6F4/59B08A34" Ref="#PWR026"  Part="1" 
F 0 "#PWR026" H 4750 1450 50  0001 C CNN
F 1 "+12V" H 4750 1740 50  0000 C CNN
F 2 "" H 4750 1600 50  0001 C CNN
F 3 "" H 4750 1600 50  0001 C CNN
	1    4750 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 1750 4750 1600
$Comp
L MMBT3904 Q4
U 1 1 59B240F5
P 4650 2450
AR Path="/59B0B5C1/59B240F5" Ref="Q4"  Part="1" 
AR Path="/59B0973E/59B240F5" Ref="Q2"  Part="1" 
AR Path="/59B03D9A/59B240F5" Ref="Q1"  Part="1" 
AR Path="/59B0B489/59B240F5" Ref="Q3"  Part="1" 
AR Path="/59B0B6F4/59B240F5" Ref="Q5"  Part="1" 
F 0 "Q1" H 4850 2525 50  0000 L CNN
F 1 "MMBT3904" H 4850 2450 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 4850 2375 50  0001 L CIN
F 3 "" H 4650 2450 50  0001 L CNN
	1    4650 2450
	1    0    0    -1  
$EndComp
$EndSCHEMATC
