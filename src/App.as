package {
import starling.display.DisplayObjectContainer;


import feathers.themes.MinimalMobileTheme;

import starling.display.Quad;
import starling.display.Sprite;
import starling.events.Event;
import starling.text.TextField;
import feathers.controls.LayoutGroup;

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
		private var _homeScreen:HomeScreen;
		private var _currentScreen:LayoutGroup;
		protected var textField:TextField;
 
		protected function addedToStageHandler( event:Event ):void
		{
			new MinimalMobileTheme();
			optionsHeight = stage.stageHeight/10;
			setBackground();
			optionsBar = new OptionsBar();
			optionsBar.init(stage, optionsHeight);
			
			_homeScreen = new HomeScreen();
			_homeScreen.init(stage);
			
			this.addChild( optionsBar );	
			
			setScreen(_homeScreen);

           

			this.addChild( optionsBar );
		}
		
		private function setScreen(screen:LayoutGroup):void
		{
			removeChild(_currentScreen);
			screen.width = stage.stageWidth;
			screen.height = stage.stageHeight - optionsHeight;
			addChild(screen);
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
