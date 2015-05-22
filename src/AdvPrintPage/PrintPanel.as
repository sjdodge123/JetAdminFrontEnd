package AdvPrintPage 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jake
	 */
	public class PrintPanel extends Sprite
	{
		private var background:Sprite;
		public function PrintPanel(x:int,y:int) 
		{
			this.x = x;
			this.y = y;
			background = new Sprite();
			background.graphics.beginFill(0xfafafa)
			background.graphics.lineStyle(1, 0x696969);
			background.graphics.drawRect(0, 0, 390, 175);
			background.graphics.endFill();
			addChild(background);
		}
		
	}

}