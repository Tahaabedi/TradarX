
void mousePressed() {

  if (state == 1) {

    // انتخاب پورت
    for (int i = 0; i < ports.length; i++) {

      int x = 250;
      int y = 180 + i * 60;
      int w = 300;
      int h = 45;

      if (mouseX > x && mouseX < x + w &&
        mouseY > y && mouseY < y + h) {

        selectedPort = i;
      }
    }

    // دکمه CONNECT
    if (selectedPort != -1 &&
      mouseX > 300 && mouseX < 500 &&
      mouseY > 500 && mouseY < 550) {

      myPort = new Serial(this, ports[selectedPort], 115200);
      myPort.bufferUntil('\n');

      state = 2;
    }
  }
}
