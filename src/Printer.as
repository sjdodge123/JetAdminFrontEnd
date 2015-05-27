package  
{
	import flash.automation.MouseAutomationAction;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Jake
	 */
	public class Printer extends Sprite
	{
		private const threshold:int = 10;
		public var warningDisplayed:Boolean = false;
		public var inkDisplay:InkDisplay;
		private var objectBorder:Sprite;
		private var printerName:String = "NO_DATA";
		private var nameField:TextField;
		private var warningField:TextField;
		private var dateField:TextField;
		public var blockWidth:Number = 194;
		public var blockHeight :Number = 0;
		public var borderHeight:int = 100;
		public var color:Boolean;
		public var image:ImageSelector;
		public var icon:ImageSelector;
		public var redIcon:ImageSelector;
		public var date:String;
		public var advPrint:AdvPrintPage;
		protected var year:String;
		protected var month:String;
		protected var day:String;
		protected var hour:String;
		protected var minute:String;
		public var model:String;
		public var flexID:String;
		public var ipAddress:String;
		public var redTimeout:Timer;
		public var plotter:Boolean;
		public var currentBlack:int;
		public var currentMag:int;
		public var currentCyan:int;
		public var currentYellow:int;
		public var currentGrey:int;
		public var matteBlack:int;
		public var photoBlack:int;
		public var magCart:String;
		public var cyanCart:String;
		public var yellowCart:String;
		public var blackCart:String;
		public var matteCart:String;
		public var grayCart:String;
		public var cartArray:Array;
		
		public function Printer(name:String,x:int, y:int,currentBlack:int,color:Boolean=false,currentMag:int=0,currentCyan:int=0,currentYellow:int=0,date:String = "", plotter:Boolean=false,photoBlack:int=0,matteBlack:int=0,gray:int=0,model:String="",flexID:String="",ipAddress:String="null",blackCart:String="null",cyanCart:String="null",magCart:String="null",yellowCart:String="null",photoCart:String='null',grayCart:String='null',matteCart:String='null') 
		{
			this.x = x;
			this.y = y;
			this.color = color;
			this.date = date;
			this.useHandCursor = true;
			this.model = model;
			this.flexID = flexID;
			this.ipAddress = ipAddress;
			this.plotter = plotter;
			this.currentBlack = currentBlack;
			this.currentCyan = currentCyan;
			this.currentMag = currentMag;
			this.currentYellow = currentYellow;
			this.currentGrey = gray;
			this.matteBlack = matteBlack;
			this.photoBlack = photoBlack;
			this.magCart = magCart;
			this.cyanCart = cyanCart;
			this.yellowCart = yellowCart;
			cartArray = new Array(blackCart, cyanCart, magCart, yellowCart,matteCart,grayCart,photoCart);
			image = new ImageSelector(x,y);
			image.findImage(model);
			inkDisplay = new InkDisplay((x + blockWidth / 2) - 27.5, y - 15,color,plotter);
			redTimeout = new Timer(300);
			if (name != null) 
			{
				printerName = name;
			}
			buildBorder(blockWidth);
			displayName();
			if (!plotter) 
			{
				inkDisplay.updateBlack(currentBlack);
				inkDisplay.updateColor(currentMag, currentCyan, currentYellow);
				checkThreshold(color, currentBlack, currentCyan, currentMag, currentYellow);
				displayDate();
			}
			else 
			{
				this.currentBlack = photoBlack;
				inkDisplay = new InkDisplay((x + blockWidth / 2)-27.5, y-15, color,plotter);
				inkDisplay.updateBlack(photoBlack);
				inkDisplay.updateColor(currentMag, currentCyan, currentYellow);
				inkDisplay.updatePlotterColors(matteBlack,gray);
			}
			addChild(inkDisplay);
			addChild(image);
			buildButton();
		}
		public function move(newX:int,newY:int):void 
		{
			while (numChildren > 0) 
			{
				removeChildAt(0);
			}
			this.x = newX;
			this.y = newY;
			inkDisplay = new InkDisplay(x + blockWidth / 2, y, color,plotter);
			addChild(inkDisplay);
			displayName();
			buildBorder(blockWidth);
			
		}
		
		public function buildButton():void 
		{
			icon = new ImageSelector(x,y-32.5);
			icon.findImage("infoIcon");
			icon.addEventListener(MouseEvent.ROLL_OVER, mouseOver);
			redIcon = new ImageSelector(x, y - 32.5);
			redIcon.findImage("infoIcon");
			redIcon.alpha = .5
			redIcon.addEventListener(MouseEvent.ROLL_OUT, mouseOut);
			redIcon.addEventListener(MouseEvent.CLICK, mouseClicked);
			addChild(icon);
		}
		
		public function buildBorder(width:Number):void 
		{
			objectBorder = new Sprite();
			objectBorder.useHandCursor = true;
			objectBorder.graphics.lineStyle(1, 0x696969);
			objectBorder.graphics.beginFill(0xFFFFFF);
			objectBorder.graphics.drawRect(x, y, blockWidth, borderHeight);
			objectBorder.graphics.endFill();
			objectBorder.addEventListener(MouseEvent.MOUSE_OUT, mouseOut);
			addChildAt(objectBorder,0);
		}
		
		public function displayName():void 
		{
			nameField = new TextField();
			nameField.x = x + 40;
			nameField.y = y + 10;
			nameField.width = printerName.length * 10;
			nameField.text = printerName;
			addChild(nameField);
		}
		
		private function displayWarning():void 
		{
			warningDisplayed = true;
			warningField = new TextField();
			warningField.x = x + 140;
			warningField.y = y + 10;
			warningField.textColor =0xFF0000;
			warningField.text = "Warning!";
			warningField.selectable = false;
			addChild(warningField);
		}

		private function displayDate():void 
		{
			var format:TextFormat = new TextFormat();
			format.size = 10;
			format.bold = true;
			dateField = new TextField();
			if (color) 
			{
				dateField.x = x+57.5;
				dateField.y = y + 70;
			}
			else 
			{
				dateField.x = x+57.5;
				dateField.y = y + 45;
			}
			dateField.selectable = false;
			dateField.textColor = 0x000000;
			dateField.defaultTextFormat = format;
			year = date.substring(0, 4);
			month = date.substring(5, 7);
			day = date.substring(8, 10);
			var time:String = date.substring(10);
			hour = time.substring(1, 3);
			minute = time.substring(4, 6);
			dateField.text = "Last Collection Date \n" + month + "/" + day + "/" + year;
			dateField.width = dateField.text.length * 10;
			addChild(dateField);
		}
		private function checkThreshold(color:Boolean, currentBlack:int, currentCyan:int, currentMag:int, currentYellow:int):void
		{
			if (currentBlack <= threshold && currentBlack > 0) 
			{
				displayWarning();
			}
			if (color) 
			{
				if (currentMag <= threshold && currentMag > 0) 
				{
					displayWarning();
				}
				if (currentCyan <= threshold && currentCyan > 0) 
				{
					displayWarning();
				}
				if (currentYellow <= threshold && currentYellow > 0) 
				{
					displayWarning();
				}
			}	
		}
		public function mouseOver(e:Event):void 
		{
			if (contains(objectBorder)) 
			{
				icon.removeEventListener(MouseEvent.ROLL_OVER, mouseOver);
				addChild(redIcon);
				removeChild(icon);
			}
		}
		private function mouseOut(e:Event):void 
		{
			if (contains(redIcon)) 
			{
				redIcon.removeEventListener(MouseEvent.ROLL_OUT, mouseOver);
				removeChild(redIcon);
				buildButton();
			}
		}
		
		private function mouseClicked(e:MouseEvent):void 
		{
			advPrint = new AdvPrintPage(e.stageX - 50, e.stageY - 50,this, this.printerName,this.model,this.flexID,this.ipAddress);
			advPrint.year = year;
			advPrint.day = day;
			advPrint.month = month;
			advPrint.hour = hour;
			advPrint.minute = minute;
			redIcon.removeEventListener(MouseEvent.ROLL_OUT, mouseOut);
			redIcon.removeEventListener(MouseEvent.ROLL_OVER, mouseOver);
			removeChild(redIcon);
			buildButton();
			advPrint.addEventListener(AddEvent.PAGE_REMOVE, relay);
			dispatchEvent(new AddEvent(AddEvent.PAGE_ADD, false, advPrint));
			
		}
		
		private function relay(e:AddEvent):void 
		{
			dispatchEvent(new AddEvent(AddEvent.PAGE_REMOVE, false, advPrint));
		}
		
	}

}