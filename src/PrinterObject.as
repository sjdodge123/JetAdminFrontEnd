package  
{
	/**
	 * ...
	 * @author Jake
	 */
	public class PrinterObject 
	{
		public var name:String= "null";
		public var address:String= "null";
		public var inkType:String= "null";
		public var blackLevel:String= "null";
		public var blackCart:String= "null";
		public var cyanLevel:String= "null";
		public var cyanCart:String= "null";
		public var magentaLevel:String= "null";
		public var magentaCart:String= "null";
		public var yellowLevel:String= "null";
		public var grayLevel:String= "null";
		public var grayCart:String= "null";
		public var photoBlackLevel:String= "null";
		public var photoBlackCart:String= "null";
		public var matteBlackLevel:String= "null";
		public var matteBlackCart:String= "null";
		public var yellowCart:String= "null";
		public var timeStamp:String= "null";
		public var color:Boolean = false;
		public var plotter:Boolean = false;
		public var model:String = "null";
		public var flexID:String = "null";
		
		public function PrinterObject(name:String="null", address:String="null", inkType:String="null", inkLevel:String="null", timeStamp:String="null", cartType:String="null",model:String="",flexID:String="") 
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