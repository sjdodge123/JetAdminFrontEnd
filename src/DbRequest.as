package  
{
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequestMethod;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	public class DbRequest extends EventDispatcher
	{
		public var loader:URLLoader;
		private var request:URLRequest;

		
		public function DbRequest(path:String) 
		{
			loader = new URLLoader();
			request = new URLRequest(path);
			request.method = URLRequestMethod.POST;
			loader.addEventListener(Event.COMPLETE, onLoadData);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onDataFailedToLoad);
			loader.addEventListener(IOErrorEvent.NETWORK_ERROR, onDataFailedToLoad);
			loader.addEventListener(IOErrorEvent.VERIFY_ERROR, onDataFailedToLoad);
			loader.addEventListener(IOErrorEvent.DISK_ERROR, onDataFailedToLoad);
			loader.load(request);
		}
		
		private function onLoadData(e:Event):void 
		{
			dispatchEvent(e);
		}
		
		private function onDataFailedToLoad(e:IOErrorEvent):void 
		{
			trace("onDataFailedToLoad:",e.text);
		}
	}
}