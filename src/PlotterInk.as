package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jake
	 */
	public class PlotterInk extends Sprite
	{
		private var matteInk:InkBar;
		private var grayInk:InkBar;
		
		public function PlotterInk(x:int,y:int,large:Boolean=false) 
		{
			this.x = x;
			this.y = y;
			if (!large)
			{
				matteInk = new InkBar(0, 39, 0x2b2b2b);
				grayInk = new InkBar(0, 49, 0x898989);
			}
			else 
			{
				matteInk = new InkBar(0, 80, 0x2b2b2b,true);
				grayInk = new InkBar(0, 100, 0x898989,true);
			}
			addChild(matteInk);
			addChild(grayInk);
		}
		
		public function adjustInk(matteBlack:int, gray:int):void 
		{
			matteInk.adjustInk(matteBlack);
			grayInk.adjustInk(gray);
		}
		
	}

}