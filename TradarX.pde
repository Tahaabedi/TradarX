int state = 0;

import processing.sound.*;

SoundFile beep;

int lastBeep = 0;

int lastBeepTime = 0;

int[] life = new int[360];

String[] ports;

int selectedPort = -1;

int startTime;

import processing.serial.*;

float[] savedDistance = new float[360];

boolean[] detected = new boolean[360];

float[] alpha = new float[360];

Serial myPort;

float angle = 0;

float pulse = 0;

int distance = 0;

int centerX = 400;

int centerY = 300;

int scannerLength = 300;

void setup() {

  size(800, 600);

  beep = new SoundFile(this, "Beep.wav");

  println(Serial.list());

  //myPort = new Serial(this, "COM3", 115200);

  //myPort.bufferUntil('\n');
  ports = Serial.list();

  startTime = millis();
}

void draw() {

  if (state == 0) {
    drawSplash();
    return;
  }

  if (state == 1) {
    drawMenu();
    return;
  }

  if (state == 2) {
    drawradar();
    return;
  }
}
