 
import hypermedia.net.*;
int PORT_RX=9001; //port
String HOST_IP="192.168.0.108"; //ip address
UDP udp;
String receivedFromUDP = "";

void setup() {
  size(400,400);
  udp= new UDP(this,PORT_RX,HOST_IP);
  udp.log(true);
  udp.listen(true);
  super.start(); 
}

void draw() {
  background(0);
  text(receivedFromUDP, 50, 50);
}


void receive(byte[] data, String HOST_IP, int PORT_RX) {
  String value=new String(data);
  receivedFromUDP = value;
}
