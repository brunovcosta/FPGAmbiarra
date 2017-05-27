void setup(){
  pinMode(16, INPUT);
  pinMode(5, INPUT);
  pinMode(4, INPUT);
  pinMode(0, INPUT);
  
  Serial.begin(115200);
}

int getNumber(){
  char digit[4] = {0,4,5,16};
  int sum = 0;
  int pot = 1;
  for(int t=0;t<4;t++){
    sum+=digitalRead(digit[t])*pot;
    pot*=2;
  }
  return sum;
}

void loop(){
  Serial.println(getNumber());
  
  delay(1000);
}
