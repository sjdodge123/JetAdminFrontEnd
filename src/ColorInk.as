package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jake
	 */
	public class ColorInk extends Sprite
	{
		private var magentaInk:InkBar;
		private var cyanInk:InkBar;
		private var yellowInk:InkBar;
		
		public function ColorInk(x:int,y:int) 
		{
			this.x = x;
			this.y = y;
			magentaInk = new InkBar(0, 9, 0xcc00cc);
			cyanInk = new InkBar(0, 19, 0x00cccc);
			yellowInk = new InkBar(0, 29, 0xe5e500);
			addChild(magentaInk);
			addChild(cyanInk);
			addChild(yellowInk);
		}
		
		public function adjustInk(mag:int, cyan:int, yellow:int):void
		{
			magentaInk.adjustInk(mag);
			cyanInk.adjustInk(cyan);
			yellowInk.adjustInk(yellow);
		}
	}

}