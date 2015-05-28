package  
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Jake
	 */
	public class PrintPage extends Sprite
	{
		private var table:PrinterTable;
		private var dataBase:DbRequest;
		private var dataReader:DataReader;
		private const color:Boolean = true;
		private var blackOnly:Boolean = false;
		private var printers:Vector.<PrinterObject>;
		private var pageStage:Stage;
		private var currentAdvPage:AdvPrintPage;
		
		public function PrintPage(stage:Stage) 
		{
			currentAdvPage = new AdvPrintPage(0, 0, new Printer(0, 0, new PrinterObject()));
			this.pageStage = stage;
			dataBase = new DbRequest("PrinterAssets/output.csv");
			dataBase.addEventListener(Event.COMPLETE, onLoadData);
			dataReader = new DataReader();
			table = new PrinterTable(stage, 1366, 760);
			table.addEventListener(AddEvent.PAGE_ADD, addToPage, true);
			table.addEventListener(AddEvent.PAGE_REMOVE, removeFromPage,true);
			addChild(table);
		}
		
		private function onLoadData(e:Event):void 
		{
			printers = dataReader.read(e.target.loader.data as String);
			populateTable();
		}
		
		private function populateTable():void
		{
			for (var i:int = 0; i < printers.length; i++) 
			{
				table.buildPrinter(printers[i]);
			}
		}
		
		private function addToPage(e:AddEvent):void 
		{
			if (contains(currentAdvPage)) 
			{
				removeChild(currentAdvPage);
			}
			currentAdvPage = e.params as AdvPrintPage;
			if (currentAdvPage.x + currentAdvPage.boxWidth +50 > pageStage.width) 
			{
				currentAdvPage.x -= currentAdvPage.boxWidth -55;
			}
			if (currentAdvPage.y - currentAdvPage.boxHeight < pageStage.y) 
			{
				currentAdvPage.y += 50;
			}
			if (currentAdvPage.x < pageStage.x) 
			{
				currentAdvPage.x += 50;
			}
			addChild(currentAdvPage);
		}
		
		private function removeFromPage(e:AddEvent):void 
		{
			removeChild(currentAdvPage);
		}
		
	}

}