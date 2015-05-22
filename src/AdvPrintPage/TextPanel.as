package AdvPrintPage 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Jake
	 */
	public class TextPanel extends Sprite
	{
		private var nameField:TextField;
		private var flexIDField:TextField;
		private var modelField:TextField;
		private var ipField:TextField;
		
		private var displayText:TextFormat;
		
		private var printName:String = "Hostname: ";
		private var model:String = "Model: ";
		private var flexID:String = "Flex ID: ";
		private var ipAddress:String = "IP : ";
		
		public function TextPanel(x:int, y:int, printName:String, model:String, flexID:String, ipAddress:String) 
		{
			this.x = x;
			this.y = y;
			this.printName += printName;
			this.model += model;
			this.flexID += flexID;
			this.ipAddress += ipAddress;
			displayText = new TextFormat(null, 14, null, true);
			displayName();
			displayModel();
			displayFlexID();
			displayIP();
		}
		
		private function displayModel():void 
		{
			modelField = new TextField();
			modelField.x = 0;
			modelField.y = 40;
			modelField.textColor = 0x000000;
			modelField.text = this.model;
			modelField.width = modelField.text.length * 10;
			modelField.setTextFormat(displayText);
			addChild(modelField);
		}
		private function displayName():void 
		{	
			nameField = new TextField();
			nameField.x = 0;
			nameField.y = 0;
			nameField.width = printName.length * 10;
			nameField.text = printName;
			nameField.setTextFormat(displayText);
			addChild(nameField);
		}
		private function displayFlexID():void 
		{	
			flexIDField = new TextField();
			flexIDField.x = 0;
			flexIDField.y = 60;
			flexIDField.width = flexID.length * 10;
			flexIDField.text = flexID;
			flexIDField.setTextFormat(displayText);
			addChild(flexIDField);
		}
		private function displayIP():void 
		{	
			ipField = new TextField();
			ipField.x = 0;
			ipField.y = 20;
			ipField.width = ipAddress.length * 10;
			ipField.height = 20;
			ipField.text = ipAddress;
			ipField.setTextFormat(displayText);
			addChild(ipField);
		}
		
	}

}