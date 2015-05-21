package  
{
	/**
	 * ...
	 * @author Jake
	 */
	public class DataReader 
	{
		private var startCol:int = 0;
		private var endCol:int = 8;
		private var removeSpace:RegExp = /[\s\r\n]+/gim;
		private var printers:Vector.<PrinterObject> = new Vector.<PrinterObject>;
		public function DataReader() 
		{
			
		}
		
		public function read(fullData:String):Vector.<PrinterObject> 
		{
			var data:Array = cleanData(fullData);
			var rows:int = data.length/endCol
			for (var j:int = 0; j < rows; j++) 
			{
				var printName:String = data[startCol];
				printName = printName.replace(removeSpace, '');
				var address:String = data[startCol + 1];
				var inkType:String = data[startCol + 2];
				var inkLevel:String = data[startCol + 3];
				var timeStamp:String = data[startCol + 4];
				var model:String = data[startCol +5];
				var cartType:String = data[startCol + 6];
				var flexID:String = data[startCol + 7];
				var index:int = checkForPrinter(address);
				if (index != -1) 
				{
					printers[index].addInk(inkType, inkLevel,cartType);
				}
				else
				{
					var printObject:PrinterObject = new PrinterObject(printName, address, inkType, inkLevel, timeStamp, cartType, model,flexID);
					printers.push(printObject);
				}
				startCol = endCol;
				endCol += 8;
			}
			return printers;
		}
		
		private function cleanData(data:String):Array 
		{	
			var csvData:Array = data.split(",");
			var ogEnd:int = endCol;
			for (var i:int = 0; i < csvData.length; i++) 
			{
				if (i == (ogEnd - 1)) 
				{
					var cut:String = csvData[i];
					cut = cut.replace(removeSpace, ',');
					var curAry:Array = cut.split(",");
					var firstValue:String = curAry[0];
					var secondValue:String = curAry[1];
					csvData[i] = firstValue;
					csvData.splice(i+1, 0, secondValue);
					ogEnd += endCol;
				}
			}
			return csvData;
		}
		
		private function checkForPrinter(address:String):int
		{
			for (var i:int = 0; i < printers.length; i++) 
			{
				if (printers[i].address == address) 
				{
					return i;
				}
			}
			return -1;
		}
		
	}

}