package  
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Jake
	 */
	public class InkBar extends Sprite
	{
		private var bar:Sprite;
		private var color:uint;
		private var borderColor:uint = 0xbdbdbd;
		private var fill:int = 0;
		private var container:Sprite;
		private var inkPercent:TextField;
		public function InkBar(x:int,y:int,color:uint) 
		{
			this.x = x;
			this.y = y;
			this.color = color;
			bar = new Sprite();
			container = new Sprite();
			container.graphics.lineStyle(1, borderColor);
			container.graphics.drawRect(0, 0, 100, 7);
			addChild(container);
			bar.graphics.beginFill(color);
			bar.graphics.drawRect(.5, .75, fill, 5.5);
			bar.graphics.endFill();
			addChild(bar);
		}
		
		public function adjustInk(newValue:Number):void
		{
			removeChild(bar);
			bar.graphics.clear();
			bar.graphics.beginFill(color);
			bar.graphics.drawRect(.5, .75, newValue, 5.5);
			bar.graphics.endFill();
			addChild(bar);
			inkDisplay(newValue);
		}
		
		private function inkDisplay(value:int):void 
		{
			var format:TextFormat = new TextFormat();
			format.size = 10;
			inkPercent = new TextField();
			inkPercent.x = 102.5;
			inkPercent.y = -4.5;
			inkPercent.defaultTextFormat = format;
			inkPercent.text = value.toString() + "%" ;
			inkPercent.selectable = false;
			addChild(inkPercent);
		}
		
	}

}