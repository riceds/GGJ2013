package objects
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;	
	import mx.core.UIComponent;
	import spark.core.SpriteVisualElement;
	import events.PersonEvent;	
	import graphics.personChair;

	public class person extends SpriteVisualElement
	{
		public var enemy:String;
		var heartbeat:String;
		var zIndex:int;
		private var image:Loader;
		var s:Sound;
		var channel:SoundChannel;

		
		public function person(path:String, enemy:String, heartbeat:String)
		{
			//this.addChild(image);
			var j:personChair = new personChair();
			//officePeople.addElement(j);
			this.addChild(j);
			
			this.enemy = enemy;
			this.heartbeat = heartbeat;
			
			s = new Sound(new URLRequest(this.heartbeat)); 
			channel = s.play(0, 255, null);
			
			this.addEventListener(MouseEvent.CLICK, personClicked);
			this.addEventListener(MouseEvent.MOUSE_OVER, personOver);			
		}
		
		private function personClicked(Event:MouseEvent){
			dispatchEvent(new PersonEvent(PersonEvent.CLICK_PERSON, enemy));
		}
		
		private function personOver(Event:MouseEvent){
			dispatchEvent(new PersonEvent(PersonEvent.CLICK_PERSON, enemy));
		}
	}
}