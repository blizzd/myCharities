package {
	import starling.display.Sprite;
	import starling.text.TextField;
	import feathers.controls.Button;
	import feathers.controls.Callout;
	import feathers.controls.Label;
	import feathers.themes.MinimalMobileTheme;

	import starling.events.Event;
	
	/**
	 * @author Bronko
	 */
	public class App extends Sprite
	{
		public function App()
		{
			this.addEventListener( Event.ADDED_TO_STAGE, addedToStageHandler );
		}
		
		protected var button:Button;
 
		protected function addedToStageHandler( event:Event ):void
		{
			new MinimalMobileTheme();
			this.button = new Button();
			this.button.label = "Connect to Paypal";
			this.button.addEventListener( Event.TRIGGERED, button_triggered);
			
			this.addChild( button );
		}
		
		private function button_triggered(e:Event):void
		{
			//Hookup paypal in here
		}
	}
}
