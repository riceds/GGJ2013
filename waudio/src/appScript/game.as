import flash.events.Event;
import flash.ui.Mouse;
import flash.utils.getQualifiedClassName;

import mx.core.FlexGlobals;
import mx.events.StateChangeEvent;

import objects.Obstacle;
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
private var seatArray:Array = new Array(108,205,250,207,387,189,184,268,344,256,463,236,284,362,468,342,623,310,428,513,655,472,853,445);
var req:URLRequest = new URLRequest("/audio/jazzStreet.mp3"); 
var s:Sound = new Sound(req); 
var randomEnemy:int;

private function init():void {
	app.addEventListener(StateChangeEvent.CURRENT_STATE_CHANGE, onStateChange);
	app.addEventListener(Event.ENTER_FRAME, trackMouse);
	s.play(0, 255, null);
	Mouse.hide();
	
	randomEnemy = Math.floor(Math.abs(Math.random() * 12));

}

private function creation_complete():void{
	
}

private function application_complete():void{
	var o1:Obstacle = new Obstacle("graphics/cubes4.png");
	o1.depth = 1;
	o1.x = 0;
	o1.y = 0;
	o1.scaleX = .8;
	o1.scaleY = .8;
	officeObjects.addElement(o1);

	var p1:person = new person("graphics/personChair.fxg", "ally", "audio/heartbeatTest.mp3");
	p1.x = 108;
	p1.y = 205;
	p1.scaleX = .4;
	p1.scaleY = .4;
	p1.depth = 2;	
	officeObjects.addElement(p1);
	
	var p2:person = new person("graphics/personChair.fxg", "ally", "audio/heartbeatTest.mp3");
	p2.x = 250;
	p2.y = 207;
	p2.scaleX = .4;
	p2.scaleY = .4;
	p2.depth = 2;	
	officeObjects.addElement(p2);
	
	var p3:person = new person("graphics/personChair.fxg", "ally", "audio/heartbeatTest.mp3");
	p3.x = 387;
	p3.y = 189;
	p3.scaleX = .4;
	p3.scaleY = .4;
	p3.depth = 2;	
	officeObjects.addElement(p3);
	
	var o2:Obstacle = new Obstacle("graphics/cubes3.png");
	o2.x = 0;
	o2.y = 0;
	o2.depth = 3;
	o2.scaleX = .8;
	o2.scaleY = .8;
	officeObjects.addElement(o2);
	
	var p4:person = new person("graphics/personChair.fxg", "ally", "audio/heartbeatTest.mp3");
	p4.x = 184;
	p4.y = 268;
	p4.scaleX = .4;
	p4.scaleY = .4;
	p4.depth = 4;	
	officeObjects.addElement(p4);
	
	var p5:person = new person("graphics/personChair.fxg", "ally", "audio/heartbeatTest.mp3");
	p5.x = 344;
	p5.y = 256;
	p5.scaleX = .4;
	p5.scaleY = .4;
	p5.depth = 4;	
	officeObjects.addElement(p5);
	//// ALKSJDLKAJSDKJ
	
	var p6:person = new person("graphics/personChair.fxg", "ally", "audio/heartbeatTest.mp3");
	p6.x = 463;
	p6.y = 236;
	p6.scaleX = .4;
	p6.scaleY = .4;
	p6.depth = 4;	
	officeObjects.addElement(p6);
	
	var o3:Obstacle = new Obstacle("graphics/cubes2.png");
	o3.x = 0;
	o3.y = 0;
	o3.depth = 5;
	o3.scaleX = .8;
	o3.scaleY = .8;
	officeObjects.addElement(o3);
	
	var p7:person = new person("graphics/personChair.fxg", "ally", "audio/heartbeatTest.mp3");
	p7.x = 284;
	p7.y = 362;
	p7.scaleX = .4;
	p7.scaleY = .4;
	p7.depth = 6;	
	officeObjects.addElement(p7);
	
	var p8:person = new person("graphics/personChair.fxg", "ally", "audio/heartbeatTest.mp3");
	p8.x = 468;
	p8.y = 342;
	p8.scaleX = .4;
	p8.scaleY = .4;
	p8.depth = 6;	
	officeObjects.addElement(p8);
	
	var p9:person = new person("graphics/personChair.fxg", "ally", "audio/heartbeatTest.mp3");
	p9.x = 623;
	p9.y = 310;
	p9.scaleX = .4;
	p9.scaleY = .4;
	p9.depth = 6;	
	officeObjects.addElement(p9);
	
	var o4:Obstacle = new Obstacle("graphics/cubes1.png");
	o4.x = 0;
	o4.y = 0;
	o4.depth = 7;
	o4.scaleX = .8;
	o4.scaleY = .8;
	officeObjects.addElement(o4);
	
	var p10:person = new person("graphics/personChair.fxg", "ally", "audio/heartbeatTest.mp3");
	p10.x = 428;
	p10.y = 513;
	p10.scaleX = .4;
	p10.scaleY = .4;
	p10.depth = 8;	
	officeObjects.addElement(p10);
	
	var p11:person = new person("graphics/personChair.fxg", "ally", "audio/heartbeatTest.mp3");
	p11.x = 655;
	p11.y = 472;
	p11.scaleX = .4;
	p11.scaleY = .4;
	p11.depth = 8;	
	officeObjects.addElement(p11);
	
	var p12:person = new person("graphics/personChair.fxg", "ally", "audio/heartbeatTest.mp3");
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
			p = new person("graphics/personChair.fxg", "enemy", "audio/heartbeatTest.mp3");
		} 
		else {
			p = new person("graphics/personChair.fxg", "ally", "audio/heartbeatTest.mp3");
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

private function test():void{
	for(var i:Number=0; i<officeObjects.numElements; i++){
		trace(officeObjects.getElementAt(i).depth);
	}
}

private function onStateChange(e:StateChangeEvent):void {
	
}

private function trackMouse(e:Event):void{
	crosshair.x = this.mouseX - (crosshair.width/2);
	crosshair.y = this.mouseY - (crosshair.height/2);
}

