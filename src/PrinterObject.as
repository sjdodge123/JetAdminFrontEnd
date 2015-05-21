package  
{
	/**
	 * ...
	 * @author Jake
	 */
	public class PrinterObject 
	{
		public var name:String;
		public var address:String;
		public var inkType:String;
		public var blackLevel:String;
		public var blackCart:String;
		public var cyanLevel:String;
		public var cyanCart:String;
		public var magentaLevel:String;
		public var magentaCart:String;
		public var yellowLevel:String;
		public var grayLevel:String;
		public var grayCart:String;
		public var photoBlackLevel:String;
		public var photoBlackCart:String;
		public var matteBlackLevel:String;
		public var matteBlackCart:String;
		public var yellowCart:String;
		public var timeStamp:String;
		public var color:Boolean = false;
		public var plotter:Boolean = false;
		public var model:String = "";
		public var flexID:String = "";
		
		public function PrinterObject(name:String, address:String, inkType:String, inkLevel:String, timeStamp:String, cartType:String,model:String="",flexID:String="") 
		{
			this.name = name;
			this.address = address;
			this.inkType = inkType;
			this.timeStamp = timeStamp;
			this.model = model;
			this.flexID = flexID;
			addInk(inkType, inkLevel,cartType);
		}
		
		public function addInk(color:String,level:String,cartType:String):void 
		{
			if (color == "BLACK") 
			{
				this.blackLevel = level;
				this.blackCart = cartType;
			}
			if (color == "CYAN") 
			{
				this.color = true;
				this.cyanLevel = level;
				this.cyanCart = cartType;
			}
			if (color == "MAGENTA") 
			{
				this.color = true;
				this.magentaLevel = level;
				this.magentaCart = cartType;
			}
			if (color == "YELLOW") 
			{
				this.color = true;
				this.yellowLevel = level;
				this.yellowCart = cartType;
			}
			if (color == "GRAY") 
			{
				this.color = true;
				this.plotter = true;
				this.grayLevel = level;
				this.grayCart = cartType;
			}
			if (color == "PHOTOBLACK") 
			{
				this.color = true;
				this.plotter = true;
				this.photoBlackLevel = level;
				this.photoBlackCart = cartType;
			}
			if (color == "MATTEBLACK") 
			{
				this.color = true;
				this.plotter = true;
				this.matteBlackLevel = level;
				this.matteBlackCart = cartType;
			}
		}
	}

}