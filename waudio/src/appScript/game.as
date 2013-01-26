import flash.events.Event;
import flash.utils.getQualifiedClassName;

import mx.core.FlexGlobals;
import mx.events.StateChangeEvent;

/** 
 * Main Game Code for Waudio.
 * This file initializes all global game functions and counters.
 * All code that is to be accessed through the entirety of the app
 * will be stored and initalized here.
 * */
	
// Get the main application
private function get app():waudio{return waudio(FlexGlobals.topLevelApplication);}
private function get app_name():String{return getQualifiedClassName(app);}

private function init():void {
	app.addEventListener(StateChangeEvent.CURRENT_STATE_CHANGE, onStateChange);
	app.addEventListener(Event.ENTER_FRAME, trackMouse);
}

private function creation_complete():void{
	
}

private function application_complete():void{
	
	
}

private function onStateChange(e:StateChangeEvent):void {
	
}

private function trackMouse(e:Event):void{
	trace(this.mouseX);	
}

