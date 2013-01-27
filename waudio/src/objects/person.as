package objects
{
	import com.greensock.TweenLite;
	
	import flash.display.Loader;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundMixer;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	
	import spark.core.SpriteVisualElement;
	
	import events.PersonEvent;
	
	import graphics.personChair;

	public class Person extends SpriteVisualElement
	{
		private var enemy:String;
		private var heartbeat:String;
		private var zIndex:int;
		private var person:personChair;
		private var s:Sound;
		private var channel:SoundChannel;
		private var sTransform:SoundTransform;
		private var isHovering:Boolean;

		
		public function Person(path:String, enemy:String)
		{	
			if(path == "personChair"){
				person = new personChair();
			} else if(path == "personStandingBlack"){
				//person = new ;
			}
			
			this.addChild(person);
			this.enemy = enemy;
			
			if(enemy == "ally"){
				this.heartbeat = "audio/heartbeatMono.mp3";
			} else{
				this.heartbeat = "audio/heartbeatMono.mp3";
			}
			
			s = new Sound(new URLRequest(this.heartbeat)); 
			//Math.abs(Math.random()*s.length)
			channel = s.play(Math.random()*800, 20, sTransform);
			
			this.addEventListener(MouseEvent.CLICK, personClicked);
			this.addEventListener(MouseEvent.MOUSE_OVER, personOver);
			this.addEventListener(MouseEvent.MOUSE_OUT, personOut);
		}
		
		private function personClicked(event:MouseEvent):void{
			dispatchEvent(new PersonEvent(PersonEvent.CLICK_PERSON, enemy));
		}
		
		private function personOver(event:MouseEvent):void{
			trace("person over " );
			dispatchEvent(new PersonEvent(PersonEvent.HOVER_PERSON, enemy));
			this.filters = [new GlowFilter(0xFFFFFF,1,2,2,2,1,true)];
			TweenLite.to(channel, 2, {volume:3});
			TweenLite.to(SoundMixer, 2, {volume:.3});
			isHovering=true;
			//SoundMixer.soundTransform = new SoundTransform(.3,0);
			//channel.soundTransform = new SoundTransform(3,0);
		}
		
		private function personOut(event:MouseEvent):void {
			trace("person out" );
			this.filters = null;
			TweenLite.to(channel, .5, {volume:.4});
			TweenLite.to(SoundMixer, .5, {volume:1});
			isHovering=false;
		}
		
		/**
		 * Params : 
		 * Distance between the sprite and the mouse pointer for volume
		 * xOffset (positive for sprite being on right of mouse, neg otherwise)
		 * yOffset (positive for sprite being on top of mouse, neg otherwise)
		 */
		public function adjustVolumeAndPan(dist:Number, xOffset:int, yOffset:int):void {
			
			var vol:Number;
			var pan:Number;
			if(isHovering){
				
			} else {
				if(dist>300){
					vol = 0;
				} else {
					vol = map(dist,300,0,0,.7);
				}
				
				pan = map(xOffset,1280-this.x,this.x-1280,-1,1);
	
				channel.soundTransform = new SoundTransform(vol,pan);
			}
		}
		
		//map(value, low1, high1, low2, high2)
		private function map(v:Number, a:Number, b:Number, x:Number = 0, y:Number = 1):Number {
			return (v == a) ? x : (v - a) * (y - x) / (b - a) + x;
		}
	}
}