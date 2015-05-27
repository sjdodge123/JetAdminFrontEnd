package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jake
	 */
	public class InkDisplay extends Sprite
	{
		private var blackInk:InkBar;
		private var colorInk:ColorInk;
		private var plotterInk:PlotterInk;
		private var paddingX:int = 10;
		private var paddingY:int = 50;
		private var blackCart:String="null";
		private var cyanCart:String="null";
		private var magCart:String = "null";
		private var matteCart:String = "null";
		private var grayCart:String = "null";
		private var yellowCart:String = "null";
		private var photoCart:String="null";
		
		public function InkDisplay(x:int,y:int,color:Boolean,plotter:Boolean=false,large:Boolean=false,cartArray:Array=null) 
		{
			colorInk = new ColorInk(x - paddingX, y + paddingY);
			plotterInk = new PlotterInk(100, 25);
			if (cartArray)
			{
				blackCart = cartArray[0];
				cyanCart = cartArray[1];
				magCart = cartArray[2]; 
				yellowCart = cartArray[3];
				matteCart = cartArray[4];
				grayCart = cartArray[5];
				photoCart = cartArray[6];
			}
			if (!large)
			{
				blackInk = new InkBar(x - paddingX, y + paddingY, 0x000000);
				colorInk = new ColorInk(x - paddingX, y + paddingY);
				plotterInk = new PlotterInk(x - paddingX, y + paddingY);
			}
			else 
			{
				blackInk = new InkBar(100, 25, 0x000000, large, blackCart);
				if(color) 
				{
					colorInk = new ColorInk(100, 25, large, cyanCart, magCart, yellowCart);
				}
				if(plotter) 
				{
					blackInk = new InkBar(100, 25, 0x000000, large, photoCart);
					plotterInk = new PlotterInk(100, 25,large,matteCart,grayCart);
				}
			}
			addChild(blackInk);
			if (color) 
			{
				addChild(colorInk);
			}
			if (plotter) 
			{
				addChild(plotterInk);
			}
			
		}
		public function updateBlack(newValue:int):void
		{ 
			blackInk.adjustInk(newValue);
		}
		public function updateColor(mag:int, cyan:int, yellow:int):void
		{ 
			colorInk.adjustInk(mag, cyan, yellow);
		}
		
		public function updatePlotterColors(matteBlack:int, gray:int):void 
		{
			plotterInk.adjustInk(matteBlack, gray);
		}
		
		
		
	}

}