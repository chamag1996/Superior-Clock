// Clock of Death Code by Charles Magnan
// A large clock serving as reference and an alarm,
// with a built-in light dimming circuit (PWM-controlled), pedagogical day modifier, and an alarm flasher and tune.

#include <TimeAlarms.h>
#include <Time.h>
int alarmreaction = 0;   // Says when the alarm is running or not. 0 = False, 1 = True
int pedagogicalday = 0;  // Says when it's a pedagogical day. 0 = False, 1 = True
int weekend = 0;         // Says when it's the weekend. 0 = False, 1 = True
int tugnone;
int tugntwo;

void setup() {
  setTime(0, 0, 0, 1, 1, 11); // Sets the Time
  Alarm.alarmRepeat(6, 30, 0, TugOne);   // 6:30 Alarm is set
  Alarm.alarmRepeat(7, 00, 0, FinalTug);
}

void TugOne() {
  if (alarmreaction == 0) {
      alarmreaction = 1;                             // Toggles the reaction
      if (digitalRead(A0) == HIGH)                   // Checks for debug mode
      {Serial.print('6:30 Alarm Now On');}           // Sends data if it's HIGH
   }
  if (alarmreaction == 1) {
    if (digitalRead(A0) == HIGH)                     // Checks for debug mode
      {Serial.print('6:30 Alarm Already On');}       // Checks for debug mode and sends data if it's HIGH
   }
}

void FinalTug() {
  tugntwo = 1;                                       // Activates the timeout reference 
  if (alarmreaction == 0) {
      alarmreaction = 1;                             // Toggles the reaction
      if (digitalRead(A0) == HIGH)                   // Checks for debug mode
      {Serial.print('7:00 Alarm Running');}          // Sends data if it's HIGH
   }
  if (alarmreaction == 1) {                          //Checks if the alarm is already toggled
    if (digitalRead(A0) == HIGH)                     // Checks for debug mode
      {Serial.print('7:00 Alarm Already Running');}  // Sends data if it's HIGH
   }
}

void loop() {
  
}
  
  
  //12 Digital 5 Analog
  //Need 32
  
// Reference:
// http://www.arduino.cc/cgi-bin/yabb2/YaBB.pl?num=1263305457
// http://www.arduino.cc/playground/Code/Time
