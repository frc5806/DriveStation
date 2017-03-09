void setup() {
  Joystick.useManualSend(true);
  
  for (int i=0; i<=12; i++) {
    pinMode(i, INPUT_PULLUP);
  }

  for (int i=19; i<=23; i++) {
    pinMode(i, INPUT_PULLUP);
  }
}

byte allButtons[18];

void loop() {
  Joystick.X(analogRead(1));
  Joystick.Y(analogRead(2));
  Joystick.Z(analogRead(3));
  Joystick.Zrotate(analogRead(4));
  
  for (int i=0; i<=12; i++) {
    if (digitalRead(i)) allButtons[i] = 0;
    else allButtons[i] = 1;
    Joystick.button(i + 1, allButtons[i]);
  }

  for (int i=19; i<=23; i++) {
  	if (digitalRead(i)) allButtons[i-6] = 0;
    else allButtons[i-6] = 1;
    Joystick.button(i - 5, allButtons[i-6]);
  }

  Joystick.send_now();
 
  delay(5);
}

