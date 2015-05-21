package  
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.display.Sprite;
	import flash.events.IOErrorEvent;
	/**
	 * ...
	 * @author Jake
	 */
	public class ImageLoader extends Sprite
	{
		private var loader:Loader = new Loader();
		public function ImageLoader(path:String) 
		{
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loadFailed);
			loader.load(new URLRequest(path));
			addChild(loader);
		}
		
		private function loadFailed(e:IOErrorEvent):void 
		{
			dispatchEvent(e);
		}
		
	}

}