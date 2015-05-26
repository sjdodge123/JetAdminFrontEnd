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
		public function PrintPanel(x:int,y:int,printer:Printer) 
		{
			this.x = x;
			this.y = y;
			this.printer = printer;
			buildBackdrop();
			displayImage();
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
			printImage = printer.image;
			printImage.x = 10;
			printImage.y = 10;
			addChild(printImage);
		}
		
		
	}

}