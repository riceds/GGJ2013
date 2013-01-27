import com.greensock.TweenLite;
import com.greensock.plugins.TweenPlugin;
import com.greensock.plugins.VolumePlugin;

import flash.events.Event;
import flash.events.MouseEvent;
import flash.media.SoundChannel;
import flash.media.SoundTransform;
import flash.net.URLRequest;
import flash.ui.Mouse;
import flash.utils.Timer;
import flash.utils.getQualifiedClassName;
import flash.utils.getTimer;

import mx.core.FlexGlobals;
import mx.core.UIComponent;
import mx.events.StateChangeEvent;

import spark.core.SpriteVisualElement;

import objects.Obstacle;
import objects.Person;
TweenPlugin.activate([VolumePlugin]); //only necessary once

import events.PersonEvent;

import objects.Person;

/** 
 * Main Game Code for Waudio.
 * This file initializes all global game functions and counters.
 * All code that is to be accessed through the entirety of the app
 * will be stored and initalized here.
 * */
	
// Get the main application
private function get app():waudio{return waudio(FlexGlobals.topLevelApplication);}
private function get app_name():String{return getQualifiedClassName(app);}

private var enemyArray:Array = new Array("ally", "ally","ally", "ally","ally", "ally","ally", "ally","ally", "ally","ally", "ally");
private var randomEnemy:int;
private var tickPosition:Number;
private var tickLastPosition:Number;

private var startMessage:Sound = new Sound(new URLRequest("audio/mission.mp3"));
private var startChannel:SoundChannel;

private var s:Sound = new Sound(new URLRequest("audio/officeAudio.mp3"));
private var officeChannel:SoundChannel;

private var streetSound:Sound = new Sound(new URLRequest("audio/jazzStreet.mp3"));
private var timer:Timer;

private function init():void {
	app.addEventListener(StateChangeEvent.CURRENT_STATE_CHANGE, onStateChange);
	app.addEventListener(Event.ENTER_FRAME, trackMouse);
	app.addEventListener(PersonEvent.CLICK_PERSON, evalGoodBad);
	Mouse.hide();
	
	randomEnemy = Math.floor(Math.abs(Math.random() * 11));
	trace(app.currentState);
}

private function creation_complete():void{
	
}

private function application_complete():void{
	startChannel=startMessage.play();
}

private function initStreet():void {
	app.currentState='Street';
	timer.reset();
	timer.start();
	//SoundMixer.stopAll();
	officeChannel.stop();
	randomEnemy = Math.floor(Math.abs(Math.random() * 11));
	enemyArray[randomEnemy] = "enemy";
	
	streetSound.play(0, 255, new SoundTransform(.6,0));
	//SoundMixer.soundTransform = new SoundTransform(1,0);
	
	trace(enemyArray.length);
	for( var i:int=0 ;i<enemyArray.length;i++){
		
		var p:Person = new Person(((i+2)%3+1).toString(), enemyArray[i]);
		p.scaleX = .5;
		p.scaleY = .5;
		p.x = 200+40*i;
		p.y = 350 + (i%3)*80;
		depth = i%3 + 3;
		streetPeople.addElement(p);
	}
	
}

private function startIfEnter(e:KeyboardEvent):void {
	trace(e.keyCode);
	//keyboard
	if(e.keyCode == 45){
		
	}
}

private function initOffice(e:MouseEvent):void {
	
	startChannel.stop();
	app.currentState='Office';
	
	trace(randomEnemy);
	
	officeChannel=s.play(0, 255, new SoundTransform(.6,0));
	
	enemyArray[randomEnemy] = "enemy";
	
	var o1:Obstacle = new Obstacle("4");
	o1.depth = 1;
	o1.x = 60;
	o1.y = 190;
	o1.scaleX = .8;
	o1.scaleY = .8;
	officeObjects.addElement(o1);
	
	var p1:Person = new Person("personChair", enemyArray[0]);
	p1.x = 108;
	p1.y = 210;
	p1.scaleX = .23;
	p1.scaleY = .23;
	p1.depth = 2;	
	officeObjects.addElement(p1);
	
	var p2:Person = new Person("personChair", enemyArray[1]);
	p2.x = 250;
	p2.y = 207;
	p2.scaleX = .21;
	p2.scaleY = .21;
	p2.depth = 2;	
	officeObjects.addElement(p2);
	
	var p3:Person = new Person("personChair", enemyArray[2]);
	p3.x = 387;
	p3.y = 200;
	p3.scaleX = .19;
	p3.scaleY = .19;
	p3.depth = 2;	
	officeObjects.addElement(p3);
	
	var o2:Obstacle = new Obstacle("3");
	o2.x = 110;
	o2.y = 238;
	o2.depth = 3;
	o2.scaleX = .8;
	o2.scaleY = .8;
	officeObjects.addElement(o2);
	
	var p4:Person = new Person("personChair", enemyArray[3]);
	p4.x = 184;
	p4.y = 268;
	p4.scaleX = .26;
	p4.scaleY = .26;
	p4.depth = 4;	
	officeObjects.addElement(p4);
	
	var p5:Person = new Person("personChair", enemyArray[4]);
	p5.x = 344;
	p5.y = 256;
	p5.scaleX = .25;
	p5.scaleY = .25;
	p5.depth = 4;	
	officeObjects.addElement(p5);
	
	var p6:Person = new Person("personChair", enemyArray[5]);
	p6.x = 473;
	p6.y = 246;
	p6.scaleX = .23;
	p6.scaleY = .23;
	p6.depth = 4;	
	officeObjects.addElement(p6);
	
	var o3:Obstacle = new Obstacle("2");
	o3.x = 160;
	o3.y = 310;
	o3.depth = 5;
	o3.scaleX = .8;
	o3.scaleY = .8;
	officeObjects.addElement(o3);
	
	var p7:Person = new Person("personChair", enemyArray[6]);
	p7.x = 284;
	p7.y = 372;
	p7.scaleX = .31;
	p7.scaleY = .31;
	p7.depth = 6;	
	officeObjects.addElement(p7);
	
	var p8:Person = new Person("personChair", enemyArray[7]);
	p8.x = 468;
	p8.y = 352;
	p8.scaleX = .29;
	p8.scaleY = .29;
	p8.depth = 6;	
	officeObjects.addElement(p8);
	
	var p9:Person = new Person("personChair", enemyArray[8]);
	p9.x = 623;
	p9.y = 320;
	p9.scaleX = .27;
	p9.scaleY = .27;
	p9.depth = 6;	
	officeObjects.addElement(p9);
	
	var o4:Obstacle = new Obstacle("1");
	o4.x = 245;
	o4.y = 395;
	o4.depth = 7;
	o4.scaleX = .8;
	o4.scaleY = .8;
	officeObjects.addElement(o4);
	
	var p10:Person = new Person("personChair", enemyArray[9]);
	p10.x = 428;
	p10.y = 553;
	p10.scaleX = .4;
	p10.scaleY = .4;
	p10.depth = 8;	
	officeObjects.addElement(p10);
	
	var p11:Person = new Person("personChair", enemyArray[10]);
	p11.x = 655;
	p11.y = 512;
	p11.scaleX = .39;
	p11.scaleY = .39;
	p11.depth = 8;	
	officeObjects.addElement(p11);
	
	var p12:Person = new Person("personChair", enemyArray[11]);
	p12.x = 853;
	p12.y = 485;
	p12.scaleX = .35;
	p12.scaleY = .35;
	p12.depth = 8;	
	officeObjects.addElement(p12);
	
	// WaterCooler Dude 
	    var p13:Person = new Person("personStandingBlack", "ally"); 
	    p13.x = 865; 
	    p13.y = 230; 
	    p13.scaleX = .6; 
	    p13.scaleY = .6; 
	    officeObjects.addElement(p13); 
	     
	    //Clock 
	    var o5:Obstacle = new Obstacle("graphics/clock.png"); 
	    o5.x = 700; 
	    o5.y = 33; 
	    o5.scaleX = .6; 
	    o5.scaleY = .6; 
	    officeObjects.addElement(o5); 
	     
	    //Printer 
	    var o6:Obstacle = new Obstacle("graphics/printer.png"); 
	    o6.x = 690; 
	    o6.y = 150; 
	    o6.scaleX = .6; 
	    o6.scaleY = .6; 
	    officeObjects.addElement(o6); 
	     
	    //Cooler 
	    var o7:Obstacle = new Obstacle("graphics/watercooler.png"); 
	    o7.x = 950; 
	    o7.y = 220; 
	    o7.scaleX = .6; 
	    o7.scaleY = .6; 
	    officeObjects.addElement(o7);
	
	/**
	 for (var j:Number=1; j<=4;j++){
	 if(j == 1){
	 depth = 1;
	 } else {
	 depth = depth + 2;
	 }
	 
	 o = new Obstacle("graphics/cubes" + j + ".png");
	 o.x = 0;
	 o.y = 0;
	 o.scaleX = .8;
	 o.scaleY = .8;
	 o.depth = depth;
	 officeObjects.addElement(o);
	 trace("Office Block " + j + " has a depth of " + o.depth);
	 } 
	 
	 depth = 0;
	 
	 for (var i:Number=1; i<=12;i++){
	 if(i % 3 == 1){
	 depth = depth + 2;
	 }
	 
	 if(i == randomEnemy){
	 p = new Person("graphics/personChair.fxg", "enemy", "audio/heartbeatTest.mp3");
	 } 
	 else {
	 p = new Person("graphics/personChair.fxg", "ally", "audio/heartbeatTest.mp3");
	 }
	 
	 
	 //p.depth = 16;
	 p.x = seatArray[arrayIterator];
	 p.y = seatArray[arrayIterator + 1];
	 p.scaleX = .4;
	 p.scaleY = .4;
	 trace("Person " + i + " has a depth of " + p.depth);
	 p.depth = 0 - depth;		
	 officeObjects.addElement(p);
	 
	 arrayIterator = arrayIterator + 2;
	 }	
	 * **/
	timer = new Timer(1000, 30);
	timer.addEventListener(TimerEvent.TIMER, timerListener);
	TimerText.text = timer.repeatCount.toString();
	timer.start();
}

private function timerListener (e:TimerEvent):void{
	if((timer.repeatCount - timer.currentCount) < 10){
		TimerText.text = "0" + (timer.repeatCount - timer.currentCount).toString();
	} else{
		TimerText.text = (timer.repeatCount - timer.currentCount).toString();
	}
	
	if(timer.currentCount == 0){
		lose();
	}
}

private function lose():void{
	if(officeObjects){officeObjects.removeAllElements();}
	app.currentState='Lose';
	SoundMixer.stopAll();
}

private function win():void {
	
	for (var i:int=0;i<officeObjects.numElements;i++){
		if(Class(getDefinitionByName(getQualifiedClassName(officeObjects.getElementAt(i))))==Person) {
			TweenLite.killTweensOf(officeObjects.getElementAt(i));
			Person(officeObjects.getElementAt(i)).stopSound();
		}
	}
	if(officeObjects){officeObjects.removeAllElements();}
	//if(app.currentState=='Office'){
		//app.currentState='Street';
	//} else {
		app.currentState='Win';
	//}
}

private function evalGoodBad(e:PersonEvent):void{
	trace(e.result);
	if(e.result == "enemy"){
		win();
	} else {
		lose();
	}
}

private function onStateChange(e:StateChangeEvent):void {
	//Stop all sounds
	//close all animations
}

private function trackMouse(e:Event):void{

	//trace(this.mouseX);	
	leftPointer.x = this.mouseX - leftPointer.width -15;
	leftPointer.y = this.mouseY-leftPointer.height/2;
	rightPointer.x = this.mouseX + 15;
	rightPointer.y = this.mouseY-rightPointer.height/2;
	
	tickPosition = int((getTimer() % 1000) / 24); // this ensures consistent playback, no matter the speed of the processor
	if (tickLastPosition != tickPosition) {
		tickLastPosition = tickPosition;
		//Calculate distance between mouse and every sprite to adjust audio.
		var p:Person;
		if(officeObjects){
			for ( var i:int=0;i<officeObjects.numElements;i++){
				//gets class name
				if(Class(getDefinitionByName(getQualifiedClassName(officeObjects.getElementAt(i))))==Person) {
					p = Person(officeObjects.getElementAt(i));
					p.adjustVolumeAndPan(dist(p.x+p.width/2,p.y+p.height/2,this.mouseX,this.mouseY),this.mouseX-(p.x+p.width/2),this.mouseY-(p.y+p.width/2));
				}
			}
		}
	}
}

public function dist(pX:int,pY:int,cX:int,cY:int):Number {
	return Math.sqrt(Math.pow((pX-cX),2)+Math.pow((pY-cY),2));
}

//map(value, low1, high1, low2, high2)
public function map(v:Number, a:Number, b:Number, x:Number = 0, y:Number = 1):Number {
	return (v == a) ? x : (v - a) * (y - x) / (b - a) + x;
}

