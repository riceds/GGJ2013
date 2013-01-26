package objects
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import events.PersonEvent;

	public class person extends Sprite
	{
		var enemy:String;
		var heartbeat:String;
		var zIndex:int;
		
		public function person()
		{
			this.addEventListener(MouseEvent.CLICK, personClicked);
			this.addEventListener(MouseEvent.MOUSE_OVER, personOver);
		}
		
		private function personClicked(Event:MouseEvent){
			dispatchEvent(new PersonEvent(Event, enemy));
		}
		
		private function personOver(Event:MouseEvent){
			dispatchEvent(new PersonEvent(Event, enemy));
		}
	}
}