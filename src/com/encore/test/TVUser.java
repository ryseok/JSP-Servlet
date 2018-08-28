package com.encore.test;

public class TVUser {
	public static void main(String[] args) {
		/*SamsungTV ssTV = new SamsungTV();
		ssTV.powerOn();
		ssTV.powerOff();
		ssTV.volumeUp();
		ssTV.volumeDown();*/
		
		LgTV lgTV = new LgTV();
		lgTV.turnOn();
		lgTV.turnOff();
		lgTV.soundUp();
		lgTV.soundDown();
	}
}
