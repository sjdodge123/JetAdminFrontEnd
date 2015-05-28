package  
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import AdvPrintPage.TextPanel;
	import AdvPrintPage.PrintPanel;
	/**
	 * ...
	 * @author Jake
	 */
	public class AdvPrintPage extends Sprite
	{
		private var objectBorder:Sprite;
		private var exitBox:Sprite;
		private var exitField:TextField;
		private var textPanel:TextPanel;
		private var printPanel:PrintPanel;
		
		public var boxWidth:int = 400;
		public var boxHeight:int = 300;
		public var year:String;
		public var month:String;
		public var day:String;
		public var hour:String;
		public var minute:String;
		private var printer:Printer;
		
	
		public function AdvPrintPage(x:int,y:int,printer:Printer) 
		{
			this.x = x;
			this.y = y;
			this.printer = printer;
			textPanel = new TextPanel(30, 5, printer.name, printer.model, printer.flexID, printer.ipAddress,printer.warningDisplayed);
			printPanel = new PrintPanel(5, 110,printer);		
			exitBox = new Sprite();
			buildBorder();
			displayExit();
			addChild(textPanel);
			addChild(printPanel);
		}
		public function buildBorder():void 
		{
			objectBorder = new Sprite();
			objectBorder.useHandCursor = true;
			objectBorder.graphics.lineStyle(3, 0x696969);
			objectBorder.graphics.beginFill(0xFFFFFF);
			objectBorder.graphics.drawRoundRect(0, 0, boxWidth, boxHeight, 50, 50);
			objectBorder.graphics.endFill();
			addChild(objectBorder);
		}
		private function displayExit():void 
		{
			if (contains(exitBox)) 
			{
				removeChild(exitBox);
			}
			exitBox = new Sprite();
			exitBox.graphics.lineStyle(.5, 0x696969);
			exitBox.graphics.drawRect(boxWidth - 31.5, 11, 15, 15);
			exitBox.useHandCursor = true;
			exitBox.buttonMode = true;
			exitBox.addEventListener(MouseEvent.MOUSE_OVER, mouseOver);
			addChild(exitBox);
			exitField = new TextField();
			exitField.x = boxWidth - 30;
			exitField.y = 10;
			exitField.width = 12;
			exitField.height = 20;
			exitField.selectable = false;
			exitField.text = "X";
			exitBox.addChild(exitField);
		}
		
		private function exitClicked(e:MouseEvent):void 
		{
			dispatchEvent(new AddEvent(AddEvent.PAGE_REMOVE, false, this));
		}
		private function mouseOver(e:MouseEvent):void 
		{
			exitBox.removeEventListener(MouseEvent.MOUSE_OVER, mouseOver);
			removeChild(exitBox);
			exitBox = new Sprite();
			exitBox.graphics.lineStyle(.5, 0x696969);
			exitBox.graphics.beginFill(0xff9999);
			exitBox.graphics.drawRect(boxWidth - 31.5, 11, 15, 15);
			exitBox.useHandCursor = true;
			exitBox.graphics.endFill();
			exitBox.addEventListener(MouseEvent.CLICK, exitClicked);
			exitBox.addEventListener(MouseEvent.MOUSE_OUT, mouseOut);
			addChild(exitBox);
			exitField = new TextField();
			exitField.x = boxWidth-30;
			exitField.y = 10;
			exitField.width = 12;
			exitField.height = 20;
			exitField.selectable = false;
			exitField.text = "X";
			exitBox.addChild(exitField);
		}
		private function mouseOut(e:MouseEvent):void 
		{
			exitBox.removeEventListener(MouseEvent.CLICK, exitClicked);
			exitBox.removeEventListener(MouseEvent.MOUSE_OUT, mouseOut);
			displayExit();
		}		
	}

}