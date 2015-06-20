package {
import Screens.AppScreen;
import Screens.HomeScreen;
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
		private var _currentScreen:LayoutGroup;
		protected var textField:TextField;
 
		protected function addedToStageHandler( event:Event ):void
		{
			new MinimalMobileTheme();
			optionsHeight = stage.stageHeight/10;
			setBackground();
			optionsBar = new OptionsBar();
			optionsBar.init(this, optionsHeight);
	
			this.addChild( optionsBar );	
		

           

			this.addChild( optionsBar );
		}
		
		public function setScreen(screen:AppScreen):void
		{
			removeChild(_currentScreen);
			_currentScreen = screen;
			screen.width = stage.stageWidth;
			screen.height = stage.stageHeight - optionsHeight;
			screen.y = optionsHeight;
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
