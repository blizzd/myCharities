package {
import blizz.serverCommLayer.models.UserDataModel;

import feathers.themes.MinimalMobileTheme;

import starling.display.Quad;
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
		

		private var optionsHeight:Number;
		private var optionsBar:OptionsBar;
		protected var textField:TextField;
 
		protected function addedToStageHandler( event:Event ):void
		{
			new MinimalMobileTheme();
			optionsHeight = stage.stageHeight/10;
			setBackground();
			optionsBar = new OptionsBar();
			optionsBar.init(stage, optionsHeight);
			
			this.addChild( optionsBar );	
			//addChild(container);

            this.textField = new TextField(100,100,"");
            this.textField.autoScale = true;
            this.textField.text = "Hello " + UserDataModel.currentUser + " !";

            this.stage.addChild(textField);

			this.addChild( optionsBar );
		}
		
		private function setBackground():void
		{
			var quad:Quad = new Quad( stage.stageWidth, optionsHeight, 0x7eff8c );
			var quad2:Quad = new Quad( stage.stageWidth, stage.stageHeight - optionsHeight, 0xc0c0c0 );
			quad2.y = optionsHeight;
   			addChild( quad );
			addChild( quad2 );
		}
		
		
	}
}
