#include <SPI.h>  // include the SPI library:
#include <avr/io.h>
#include <avr/interrupt.h>
#include <Bounce.h>
#include <FlexCAN.h>
#include <TimeLib.h>
#include <Time.h>

/* swaps positions of 1st, 2nd bytes, and 3rd and 4th bytes */
#define swap_bits(x) ( ((x)>>8 & 0x00FF0000UL) | \
                   ((x)<<8 & 0xFF000000UL) | \
                   ((x)>>8 & 0x000000FFUL) | \
                   ((x)<<8 & 0x0000FF00UL) )

/* bit shift values for odd numbered tubes from the start of their 32 bit register */
#define N_ODD_1 10
#define N_ODD_2 11
#define N_ODD_3 0
#define N_ODD_4 1
#define N_ODD_5 2
#define N_ODD_6 3
#define N_ODD_7 4
#define N_ODD_8 5
#define N_ODD_9 6
#define N_ODD_0 7
#define N_ODD_R 8
#define N_ODD_L 9
/* bit shift values for even numbered tubes from the start of their 32 bit register */
#define N_EVEN_1 4
#define N_EVEN_2 5
#define N_EVEN_3 6
#define N_EVEN_4 7
#define N_EVEN_5 8
#define N_EVEN_6 9
#define N_EVEN_7 10
#define N_EVEN_8 11
#define N_EVEN_9 0
#define N_EVEN_0 1
#define N_EVEN_R 2
#define N_EVEN_L 3

/* offsets for SR1 (sr_data[2]) */
#define N1_OFFSET 3
#define N2_OFFSET 18

#define LED_OFFSET_0 15
#define LED_OFFSET_1 16
#define LED_OFFSET_2 17
#define LED_OFFSET_19 30 
#define LED_OFFSET_20 31
#define LED_OFFSET_21 0
#define LED_OFFSET_22 1
#define LED_OFFSET_23 2

/* offsets for SR2 (sr_data[1]) */
#define N3_OFFSET 2
#define N4_OFFSET 18

#define LED_OFFSET_3 14
#define LED_OFFSET_4 15
#define LED_OFFSET_5 16
#define LED_OFFSET_6 17
#define LED_OFFSET_15 30
#define LED_OFFSET_16 31
#define LED_OFFSET_17 0
#define LED_OFFSET_18 1

/* offsets for SR3 (sr_data[0]) */
#define N5_OFFSET 1
#define N6_OFFSET 18

/* LED defines */
#define NUM_LEDS 24

#define LED_OFFSET_7 13
#define LED_OFFSET_8 14
#define LED_OFFSET_9 15
#define LED_OFFSET_10 16
#define LED_OFFSET_11 17
#define LED_OFFSET_12 30
#define LED_OFFSET_13 31
#define LED_OFFSET_14 0

/* other defines */
#define TOTAL_SR_SIZE 12


/* lookup tables */
uint8_t N_ODD_L_U[] = {N_ODD_0, N_ODD_1, N_ODD_2, N_ODD_3, N_ODD_4, N_ODD_5, N_ODD_6, 
                  N_ODD_7, N_ODD_8, N_ODD_9, N_ODD_R, N_ODD_L};
uint8_t N_EVEN_L_U[] = {N_EVEN_0, N_EVEN_1, N_EVEN_2, N_EVEN_3, N_EVEN_4, N_EVEN_5,
                        N_EVEN_6, N_EVEN_7, N_EVEN_8, N_EVEN_9, N_EVEN_R, N_EVEN_L};
                        
uint8_t LED_L_U[] = {LED_OFFSET_0, LED_OFFSET_1, LED_OFFSET_2, LED_OFFSET_3, LED_OFFSET_4, 
                    LED_OFFSET_5, LED_OFFSET_6, LED_OFFSET_7, LED_OFFSET_8, LED_OFFSET_9, 
                    LED_OFFSET_10, LED_OFFSET_11, LED_OFFSET_12, LED_OFFSET_13, LED_OFFSET_14, 
                    LED_OFFSET_15, LED_OFFSET_16, LED_OFFSET_17,LED_OFFSET_18, LED_OFFSET_19, 
                    LED_OFFSET_20, LED_OFFSET_21, LED_OFFSET_22, LED_OFFSET_23};

/* primary data storage for Shift Registers */
uint32_t sr_data[3];
uint32_t sr_data_prev[3];

/* these hold the actual numerical value that will be displayed on the tube
   -1 represents the tube being totally off; no numbers being displayed */
int8_t nixie[6] = {-1, -1, -1, -1, -1, -1};

/* LED on/off states, 1 per bit. only 1st 24 bits used */
uint32_t led_bitmap = 0;

#define LP_SIZE 5
float rpm_lp[LP_SIZE] = {-1}; 
int rpm_idx = 0;

//static CAN_message_t msg;

/*ESP8266 wifi */
#define SSID "Chateau 635"  //name of wireless access point to connect to
#define PASS "heavyonion466"  //wifi password
#define TIMEZONE "-8" //timezone relative to GMT

char string_buf[350] = {0};
boolean stringComplete = false;

/* button definitions */
int sr_pol = 21;
int sr_latch = 22;
int sr_blank = 23;
int button0 = 0;
int button1 = 1;
int button2 = 2;
int can_stby = 20;
int alt_miso = 12;
int wifi_en = 6;


/* SPI (Shift Register interface) setup */
SPISettings settingsA(100000, LSBFIRST, SPI_MODE1); 

/* software button debounce setup */
Bounce pushbutton2 = Bounce(button2, 10);  // 10 ms debounce
Bounce pushbutton1 = Bounce(button1, 10);  // 10 ms debounce
Bounce pushbutton0 = Bounce(button0, 10);  // 10 ms debounce

/* time-keeping timer setup */
//IntervalTimer myTimer;
time_t t = 1512086400; // 12/1/2017

boolean wifi_mode_on = false; 

/* hr/min/sec variables */
//volatile int hours = 12;
//volatile int minutes = 0;
//volatile int seconds = 0;
volatile int dot_blink = 0;

void setup() {
  // put your setup code here, to run once:
  sr_data[0] = 0;
  sr_data[1] = 0;
  sr_data[2] = 0;
  //sr_data_prev[0] = 1;
  //sr_data_prev[1] = 1;
  //sr_data_prev[2] = 1;

  /* set pin IO modes */
  pinMode (sr_pol, OUTPUT);
  pinMode (sr_latch, OUTPUT);
  pinMode (sr_blank, OUTPUT);
  pinMode (button0, INPUT_PULLUP);
  pinMode (button1, INPUT_PULLUP);
  pinMode (button2, INPUT_PULLUP);
  pinMode (can_stby, OUTPUT);
  pinMode(wifi_en, OUTPUT);

  /* set output pins */ 
  digitalWrite(sr_pol, HIGH);
  digitalWrite(sr_latch, HIGH);
  digitalWrite(can_stby, HIGH);  ///activation for transceiver. active LOW
  digitalWrite(sr_blank, LOW);
  delay(10);
  digitalWrite(sr_blank, HIGH);
  digitalWrite(wifi_en, LOW); //HIGH=wifi on

  /*serial init*/
  Serial2.begin(115200);    // hardware serial connects to esp8266 module
  Serial.begin(115200); // usb serial connects to to pc

  /* start SPI interface */
  SPI.begin();
  SPI.beginTransaction(settingsA);
  SPI.setMISO(alt_miso); //<--moves unused miso to pin that cannot easily be touched


  wifi_mode_on = true;  //////set into wifi mode

  load_sr(); //load zeros into SR

  startup_sequence();
  //string_buf.reserve(300);
  

  switch_timesource(wifi_mode_on);


  
}

void loop() {
  // put your main code here, to run repeatedly:
  if(!wifi_mode_on) //enable only for manual mode
  {
    if (pushbutton2.update()) {
      if (pushbutton2.fallingEdge()) {
        //hours++;
        //seconds = 0;
        //adjustTime(3600); //1 hour
        setTime(hour() + 1, minute(), second(), day(), month(), year());
        Teensy3Clock.set(now());
      }
    }
    if (pushbutton1.update()) {
      if (pushbutton1.fallingEdge()) {
        //minutes++;
        //seconds = 0;
        //adjustTime(60); //1 minute
        setTime(hour(), minute() + 1, 0, day(), month(), year());
        Teensy3Clock.set(now());
      }
    }
  }
  
  if (pushbutton0.update()) {  //switches time mode
    if (pushbutton0.fallingEdge()) {
      switch_timesource(!wifi_mode_on);
    }
  }


  /*if(seconds > 59)
    {
      minutes++;
      seconds = 0;
    }
    if(minutes > 59)
    {
      hours++;
      minutes = 0;
    }
    if(hours > 12)
    {
      hours = 1;
    }*/

  if(second() % 2 == 0) //on every 2 second, activate dots
  {
    assign_nums(-1, 10, 11, 10, 11, -1);

    place_nixie(1);
    place_nixie(2);
    place_nixie(3);
    place_nixie(4);
  }
  /*assign_nums(hours / 10, hours % 10, minutes / 10,
              minutes % 10, seconds / 10, seconds % 10);
  */

  //Serial.println(second());  
  assign_nums(hour() / 10, hour() % 10, minute() / 10,
              minute() % 10, second() / 10, second() % 10);
  if(second() == 59 && ((minute() + 1) % 10 == 0)) //display random numbers for last second to 'exercise' tubes
  {
    assign_nums(random(0, 11), random(0, 11), random(0, 11),
                random(0, 11), random(0, 11), random(0, 11));
  }
  place_nixie(0);
  place_nixie(1);
  place_nixie(2);
  place_nixie(3);
  place_nixie(4);
  place_nixie(5);
  

  load_sr();
  delay(50);
  

}
void switch_timesource(boolean on)
{
  if(on)
  {
    
    digitalWrite(wifi_en, HIGH); //HIGH=wifi on
    String cmd = "AT";
    Serial2.println(cmd);
    led_delay(1000);

    if(Serial2.find("OK"))  //message returned when connection established WEAK SPOT!! DOESN'T ALWAYS CONNECT
    {
    }
    else
    {
      Serial.println("not OK");
    }
    if(connectWiFi())  //if wifi connection was successful
    {
      connectNTP();
      setSyncProvider(getNTP);
      setSyncInterval(43200); //12 hours 
      wifi_mode_on = true;
    }
    else //default to manual
    {
      setSyncProvider(getTeensy3Time);
      setSyncInterval(43200);
      Teensy3Clock.set(t); // set the RTC
      setTime(t);
      wifi_mode_on = false;

    }
  }
  else //default to manual
  {
    digitalWrite(wifi_en, LOW); //HIGH=wifi on
    setSyncProvider(getTeensy3Time);
    setSyncInterval(43200);
    Teensy3Clock.set(t); // set the RTC
    setTime(t);
    wifi_mode_on = false;
  }
}
void startup_sequence()
{
  /* startup LED sequence */
  int loop_count = NUM_LEDS;
  led_bitmap = 1;
  while(loop_count > 0)
  {
    led_bitmap = (led_bitmap << 1) | 0x01;

    place_led();
    load_sr();

    loop_count--;

    delay(30);
  }
  while(loop_count < NUM_LEDS)
  {
    led_bitmap = led_bitmap >> 1;

    place_led();
    load_sr();

    loop_count++;

    delay(30);
  }
}
void led_delay(int ms)
{
  int subdelay = ms / 500;
  int i;
  unsigned led_pattern = 0xAAAAAAAA;
   for(i = 0; i < subdelay; i++)
   {
      led_bitmap = led_pattern;
      led_pattern = ~led_pattern;
      place_led();
      load_sr();
      delay(500);
   }
}

//map the desired display numbers to the bits in the sr_data array
void place_nixie(int nixie_num)
{
  int internumber_offset = 0;

  if(nixie[nixie_num] != -1) //if not valid number, do nothing
  {
    switch(nixie_num) 
    {
      case 0:
        internumber_offset = N_ODD_L_U[nixie[nixie_num]];
        sr_data[2] |= 0x01 << (N1_OFFSET + internumber_offset);
        break;
      case 1:
        internumber_offset = N_EVEN_L_U[nixie[nixie_num]];
        sr_data[2] |= 0x01 << (N2_OFFSET + internumber_offset);
        break;
      case 2:
        internumber_offset = N_ODD_L_U[nixie[nixie_num]];
        sr_data[1] |= 0x01 << (N3_OFFSET + internumber_offset);
        break;
      case 3:
        internumber_offset = N_EVEN_L_U[nixie[nixie_num]];
        sr_data[1] |= 0x01 << (N4_OFFSET + internumber_offset);
        break;
      case 4:
        internumber_offset = N_ODD_L_U[nixie[nixie_num]];
        sr_data[0] |= 0x01 << (N5_OFFSET + internumber_offset);
        break;
      case 5:
        internumber_offset = N_EVEN_L_U[nixie[nixie_num]];
        sr_data[0] |= 0x01 << (N6_OFFSET + internumber_offset);
        break;        
    }
  }
  
 
}
void place_led()
{
  int led = 0;
  while(led < NUM_LEDS)
  {
    //bring out the specific bit from the bitmap, AND with 1, then shift to the 
    //correct spot. finally, OR Equals with the existing master bitmap.
    //range for SR1 (sr_data[2])
    if((led >= 0 && led <= 2) || (led >= 19 && led <= 23))
    {
      sr_data[2] |= ((led_bitmap >> led) & 0x01) << LED_L_U[led];
    }
    //range for SR2 (sr_data[1])
    else if((led >= 3 && led <= 6) || (led >= 15 && led <= 18))
    {
      sr_data[1] |= ((led_bitmap >> led) & 0x01) << LED_L_U[led];
    }
    //range for SR3 (sr_data[0])
    else if((led >= 3 && led <= 14))
    {
      sr_data[0] |= ((led_bitmap >> led) & 0x01) << LED_L_U[led];
    }
    led++;
  }

  
}
//assign numbers to nixie tube. if -1, take the existing value
void assign_nums(int8_t n0,int8_t n1, int8_t n2, int8_t n3, int8_t n4, int8_t n5)
{
  nixie[0] = (n0 == -1) ? nixie[0] : n0;
  nixie[1] = (n1 == -1) ? nixie[1] : n1;
  nixie[2] = (n2 == -1) ? nixie[2] : n2;
  nixie[3] = (n3 == -1) ? nixie[3] : n3;
  nixie[4] = (n4 == -1) ? nixie[4] : n4;
  nixie[5] = (n5 == -1) ? nixie[5] : n5; 
}

float rpm_avg()
{
  float avg = 0;
  int i;
  for(i = 0; i < LP_SIZE; i++)
  {
    if(rpm_lp[i] != -1)
    {
      avg += rpm_lp[i];
    }
  }

  return avg/(float)LP_SIZE;
  
}
void clock_inc()
{
  dot_blink = ~dot_blink;
  
  if(dot_blink)
  {
    //seconds++;
  
    
  }
}
void load_sr()
{
  sr_data[0] = swap_bits(sr_data[0]);
  sr_data[1] = swap_bits(sr_data[1]);
  sr_data[2] = swap_bits(sr_data[2]);

  noInterrupts();
  digitalWrite(sr_latch, LOW);
  SPI.transfer(sr_data, TOTAL_SR_SIZE);
  digitalWrite(sr_latch, HIGH);
  interrupts();
}
time_t getTeensy3Time()
{
  return Teensy3Clock.get();
}

boolean connectWiFi()
{
  String cmd="AT+CWJAP=\"";  //form eg: AT+CWJAP="dynamode","55555555555555555555555555"
  cmd+=SSID;
  cmd+="\",\"";
  cmd+=PASS;
  cmd+="\"";
  Serial2.println(cmd);
  led_delay(5000); //give it time - my access point can be very slow sometimes
  if(Serial2.find("OK"))  //healthy response
  {
    Serial.println("Connected to WiFi...");
    return true;
  }
  else
  {
    Serial.println("Not connected to WiFi.");
    return false;
  }
}
boolean connectNTP()
{
  String cmd="AT+CIPNTP=";
  cmd+=TIMEZONE;
  Serial2.println(cmd);
  
  Serial2.readBytes(string_buf, 350);
  /*Serial.println(string_buf);
  char *test = strstr(string_buf, "sntp_process"); //find the line with the epoch
  test = test + 14; //shift to epoch
  char num[11] = {0}; //leave one extra 0 at the end for null terminator
  memcpy(num, test, 10); //copy epoch string (10 chars long)
  int epoch = atoi(num);
  Serial.println(epoch);
*/
  

}
time_t getNTP()
{
  String cmd = "AT+CIPNTP?";
  Serial2.println(cmd);
  memset(string_buf, 0, 350);
  Serial2.readBytes(string_buf, 350);
  Serial.println(string_buf);
  char *ptr = strstr(string_buf, "Time:");
  ptr = ptr + 6;
  char num[11] = {0};
  //int hours, minutes, seconds, days, months, years;
  TimeElements tm = {0};
  
  memcpy(num, ptr, 2);
  tm.Hour = atoi(num);
  memset(num, 0, 2);
  ptr+=3;
  memcpy(num, ptr, 2);
  tm.Minute = atoi(num);
  memset(num, 0, 2);
  ptr+=3;
  memcpy(num, ptr, 2);
  tm.Second = atoi(num) + 2;
  memset(num, 0, 2);
  ptr+=3;
  memcpy(num, ptr, 2);
  tm.Month = atoi(num);
  memset(num, 0, 2);
  ptr+=3;
  memcpy(num, ptr, 2);
  tm.Day = atoi(num);
  memset(num, 0, 2);
  ptr+=3;
  memcpy(num, ptr, 4);
  tm.Year = int(atoi(num) - 1970);

  time_t ntptime = 0;
  ntptime = makeTime(tm);

  if(strstr(string_buf, "OK") == 0) ///something went wrong
  {
    return 0;
  }
  else
  {
    return ntptime;
  }
  
  //Serial.println(test);
  
}
