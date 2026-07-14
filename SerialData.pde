void serialEvent(Serial p) {

  String data = trim(p.readStringUntil('\n'));

  if (data != null) {

    String[] values = split(data, ',');

    if (values.length == 2) {

      angle = radians(float(values[0]));

      distance = int(values[1]);

      savedDistance[int(degrees(angle))] = distance;

      int a = int(degrees(angle));

      savedDistance[a] = distance;

      alpha[a] = 255;

      if (distance > 0 && distance < 400) {

        if (millis() - lastBeep > 250) {

          beep.play();
          lastBeep = millis();
        }
      }
      life[a] = 120;
    }
  }
}
