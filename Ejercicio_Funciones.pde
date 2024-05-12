float a = 0.01;
float b = 0;
float c = 0;

float centroX;
float centroY;

public void setup(){
  size(800,500);
  centroX = 590;
  centroY = 250;
}

public void draw(){
  background(#092120);
  // Dibuja ejes X e Y
  stroke(255);
  strokeWeight(2);
  line(centroX, 0, centroX, height);
  line(0, centroY, width, centroY);
  
  dibujarInstrucciones();
  
  translate(centroX,centroY);
  stroke(#A9E83F);
  dibujarFuncionCuadratica();
  
}
void dibujarFuncionCuadratica() {
  for (float x = -width; x <= width; x+=0.01) {
    float y = a * pow(x, 2) + b * x + c;
    point(x, -y); 
  }
}

void dibujarInstrucciones(){
    fill(#E7E8D7);
    rect(30, 60, 350, 380);
    
    float posX = 30 + 30;
    float posY = 60 + 20;
    float aumento = 30;
  
    // Mostrar el texto alineado en el rectángulo
    textAlign(CENTER, CENTER);
    textSize(16);
    fill(0);
    text("Teclas:", 30+350/2, posY + aumento/2);
    textAlign(CORNER);  
    text("A = Alargamiento Vertical", posX , posY + aumento*2);
    text("D = Compresion Vertical", posX, posY + aumento*3); 
    text("Q = Traslacion Vertical arriba", posX, posY + aumento*4);
    text("E = Traslacion Vertical abajo", posX, posY + aumento*5); 
    text("K = Traslacion Horizontal izquierda con y = 0", posX, posY + aumento*6); 
    text("Ñ = Traslacion Horizontal derecha con y = 0", posX, posY + aumento*7); 
    text("X = Reflexion en eje X", posX, posY + aumento*8);
    text("Y = Reflexion en eje Y", posX, posY + aumento*9);
    
    textAlign(CENTER, CENTER);
    text("Funcion:", 30+350/2 , posY + aumento*10);
    textSize(20);
    
    if(c<0 && b<0){
      text("y = " + nf(a, 0, 3) + "x^2 " + nf(b, 0, 1) + "x " + nf(c, 0, 1), 30+350/2, posY + aumento*11);
    }
    else if(b<0){
      text("y = " + nf(a, 0, 3) + "x^2" + nf(b, 0, 1) + "x + " + nf(c, 0, 1), 30+350/2, posY + aumento*11);
    }
    else if(c<0){
      text("y = " + nf(a, 0, 3) + "x^2 + " + nf(b, 0, 1) + "x " + nf(c, 0, 1), 30+350/2, posY + aumento*11);
    }
    else if(b==0 && c==0){
      text("y = " + nf(a, 0, 3) + "x^2", 30+350/2, posY + aumento*11);
    }
    else if(b==0){
      text("y = " + nf(a, 0, 3) + "x^2 + " + nf(c, 0, 1), 30+350/2, posY + aumento*11);
    }
    else if(c==0){
      text("y = " + nf(a, 0, 3) + "x^2 + " + nf(b, 0, 1) + "x", 30+350/2, posY + aumento*11);
    }
    else {
      text("y = " + nf(a, 0, 3) + "x^2 + " + nf(b, 0, 1) + "x + " + nf(c, 0, 1), 30+350/2, posY + aumento*11);
    }
}

void keyPressed() {
  switch(key) {
    // Alargamiento Vertical
    case 'a':
      a += 0.01;
      break;
    // Compresion Vertical
    case 'd':
      a -= 0.01;
      break;
    // Cambio de posicion de la parabola horizontal 
    case 'w':   // Izquierda si "a" es positivo
      b += 0.1;
      break;
    // Movimiento Vertical
    case 's':  // Derecha si "a" es positivo
      b -= 0.1;
      break;
    // Traslaciones Verticales
    case 'q':
      c += 10;
      redraw();
      break;
    // Traslaciones Verticales
    case 'e':
      c -= 10;
      break;
    // Mover la función hacia la izquierda teniendo en cuenta y=0
    case 'k': 
      b += 1;
      c = b * b / (4 * a); // Ajustar para que el vértice se mantenga en y=0
      break;
    // Mover la función hacia la derecha teniendo en cuenta y=0
    case 'ñ': 
      b -= 1; 
      c = b * b / (4 * a); // Ajustar para que el vértice se mantenga en y=0
      break;
    // Refleccion de la funcion
    case 'x':   // respecto al eje x
      a *= -1;
      break;
    case 'y':   // respecto al eje y
      b *= -1;
      break;
  }
}
