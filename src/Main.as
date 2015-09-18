package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.system.Worker;
	import flash.system.WorkerDomain;
	import flash.utils.ByteArray;
	
	/**
	 * ...
	 * @author 彩月葵☆彡
	 */
	public class Main extends Sprite 
	{
		[Embed(source="/../libs/BackgroundWorker.swf", mimeType="application/octet-stream")]
		private static const WORKER:Class;
		
		private var bWorker:Worker;
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			startEmbeddedWorker();
			//startExternalWorker();
		}
		
		private function startEmbeddedWorker():void 
		{
			trace('startEmbeddedWorker');
			bWorker = WorkerDomain.current.createWorker(new WORKER());
			bWorker.start();
		}
		
		private function startExternalWorker():void 
		{
			trace('startExternalWorker');
			var ul:URLLoader = new URLLoader();
			ul.dataFormat = URLLoaderDataFormat.BINARY;
			ul.addEventListener(Event.COMPLETE, createWorker);
			ul.load(new URLRequest('../libs/BackgroundWorker.swf'))
			
			function createWorker(event:Event):void 
			{
				bWorker = WorkerDomain.current.createWorker(ul.data);
				bWorker.start();
			}
		}
	}
	
}