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
		private var printer:Printer;
		private var printImage:ImageSelector;
		private var inkDisplay:InkDisplay;
		
		public function PrintPanel(x:int,y:int,printer:Printer) 
		{
			this.x = x;
			this.y = y;
			this.printer = printer;
			buildBackdrop();
			displayImage();
			displayInkbars();
		}
		private function buildBackdrop():void 
		{
			background = new Sprite();
			background.graphics.beginFill(0xfafafa)
			background.graphics.lineStyle(1, 0x696969);
			background.graphics.drawRect(0, 0, 390, 175);
			background.graphics.endFill();
			addChild(background);
		}
		private function displayImage():void 
		{
			printImage = new ImageSelector(10, 10);
			printImage.findImage(printer.model);
			addChild(printImage);
		}
		private function displayInkbars():void 
		{
			inkDisplay = new InkDisplay(150, 15, printer.color, printer.plotter, true);
			inkDisplay.updateBlack(printer.currentBlack);
			inkDisplay.updateColor(printer.currentMag, printer.currentCyan, printer.currentYellow);
			inkDisplay.updatePlotterColors(printer.matteBlack, printer.currentGrey);
			addChild(inkDisplay);
		}
		
		
	}

}