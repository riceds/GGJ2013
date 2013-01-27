package objects
{
	import flash.display.Loader;
	import flash.net.URLRequest;
	
	import mx.core.UIComponent;
	
	import spark.core.SpriteVisualElement;
	
	import graphics.cubicles06;
	import graphics.cubicles07;
	import graphics.cubicles08;
	import graphics.cubicles09;
		
	public class Obstacle extends SpriteVisualElement
	{
		var zIndex:int;
		var sound:String;
		private var image:Loader;
		private var cube1:cubicles06;
		private var cube2:cubicles07;
		private var cube3:cubicles08;
		private var cube4:cubicles09;
		
		public function Obstacle(id:String)
		{

			if(id=="1"){
				cube1=new cubicles06();
				this.addChild(cube1);
			} else if (id=="2"){
				
				cube2=new cubicles07();
				this.addChild(cube2);
			} else if (id=="3"){
				
				cube3=new cubicles08();
				this.addChild(cube3);
			} else if (id=="4"){
				
				cube4=new cubicles09();
				this.addChild(cube4);
			} else {
				image = new Loader();
				image.load(new URLRequest(id));
				this.addChild(image);
			}
			
		}	
	}
}