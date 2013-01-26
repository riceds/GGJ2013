package events
{
	import flash.events.Event;
	
	public class ObstacleEvent extends Event
	{
		public static const HOVER_OBJECT:String = "hover_object";	
		public var sound:String;
		public var isPlaying:Boolean;
		
		public function ObstacleEvent(type:String)
		{
			super(type);
			
		}
		
		override public function clone():Event{
			return new ObstacleEvent(type);
		}
		
	}
}