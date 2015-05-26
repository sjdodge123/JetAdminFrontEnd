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
		private var large:Boolean;
		private var thickness:Number = 6;
		private var fontSize:int = 10;
		private var inkTextX:Number = 102.5; 
		public function InkBar(x:int,y:int,color:uint,large:Boolean=false) 
		{
			this.x = x;
			this.y = y;
			this.color = color;
			this.large = large;
			if (!large)
			{
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
			else 
			{
				bar = new Sprite();
				container = new Sprite();
				container.graphics.lineStyle(2, borderColor);
				container.graphics.drawRect(0, 0, 150, 20);
				addChild(container);
				thickness = 18.75;
				fontSize = 18;
				bar.graphics.beginFill(color);
				bar.graphics.drawRect(.5, .75, fill, 5.5);
				bar.graphics.endFill();
				addChild(bar);
			}
		}
		
		public function adjustInk(newValue:Number):void
		{
			var displayValue:Number = newValue;
			if (large) 
			{
				newValue *= 1.5;
			}
			removeChild(bar);
			bar.graphics.clear();
			bar.graphics.beginFill(color);
			bar.graphics.drawRect(.5, .85, newValue, thickness);
			bar.graphics.endFill();
			addChild(bar);
			inkDisplay(displayValue);
		}
		
		private function inkDisplay(value:int):void 
		{
			if (large)
			{
				inkTextX = 152.5;
				fontSize = 18;
			}
				var format:TextFormat = new TextFormat();
				format.size = fontSize;
				inkPercent = new TextField();
				inkPercent.x = inkTextX;
				inkPercent.y = -3;
				inkPercent.defaultTextFormat = format;
				inkPercent.text = value.toString() + "%" ;
				inkPercent.selectable = false;
				addChild(inkPercent);
			
		}
		
	}

}