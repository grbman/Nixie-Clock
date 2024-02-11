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
Sheet 10 11
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
L HV5622PG U2
U 1 1 594B047D
P 2450 4275
F 0 "U2" H 1400 6025 50  0000 C CNN
F 1 "HV5622PG" H 1800 2725 50  0000 C CNN
F 2 "tubes:LQFP-44_Gullwing" H 4850 3625 50  0001 C CNN
F 3 "" H 4850 3625 50  0001 C CNN
	1    2450 4275
	0    -1   -1   0   
$EndComp
$Comp
L HV5622PG U3
U 1 1 594B054E
P 6150 4275
F 0 "U3" H 5100 6025 50  0000 C CNN
F 1 "HV5622PG" H 5500 2725 50  0000 C CNN
F 2 "tubes:LQFP-44_Gullwing" H 8550 3625 50  0001 C CNN
F 3 "" H 8550 3625 50  0001 C CNN
	1    6150 4275
	0    -1   -1   0   
$EndComp
$Comp
L HV5622PG U4
U 1 1 594B0584
P 9850 4275
F 0 "U4" H 8800 6025 50  0000 C CNN
F 1 "HV5622PG" H 9200 2725 50  0000 C CNN
F 2 "tubes:LQFP-44_Gullwing" H 12250 3625 50  0001 C CNN
F 3 "" H 12250 3625 50  0001 C CNN
	1    9850 4275
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR027
U 1 1 594BFCBD
P 3600 5525
F 0 "#PWR027" H 3600 5275 50  0001 C CNN
F 1 "GND" H 3600 5375 50  0000 C CNN
F 2 "" H 3600 5525 50  0001 C CNN
F 3 "" H 3600 5525 50  0001 C CNN
	1    3600 5525
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR028
U 1 1 594BFCD8
P 7300 5525
F 0 "#PWR028" H 7300 5275 50  0001 C CNN
F 1 "GND" H 7300 5375 50  0000 C CNN
F 2 "" H 7300 5525 50  0001 C CNN
F 3 "" H 7300 5525 50  0001 C CNN
	1    7300 5525
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR029
U 1 1 594BFD0A
P 11000 5525
F 0 "#PWR029" H 11000 5275 50  0001 C CNN
F 1 "GND" H 11000 5375 50  0000 C CNN
F 2 "" H 11000 5525 50  0001 C CNN
F 3 "" H 11000 5525 50  0001 C CNN
	1    11000 5525
	1    0    0    -1  
$EndComp
Text HLabel 1800 575  0    60   Input ~ 0
CLK
Text HLabel 1800 725  0    60   Input ~ 0
DATA
Text HLabel 1800 875  0    60   Input ~ 0
~LATCH_ENABLE
Text Label 1850 575  0    60   ~ 0
CLK
Text Label 1850 725  0    60   ~ 0
DATA
Text Label 1850 875  0    60   ~ 0
~LATCH_ENABLE
Text Label 1250 6275 1    60   ~ 0
~LATCH_ENABLE
Text Label 1350 6275 1    60   ~ 0
DATA
Text Label 1450 6275 1    60   ~ 0
CLK
Text Label 4950 6275 1    60   ~ 0
~LATCH_ENABLE
Text Label 5150 6275 1    60   ~ 0
CLK
Text Label 8650 6275 1    60   ~ 0
~LATCH_ENABLE
Text Label 8850 6275 1    60   ~ 0
CLK
$Comp
L +12V #PWR030
U 1 1 594C131E
P 500 5525
F 0 "#PWR030" H 500 5375 50  0001 C CNN
F 1 "+12V" H 500 5665 50  0000 C CNN
F 2 "" H 500 5525 50  0001 C CNN
F 3 "" H 500 5525 50  0001 C CNN
	1    500  5525
	-1   0    0    1   
$EndComp
$Comp
L +12V #PWR031
U 1 1 594C1339
P 4200 5525
F 0 "#PWR031" H 4200 5375 50  0001 C CNN
F 1 "+12V" H 4200 5665 50  0000 C CNN
F 2 "" H 4200 5525 50  0001 C CNN
F 3 "" H 4200 5525 50  0001 C CNN
	1    4200 5525
	-1   0    0    1   
$EndComp
$Comp
L +12V #PWR032
U 1 1 594C136E
P 7900 5525
F 0 "#PWR032" H 7900 5375 50  0001 C CNN
F 1 "+12V" H 7900 5665 50  0000 C CNN
F 2 "" H 7900 5525 50  0001 C CNN
F 3 "" H 7900 5525 50  0001 C CNN
	1    7900 5525
	-1   0    0    1   
$EndComp
Text Label 1150 6275 1    60   ~ 0
~POLARITY
Text Label 4850 6275 1    60   ~ 0
~POLARITY
Text Label 8550 6275 1    60   ~ 0
~POLARITY
Text Label 8450 6275 1    60   ~ 0
~BLANKING
Text Label 4750 6275 1    60   ~ 0
~BLANKING
Text HLabel 1800 1025 0    60   Input ~ 0
~POLARITY
Text HLabel 1800 1175 0    60   Input ~ 0
~BLANKING
Text Label 1850 1025 0    60   ~ 0
~POLARITY
Text Label 1850 1175 0    60   ~ 0
~BLANKING
Wire Wire Line
	3350 5525 3350 6675
Wire Wire Line
	3350 6675 5050 6675
Wire Wire Line
	5050 6675 5050 5525
Wire Wire Line
	7050 5525 7050 6475
Wire Wire Line
	7050 6475 8750 6475
Wire Wire Line
	8750 6475 8750 5525
Wire Wire Line
	1450 5525 1450 6375
Wire Wire Line
	1800 575  2200 575 
Wire Wire Line
	1800 725  2200 725 
Wire Wire Line
	1800 875  2200 875 
Wire Wire Line
	1350 5525 1350 6375
Wire Wire Line
	1250 5525 1250 6375
Wire Wire Line
	5150 5525 5150 6375
Wire Wire Line
	4950 5525 4950 6375
Wire Wire Line
	8850 5525 8850 6375
Wire Wire Line
	8650 5525 8650 6375
Wire Wire Line
	1150 5525 1150 6375
Wire Wire Line
	1050 5525 1050 6375
Wire Wire Line
	4850 5525 4850 6375
Wire Wire Line
	4750 5525 4750 6375
Wire Wire Line
	8550 5525 8550 6375
Wire Wire Line
	8450 5525 8450 6375
Wire Wire Line
	1800 1025 2200 1025
Wire Wire Line
	1800 1175 2200 1175
Text GLabel 2500 3075 1    60   Input ~ 0
N1_DOT_RIGHT
Text GLabel 2600 3075 1    60   Input ~ 0
N1_NUM_0
Text GLabel 2300 3075 1    60   Input ~ 0
N1_NUM_1
Text GLabel 2200 3075 1    60   Input ~ 0
N1_NUM_2
Text GLabel 3300 3075 1    60   Input ~ 0
N1_NUM_3
Text GLabel 3200 3075 1    60   Input ~ 0
N1_NUM_4
Text GLabel 3100 3075 1    60   Input ~ 0
N1_NUM_5
Text GLabel 3000 3075 1    60   Input ~ 0
N1_NUM_6
Text GLabel 2900 3075 1    60   Input ~ 0
N1_NUM_7
Text GLabel 2800 3075 1    60   Input ~ 0
N1_NUM_8
Text GLabel 2400 3075 1    60   Input ~ 0
N1_DOT_LEFT
Text GLabel 2700 3075 1    60   Input ~ 0
N1_NUM_9
Text GLabel 1600 3075 1    60   Input ~ 0
N2_DOT_RIGHT
Text GLabel 1700 3075 1    60   Input ~ 0
N2_NUM_0
Text GLabel 1400 3075 1    60   Input ~ 0
N2_NUM_1
Text GLabel 1300 3075 1    60   Input ~ 0
N2_NUM_2
Text GLabel 1200 3075 1    60   Input ~ 0
N2_NUM_3
Text GLabel 1100 3075 1    60   Input ~ 0
N2_NUM_4
Text GLabel 1000 3075 1    60   Input ~ 0
N2_NUM_5
Text GLabel 900  3075 1    60   Input ~ 0
N2_NUM_6
Text GLabel 800  3075 1    60   Input ~ 0
N2_NUM_7
Text GLabel 700  3075 1    60   Input ~ 0
N2_NUM_8
Text GLabel 1500 3075 1    60   Input ~ 0
N2_DOT_LEFT
Text GLabel 1800 3075 1    60   Input ~ 0
N2_NUM_9
Text GLabel 6300 3075 1    60   Input ~ 0
N3_DOT_RIGHT
Text GLabel 6400 3075 1    60   Input ~ 0
N3_NUM_0
Text GLabel 6100 3075 1    60   Input ~ 0
N3_NUM_1
Text GLabel 6000 3075 1    60   Input ~ 0
N3_NUM_2
Text GLabel 7100 3075 1    60   Input ~ 0
N3_NUM_3
Text GLabel 7000 3075 1    60   Input ~ 0
N3_NUM_4
Text GLabel 6900 3075 1    60   Input ~ 0
N3_NUM_5
Text GLabel 6800 3075 1    60   Input ~ 0
N3_NUM_6
Text GLabel 6700 3075 1    60   Input ~ 0
N3_NUM_7
Text GLabel 6600 3075 1    60   Input ~ 0
N3_NUM_8
Text GLabel 6200 3075 1    60   Input ~ 0
N3_DOT_LEFT
Text GLabel 6500 3075 1    60   Input ~ 0
N3_NUM_9
Text GLabel 5300 3075 1    60   Input ~ 0
N4_DOT_RIGHT
Text GLabel 5400 3075 1    60   Input ~ 0
N4_NUM_0
Text GLabel 5100 3075 1    60   Input ~ 0
N4_NUM_1
Text GLabel 5000 3075 1    60   Input ~ 0
N4_NUM_2
Text GLabel 4900 3075 1    60   Input ~ 0
N4_NUM_3
Text GLabel 4800 3075 1    60   Input ~ 0
N4_NUM_4
Text GLabel 4700 3075 1    60   Input ~ 0
N4_NUM_5
Text GLabel 4600 3075 1    60   Input ~ 0
N4_NUM_6
Text GLabel 4500 3075 1    60   Input ~ 0
N4_NUM_7
Text GLabel 4400 3075 1    60   Input ~ 0
N4_NUM_8
Text GLabel 5200 3075 1    60   Input ~ 0
N4_DOT_LEFT
Text GLabel 5500 3075 1    60   Input ~ 0
N4_NUM_9
Text GLabel 10100 3075 1    60   Input ~ 0
N5_DOT_RIGHT
Text GLabel 10200 3075 1    60   Input ~ 0
N5_NUM_0
Text GLabel 9900 3075 1    60   Input ~ 0
N5_NUM_1
Text GLabel 9800 3075 1    60   Input ~ 0
N5_NUM_2
Text GLabel 10900 3075 1    60   Input ~ 0
N5_NUM_3
Text GLabel 10800 3075 1    60   Input ~ 0
N5_NUM_4
Text GLabel 10700 3075 1    60   Input ~ 0
N5_NUM_5
Text GLabel 10600 3075 1    60   Input ~ 0
N5_NUM_6
Text GLabel 10500 3075 1    60   Input ~ 0
N5_NUM_7
Text GLabel 10400 3075 1    60   Input ~ 0
N5_NUM_8
Text GLabel 10000 3075 1    60   Input ~ 0
N5_DOT_LEFT
Text GLabel 10300 3075 1    60   Input ~ 0
N5_NUM_9
Text GLabel 9000 3075 1    60   Input ~ 0
N6_DOT_RIGHT
Text GLabel 9100 3075 1    60   Input ~ 0
N6_NUM_0
Text GLabel 8800 3075 1    60   Input ~ 0
N6_NUM_1
Text GLabel 8700 3075 1    60   Input ~ 0
N6_NUM_2
Text GLabel 8600 3075 1    60   Input ~ 0
N6_NUM_3
Text GLabel 8500 3075 1    60   Input ~ 0
N6_NUM_4
Text GLabel 8400 3075 1    60   Input ~ 0
N6_NUM_5
Text GLabel 8300 3075 1    60   Input ~ 0
N6_NUM_6
Text GLabel 8200 3075 1    60   Input ~ 0
N6_NUM_7
Text GLabel 8100 3075 1    60   Input ~ 0
N6_NUM_8
Text GLabel 8900 3075 1    60   Input ~ 0
N6_DOT_LEFT
Text GLabel 9200 3075 1    60   Input ~ 0
N6_NUM_9
NoConn ~ 10750 5525
Text Label 1050 6275 1    60   ~ 0
~BLANKING
Text GLabel 2100 3075 1    60   Input ~ 0
LED_0
Text GLabel 2000 3075 1    60   Input ~ 0
LED_1
Text GLabel 1900 3075 1    60   Input ~ 0
LED_2
Text GLabel 5900 3075 1    60   Input ~ 0
LED_3
Text GLabel 5800 3075 1    60   Input ~ 0
LED_4
Text GLabel 5700 3075 1    60   Input ~ 0
LED_5
Text GLabel 5600 3075 1    60   Input ~ 0
LED_6
Text GLabel 9700 3075 1    60   Input ~ 0
LED_7
Text GLabel 9600 3075 1    60   Input ~ 0
LED_8
Text GLabel 9500 3075 1    60   Input ~ 0
LED_9
Text GLabel 9400 3075 1    60   Input ~ 0
LED_10
Text GLabel 9300 3075 1    60   Input ~ 0
LED_11
Text GLabel 8000 3075 1    60   Input ~ 0
LED_12
Text GLabel 7900 3075 1    60   Input ~ 0
LED_13
Text GLabel 11000 3075 1    60   Input ~ 0
LED_14
Text GLabel 4300 3075 1    60   Input ~ 0
LED_15
Text GLabel 4200 3075 1    60   Input ~ 0
LED_16
Text GLabel 7300 3075 1    60   Input ~ 0
LED_17
Text GLabel 7200 3075 1    60   Input ~ 0
LED_18
Text GLabel 600  3075 1    60   Input ~ 0
LED_19
Text GLabel 500  3075 1    60   Input ~ 0
LED_20
Text GLabel 3600 3075 1    60   Input ~ 0
LED_21
Text GLabel 3500 3075 1    60   Input ~ 0
LED_22
Text GLabel 3400 3075 1    60   Input ~ 0
LED_23
Text Label 4025 6675 0    60   ~ 0
DATA_1_2
Text Label 7575 6475 0    60   ~ 0
DATA_2_3
$EndSCHEMATC
