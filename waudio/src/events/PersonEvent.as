package events
{
	import flash.events.Event;
	
	public class PersonEvent extends Event
	{
		public static const CLICK_PERSON:String = "click_person";	
		public var result:String;
		
		public function PersonEvent(type:String, result:String)
		{
			super(type);
			this.result = result;
		}
		
		override public function clone():Event{
			return new PersonEvent(type, result);
		}
		
	}
}