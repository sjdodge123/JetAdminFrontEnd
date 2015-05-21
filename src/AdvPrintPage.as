package  
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Jake
	 */
	public class AdvPrintPage extends Sprite
	{
		private var objectBorder:Sprite;
		private var printName:String;
		private var nameField:TextField;
		private var flexIDField:TextField;
		private var modelField:TextField;
		private var exitBox:Sprite;
		private var exitField:TextField;
		public var boxWidth:int = 400;
		public var boxHeight:int = 300;
		public var year:String;
		public var month:String;
		public var day:String;
		public var hour:String;
		public var minute:String;
		public var model:String;
		public var flexID:String = "FLEX ID: ";
		
		public function AdvPrintPage(x:int,y:int,name:String="null",model:String="null",flexID:String="null") 
		{
			this.x = x;
			this.y = y;
			this.printName = name;
			this.model = model;
			this.flexID += flexID;
			exitBox = new Sprite();
			buildBorder();
			displayName();
			displayExit();
			displayModel();
			displayFlexID();
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
		
		private function displayModel():void 
		{
			modelField = new TextField();
			modelField.x = 110;
			modelField.y = 10;
			modelField.textColor =0x000000;
			modelField.text = this.model;
			modelField.width = modelField.text.length * 10;
			addChild(modelField);
		}
		
		private function displayName():void 
		{	
			nameField = new TextField();
			nameField.x = 10;
			nameField.y = 10;
			nameField.width = printName.length * 10;
			nameField.text = printName;
			addChild(nameField);
		}
		
		private function displayFlexID():void 
		{	
			flexIDField = new TextField();
			flexIDField.x = 10;
			flexIDField.y = 30;
			flexIDField.width = flexID.length * 10;
			flexIDField.text = flexID;
			addChild(flexIDField);
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