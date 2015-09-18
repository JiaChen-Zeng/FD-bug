package 
{
	import flash.display.Sprite;
	
	/**
	 * @mxmlc -debug -noplay -output libs/BackgroundWorker.swf
	 * @author 彩月葵☆彡
	 */
	public class BackgroundWorker extends Sprite 
	{
		public function BackgroundWorker() 
		{
			try 
			{
				throw new Error('will stop here');
			}
			catch (err:Error)
			{
				trace('also be excuted');
			}
		}
	}
}