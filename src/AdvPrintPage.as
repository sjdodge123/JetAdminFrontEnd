package  
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import AdvPrintPage.TextPanel;
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
		
		public var boxWidth:int = 400;
		public var boxHeight:int = 300;
		public var year:String;
		public var month:String;
		public var day:String;
		public var hour:String;
		public var minute:String;
		
	
		public function AdvPrintPage(x:int,y:int,name:String="null",model:String="null",flexID:String="null",ipAddress:String="null") 
		{
			this.x = x;
			this.y = y;
			textPanel = new TextPanel(30,5,name, model, flexID, ipAddress);
			exitBox = new Sprite();
			buildBorder();
			addChild(textPanel);
			displayExit();
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
			exitField.x = boxWidth-30;
			exitField.y = 10;
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