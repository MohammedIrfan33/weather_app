import 'dart:io';

void main() {

  task1();
  task2();
  task3();

}


void task1(){
  print('task1 performed');
}
void task2() async{

  Duration threeSeconds =  Duration(seconds: 3);
  Future.delayed(threeSeconds,(){
    print('task2 performed');
  });
}

void task3(){
  print('task3 performed');
}