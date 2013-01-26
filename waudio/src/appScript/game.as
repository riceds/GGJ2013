import flash.events.Event;
import flash.ui.Mouse;
import flash.utils.getQualifiedClassName;

import mx.core.FlexGlobals;
import mx.events.StateChangeEvent;

import objects.person;

/** 
 * Main Game Code for Waudio.
 * This file initializes all global game functions and counters.
 * All code that is to be accessed through the entirety of the app
 * will be stored and initalized here.
 * */
	
// Get the main application
private function get app():waudio{return waudio(FlexGlobals.topLevelApplication);}
private function get app_name():String{return getQualifiedClassName(app);}
var req:URLRequest = new URLRequest("/audio/jazzStreet.mp3"); 
var s:Sound = new Sound(req); 

private function init():void {
	app.addEventListener(StateChangeEvent.CURRENT_STATE_CHANGE, onStateChange);
	app.addEventListener(Event.ENTER_FRAME, trackMouse);
	s.play(0, 255, null);
	Mouse.hide();
}

private function creation_complete():void{
	
}

private function application_complete():void{
	var p:person = new person("graphics/personChair.png", "enemy", "audio/heartbeatTest.mp3");
	p.scaleX = .4;
	p.scaleY = .4;
	officePeople.addElement(p);
}

private function onStateChange(e:StateChangeEvent):void {
	
}

private function trackMouse(e:Event):void{
	trace(this.mouseX);	
	crosshair.x = this.mouseX - (crosshair.width/2);
	crosshair.y = this.mouseY - (crosshair.height/2);
}

