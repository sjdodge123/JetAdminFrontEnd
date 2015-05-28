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
		
		public function InkDisplay(x:int,y:int,color:Boolean,plotter:Boolean=false,large:Boolean=false,printObject:PrinterObject=null) 
		{
			colorInk = new ColorInk(x - paddingX, y + paddingY);
			plotterInk = new PlotterInk(100, 25);
			if (printObject == null) 
			{
				printObject = new PrinterObject();
			}
			
			if (!large)
			{
				blackInk = new InkBar(x - paddingX, y + paddingY, 0x000000);
				colorInk = new ColorInk(x - paddingX, y + paddingY);
				plotterInk = new PlotterInk(x - paddingX, y + paddingY);
			}
			else 
			{
				blackInk = new InkBar(100, 25, 0x000000, large, printObject.blackCart);
				if(color) 
				{
					colorInk = new ColorInk(100, 25, large, printObject.cyanCart, printObject.magentaCart, printObject.yellowCart);
				}
				if(plotter) 
				{
					blackInk = new InkBar(100, 25, 0x000000, large, printObject.photoBlackCart);
					plotterInk = new PlotterInk(100, 25,large,printObject.matteBlackCart,printObject.grayCart);
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