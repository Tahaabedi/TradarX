void drawSplash() {

  if (state == 0) {

    background(10);

    fill(0, 255, 0);
    textAlign(CENTER, CENTER);

    textSize(48);
    text("TRadarX", width/2, 180);

    textSize(26);
    text("360° Radar Scanner", width/2, 250);

    textSize(18);
    text("Version 1.2", width/2, 290);

    textSize(16);
    text("Developed by [Taha Abedi]", width/2, 340);

    if (millis() - startTime > 2000) {
      state = 1;
    }

    return;
  }
}
void drawMenu() {

  if (state == 1) {

    background(15);

    fill(0, 255, 0);

    textAlign(CENTER, CENTER);

    textSize(40);
    text("‌TRadarX", width/2, 70);

    textSize(24);
    text("Select Arduino Port", width/2, 120);

    for (int i=0; i<ports.length; i++) {

      int x=250;
      int y=180+i*60;
      int w=300;
      int h=45;

      if (selectedPort==i)
        fill(0, 180, 0);
      else
        fill(40);

      stroke(0, 255, 0);
      rect(x, y, w, h, 10);

      fill(255);
      textSize(20);
      text(ports[i], width/2, y+22);
    }

    // دکمه CONNECT
    int bx = 300;
    int by = 500;
    int bw = 200;
    int bh = 50;

    fill(0, 120, 0);
    stroke(0, 255, 0);
    rect(bx, by, bw, bh, 10);

    fill(255);
    textSize(22);
    text("CONNECT", width/2, by + bh/2);

    return;
  }
}
