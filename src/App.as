package {
import blizz.serverCommLayer.models.UserDataModel;

import feathers.controls.Button;
import feathers.themes.MinimalMobileTheme;

import starling.display.Sprite;
import starling.events.Event;
import starling.text.TextField;

/**
	 * @author Bronko & @blizzd
	 */
	public class App extends Sprite
	{
		public function App()
		{
			this.addEventListener( Event.ADDED_TO_STAGE, addedToStageHandler );
		}
		
		protected var button:Button;
		protected var textField:TextField;
 
		protected function addedToStageHandler( event:Event ):void
		{
			new MinimalMobileTheme();
			this.button = new Button();
			this.button.label = "Connect to Paypal";
			this.button.addEventListener( Event.TRIGGERED, button_triggered);
            this.button.x += 100;
            this.button.y += 50;

            this.textField = new TextField(100,100,"");
            this.textField.autoScale = true;
            this.textField.text = "Hello " + UserDataModel.currentUser + " !";

            this.stage.addChild(textField);

			this.addChild( button );
		}
		
		private function button_triggered(e:Event):void
		{
			//Hookup paypal in here
		}
	}
}
