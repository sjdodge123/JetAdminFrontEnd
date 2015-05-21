package  
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Jake
	 */
	public class AddEvent extends Event 
	{
		// Event types.
		public static const PAGE_ADD:String = "addPage";
		public static const PAGE_REMOVE:String = "removePage";
		public var params:Object;
		public function AddEvent(type:String, bubbles:Boolean = false,params:Object = null, cancelable:Boolean = false) 
		{
			this.params = params;
			super(type, bubbles, cancelable);
		}
 
		override public function clone():Event {
			return new AddEvent(type, bubbles, cancelable);
		}
	}

}