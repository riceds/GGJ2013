import com.greensock.TweenLite;
import com.greensock.plugins.TweenPlugin;
import com.greensock.plugins.VolumePlugin;

import flash.events.Event;
import flash.events.MouseEvent;
import flash.media.SoundTransform;
import flash.net.URLRequest;
import flash.ui.Mouse;
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

private var seatArray:Array = new Array(108,205,250,207,387,189,184,268,344,256,463,236,284,362,468,342,623,310,428,513,655,472,853,445);
private var randomEnemy:int;
private var tickPosition:Number;
private var tickLastPosition:Number;
private var s:Sound = new Sound(new URLRequest("audio/officeAudio.mp3"));
private var hoverSound:Sound = new Sound(new URLRequest("audio/ElectronicButton.mp3"));

private function init():void {
	app.addEventListener(StateChangeEvent.CURRENT_STATE_CHANGE, onStateChange);
	app.addEventListener(Event.ENTER_FRAME, trackMouse);
	app.addEventListener(PersonEvent.CLICK_PERSON, evalGoodBad);
	s.play(0, 255, new SoundTransform(.6,0));
	Mouse.hide();
	
	randomEnemy = Math.floor(Math.abs(Math.random() * 12));

}

private function creation_complete():void{
	
}

private function application_complete():void{

	var o1:Obstacle = new Obstacle("graphics/cubes4.png");
	o1.depth = 1;
	o1.x = 120;
	o1.y = 200;
	o1.scaleX = .8;
	o1.scaleY = .8;
	officeObjects.addElement(o1);

	var p1:Person = new Person("graphics/personChair.fxg", "ally", "audio/heartbeatTest.mp3");
	p1.x = 108;
	p1.y = 205;
	p1.scaleX = .4;
	p1.scaleY = .4;
	p1.depth = 2;	
	officeObjects.addElement(p1);
	
	var p2:Person = new Person("graphics/personChair.fxg", "enemy", "audio/alienHeart.mp3");
	p2.x = 250;
	p2.y = 207;
	p2.scaleX = .4;
	p2.scaleY = .4;
	p2.depth = 2;	
	officeObjects.addElement(p2);
	
	var p3:Person = new Person("graphics/personChair.fxg", "ally", "audio/heartbeatTest.mp3");
	p3.x = 387;
	p3.y = 189;
	p3.scaleX = .4;
	p3.scaleY = .4;
	p3.depth = 2;	
	officeObjects.addElement(p3);
	
	var o2:Obstacle = new Obstacle("graphics/cubes3.png");
	o2.x = 180;
	o2.y = 280;
	o2.depth = 3;
	o2.scaleX = .8;
	o2.scaleY = .8;
	officeObjects.addElement(o2);
	
	var p4:Person = new Person("graphics/personChair.fxg", "ally", "audio/heartbeatTest.mp3");
	p4.x = 184;
	p4.y = 268;
	p4.scaleX = .4;
	p4.scaleY = .4;
	p4.depth = 4;	
	officeObjects.addElement(p4);
	
	var p5:Person = new Person("graphics/personChair.fxg", "ally", "audio/heartbeatTest.mp3");
	p5.x = 344;
	p5.y = 256;
	p5.scaleX = .4;
	p5.scaleY = .4;
	p5.depth = 4;	
	officeObjects.addElement(p5);
	//// ALKSJDLKAJSDKJ
	
	var p6:Person = new Person("graphics/personChair.fxg", "ally", "audio/heartbeatTest.mp3");
	p6.x = 463;
	p6.y = 236;
	p6.scaleX = .4;
	p6.scaleY = .4;
	p6.depth = 4;	
	officeObjects.addElement(p6);
	
	var o3:Obstacle = new Obstacle("graphics/cubes2.png");
	o3.x = 200;
	o3.y = 360;
	o3.depth = 5;
	o3.scaleX = .8;
	o3.scaleY = .8;
	officeObjects.addElement(o3);
	
	var p7:Person = new Person("graphics/personChair.fxg", "ally", "audio/heartbeatTest.mp3");
	p7.x = 284;
	p7.y = 362;
	p7.scaleX = .4;
	p7.scaleY = .4;
	p7.depth = 6;	
	officeObjects.addElement(p7);
	
	var p8:Person = new Person("graphics/personChair.fxg", "ally", "audio/heartbeatTest.mp3");
	p8.x = 468;
	p8.y = 342;
	p8.scaleX = .4;
	p8.scaleY = .4;
	p8.depth = 6;	
	officeObjects.addElement(p8);
	
	var p9:Person = new Person("graphics/personChair.fxg", "ally", "audio/heartbeatTest.mp3");
	p9.x = 623;
	p9.y = 310;
	p9.scaleX = .4;
	p9.scaleY = .4;
	p9.depth = 6;	
	officeObjects.addElement(p9);
	
	var o4:Obstacle = new Obstacle("graphics/cubes1.png");
	o4.x = 240;
	o4.y = 480;
	o4.depth = 7;
	o4.scaleX = .8;
	o4.scaleY = .8;
	officeObjects.addElement(o4);
	
	var p10:Person = new Person("graphics/personChair.fxg", "ally", "audio/heartbeatTest.mp3");
	p10.x = 428;
	p10.y = 513;
	p10.scaleX = .4;
	p10.scaleY = .4;
	p10.depth = 8;	
	officeObjects.addElement(p10);
	
	var p11:Person = new Person("graphics/personChair.fxg", "ally", "audio/heartbeatTest.mp3");
	p11.x = 655;
	p11.y = 472;
	p11.scaleX = .4;
	p11.scaleY = .4;
	p11.depth = 8;	
	officeObjects.addElement(p11);
	
	var p12:Person = new Person("graphics/personChair.fxg", "ally", "audio/heartbeatTest.mp3");
	p12.x = 853;
	p12.y = 445;
	p12.scaleX = .4;
	p12.scaleY = .4;
	p12.depth = 8;	
	officeObjects.addElement(p12);
	
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
	
}

private function evalGoodBad(e:PersonEvent):void{
	trace(e.result);
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
		for ( var i:int=0;i<officeObjects.numElements;i++){
			//gets class name
			if(Class(getDefinitionByName(getQualifiedClassName(officeObjects.getElementAt(i))))==Person) {
				p = Person(officeObjects.getElementAt(i));
				p.adjustVolumeAndPan(dist(p.x+p.width/2,p.y+p.height/2,this.mouseX,this.mouseY),this.mouseX-(p.x+p.width/2),this.mouseY-(p.y+p.width/2));
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

