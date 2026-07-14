void drawradar() {
  pulse += 0.08;
  //========================
  // Status Bar
  //========================

  noStroke();
  fill(20);
  rect(0, 0, width, 35);

  fill(0, 220, 120);
  textSize(16);

  textAlign(LEFT, CENTER);
  text("TRadarX", 10, 17);

  textAlign(CENTER, CENTER);
  text("360° Radar Scanner", width/2, 17);

  textAlign(RIGHT, CENTER);
  text("Connected : " + ports[selectedPort], width-10, 17);

  //========================
  // Radar Background
  //========================

  fill(0, 35);
  noStroke();
  rect(0, 35, width, height-35);

  //========================
  // Glow Effect
  //========================

  noStroke();

  fill(0, 255, 0, 10);
  ellipse(centerX, centerY, 560, 560);

  fill(0, 255, 0, 7);
  ellipse(centerX, centerY, 520, 520);

  fill(0, 255, 0, 5);
  ellipse(centerX, centerY, 480, 480);

  //========================
  // Radar Rings
  //========================

  stroke(0, 120, 0);
  strokeWeight(1);
  noFill();

  for (int r=500; r>=100; r-=100) {
    ellipse(centerX, centerY, r, r);
  }

  //========================
  // Degree Lines
  //========================

  stroke(0, 80, 0);

  for (int g=0; g<360; g+=15) {

    float x=centerX+scannerLength*cos(radians(g));
    float y=centerY+scannerLength*sin(radians(g));

    line(centerX, centerY, x, y);
  }

  //========================
  // Ring Labels
  //========================

  fill(0, 255, 0);
  textAlign(CENTER, CENTER);
  textSize(14);

  text("100", centerX, centerY-50);
  text("200", centerX, centerY-100);
  text("300", centerX, centerY-150);
  text("400", centerX, centerY-200);

  //========================
  // Degree Labels
  //========================

  textSize(12);

  for (int a=0; a<360; a+=45) {

    float tx=(scannerLength+25)*cos(radians(a));
    float ty=(scannerLength+25)*sin(radians(a));

    text(a+"°", centerX+tx, centerY+ty);
  }

  //========================
  // Radar Center
  //========================

  pulse+=0.08;

  float p=22+sin(pulse)*3;

  noStroke();

  fill(0, 255, 0, 40);
  ellipse(centerX, centerY, 40, 40);

  fill(0, 255, 0, 150);
  ellipse(centerX, centerY, p, p);

  fill(255);
  ellipse(centerX, centerY, 6, 6);

  //========================
  // Sweep Beam
  //========================

  for (int i=20; i>=0; i--) {

    float a=angle-radians(i);

    float x=centerX+scannerLength*cos(a);
    float y=centerY+scannerLength*sin(a);

    stroke(0, 255, 0, map(i, 20, 0, 15, 255));
    strokeWeight(map(i, 20, 0, 1, 3));

    line(centerX, centerY, x, y);
  }
  //========================
  // Targets
  //========================

  for (int a = 0; a < 360; a++) {

    if (life[a] > 0 && savedDistance[a] > 0) {

      float d = map(savedDistance[a], 0, 400, 0, scannerLength);

      float px = centerX + d * cos(radians(a));
      float py = centerY + d * sin(radians(a));

      // Glow
      noStroke();
      fill(255, 0, 0, 40);
      ellipse(px, py, 24, 24);

      // Glow
      noStroke();
      fill(255, 0, 0, 40);
      ellipse(px, py, 26, 26);

      // هدف اصلی
      fill(255, 0, 0);
      ellipse(px, py, 10, 10);
      fill(255, 0, 0, alpha[a]);
      ellipse(px, py, 10, 10);

      alpha[a] -= 3;
      life[a]--;

      if (alpha[a] < 0)
        alpha[a] = 0;
      // مرکز سفید
      fill(255);
      ellipse(px, py, 3, 3);
      // Center
      fill(255);
      ellipse(px, py, 4, 4);

      //========================
      // Crosshair
      //========================

      float w = map(savedDistance[a], 0, 400, 0, scannerLength);

      float kx = centerX + w * cos(radians(a));
      float ky = centerY + w * sin(radians(a));

      // Glow
      noStroke();
      fill(255, 0, 0, 40);
      ellipse(kx, ky, 22, 22);

      // هدف
      fill(255, 0, 0, alpha[a]);
      ellipse(kx, ky, 10, 10);

      // مرکز
      fill(255);
      ellipse(kx, ky, 3, 3);

      // محو شدن
      alpha[a] -= 2;

      if (alpha[a] < 0)
        alpha[a] = 0;
      //========================
      // Bottom Information
      //========================

      fill(0, 255, 0);

      textAlign(LEFT, TOP);

      textSize(18);

      text("Angle : " + int(degrees(angle)) + "°", 20, 45);

      text("Distance : " + distance + " cm", 20, 70);
    }
  }
}
