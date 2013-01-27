package objects
{
	import flash.display.Loader;
	import flash.net.URLRequest;
	import mx.core.UIComponent;
	import spark.core.SpriteVisualElement;
		
	public class Obstacle extends SpriteVisualElement
	{
		var zIndex:int;
		var sound:String;
		private var image:Loader;
		
		public function Obstacle(path:String)
		{
			image = new Loader();
			image.load(new URLRequest(path));
			this.addChild(image);	
		}	
	}
}