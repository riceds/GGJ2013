import com.greensock.TweenLite;
import com.greensock.plugins.TweenPlugin;
import com.greensock.plugins.VolumePlugin;

import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
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

private var tickPosition:Number;
private var tickLastPosition:Number;

private var startMessage:Sound = new Sound(new URLRequest("audio/mission.mp3"));
private var startChannel:SoundChannel;

private var streetSound:Sound = new Sound(new URLRequest("audio/jazzStreet.mp3"));
private var timer:Timer;

private function init():void {
	app.addEventListener(StateChangeEvent.CURRENT_STATE_CHANGE, onStateChange);
	app.addEventListener(Event.ENTER_FRAME, trackMouse);
	app.addEventListener(PersonEvent.CLICK_PERSON, evalGoodBad);
	Mouse.hide();
	
	//randomEnemy = Math.floor(Math.abs(Math.random() * 11));
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
	/*//SoundMixer.stopAll();
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
	}*/
	
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
	
	//initialize component "constructor"
	officeLevel.initOffice();
	
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
	
	if(timer.repeatCount - timer.currentCount == 0){
		lose();
	}
}

private function lose():void{
	timer.stop();
	app.currentState='Lose';
	SoundMixer.stopAll();
}

private function win():void {
	
	timer.stop();
	app.currentState='Win';
	SoundMixer.stopAll();
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

}

/** Calls the clear methods for any particular level that can be visited */
private function clearLevel(level:String):void {
	if(level == "office"){
		if(officeLevel){officeLevel.clearOffice();}
	}
}

private function trackMouse(e:Event):void{

	//trace(this.mouseX);	
	leftPointer.x = this.mouseX - leftPointer.width -15;
	leftPointer.y = this.mouseY-leftPointer.height/2;
	rightPointer.x = this.mouseX + 15;
	rightPointer.y = this.mouseY-rightPointer.height/2;
	
	if(officeLevel){officeLevel.updateAudio(this.mouseX,this.mouseY);}
	
	tickPosition = int((getTimer() % 1000) / 24); // this ensures consistent playback, no matter the speed of the processor
	if (tickLastPosition != tickPosition) {
		tickLastPosition = tickPosition;
		
	}
}

public function dist(pX:int,pY:int,cX:int,cY:int):Number {
	return Math.sqrt(Math.pow((pX-cX),2)+Math.pow((pY-cY),2));
}

//map(value, low1, high1, low2, high2)
public function map(v:Number, a:Number, b:Number, x:Number = 0, y:Number = 1):Number {
	return (v == a) ? x : (v - a) * (y - x) / (b - a) + x;
}

