package {
	import Elements.HelpDropDown;
	import Elements.BraggingDropDown;
	import Elements.CharityDropDown;
	import Elements.SettingsDropDown;
	import feathers.controls.popups.DropDownPopUpContentManager;
	import feathers.core.PopUpManager;
	import feathers.controls.PickerList;
	import Screens.BragScreen;
	import Screens.HelpScreen;
	import Screens.SettingsScreen;
	import Screens.ManageCharitiesScreen;
	import Screens.ManageDonationsScreen;
	import Screens.HomeScreen;
	import flash.trace.Trace;
	import starling.display.Stage;
	import starling.display.DisplayObjectContainer;
  
	import feathers.layout.AnchorLayoutData;
	import feathers.layout.AnchorLayout;
	import feathers.layout.HorizontalLayoutData;
	import feathers.layout.HorizontalLayout;
	import feathers.controls.renderers.LayoutGroupGroupedListHeaderOrFooterRenderer;
	import feathers.controls.LayoutGroup;
	import starling.display.Sprite;
	import starling.display.Quad;
	import starling.text.TextField;
	import feathers.controls.Button;
	import feathers.controls.Callout;
	import feathers.controls.Label;
	import feathers.themes.MinimalMobileTheme;
	import feathers.layout.VerticalLayout;
	
		import starling.events.Event;
	
	/**
	 * @author Bronko
	 */
	public class OptionsBar extends LayoutGroup
	{
				private var _dropManager:DropDownPopUpContentManager;	
		
				private var _homeButton:Button;
				private var _donationButton:Button;
				private var _settingsButton:Button;
				private var _braggingButton:Button;
				private var _charityButton:Button;
				private var _helpButton:Button;
				private var _myStage:Stage;
				private var _app:App;
				
				private var _homeScreen:HomeScreen;
				private var _donationScreen:ManageDonationsScreen;
				private var _charitiesScreen:ManageCharitiesScreen;
				private var _settingsScreen:SettingsScreen;
				private var _helpScreen:HelpScreen;
				private var _bragScreen:BragScreen;
				
		public function init(application:App, optionsHeight:Number):void
		{
			_dropManager = new DropDownPopUpContentManager();
			_myStage = application.stage;
			_app = application;
			
			var layout:HorizontalLayout = new HorizontalLayout();
			width = _myStage.stageWidth;
			height = optionsHeight;
			layout.horizontalAlign = HorizontalLayout.HORIZONTAL_ALIGN_CENTER;
			layout.verticalAlign = HorizontalLayout.VERTICAL_ALIGN_MIDDLE;
			this.layout = layout;

			generateButtons();
			initScreens();
			_app.setScreen(_homeScreen);

			
		}
		
		private function initScreens():void
		{
			_homeScreen = new HomeScreen();
			_homeScreen.init(_myStage);
			_settingsScreen = new SettingsScreen();
			_settingsScreen.init(_myStage);
			_donationScreen = new ManageDonationsScreen();
			_donationScreen.init(_myStage);
			_bragScreen = new BragScreen();
			_bragScreen.init(_myStage);
			_charitiesScreen = new ManageCharitiesScreen();
			_charitiesScreen.init(_myStage);
			_helpScreen = new HelpScreen();	
			_helpScreen.init(_myStage);
		}
		
		private function generateButtons():void
		{
			_homeButton = generateHome();
			_donationButton = generateDonation();
			_charityButton = generateCharity();
			_settingsButton = generateSettings();
			_braggingButton = generateBragging();
			_helpButton = generateHelp();
		}
		
		private function generateHome():Button
		{
			var button:Button = new Button();
			button.label = "Home";
			button.name = "Home";
			button.addEventListener(Event.TRIGGERED, button_triggered);
			addChild(button);
			return button;
			
		}
		
		private function generateCharity():Button
		{
			var button:Button = new Button();
			button.label = "SCharities";
			button.name = "Char";
			button.addEventListener(Event.TRIGGERED, button_triggered);
			addChild(button);
			return button;
			
		}
		
		private function generateDonation():Button
		{
			var button:Button = new Button();
			button.label = "SDonat";
			button.name = "SDonat";
			button.addEventListener(Event.TRIGGERED, button_triggered);
			addChild(button);
			return button;
		}
		
		private function generateBragging():Button
		{
			var button:Button = new Button();
			button.label = "Brag";
			button.name = "Brag";
			button.addEventListener(Event.TRIGGERED, button_triggered);
			addChild(button);
			return button;
		}
		
		private function generateSettings():Button
		{
			var button:Button = new Button();
			button.label = "Set";
			button.name = "Set";
			button.addEventListener(Event.TRIGGERED, button_triggered);
			addChild(button);
			return button;
		}
		
		private function generateHelp():Button
		{
			var button:Button = new Button();
			button.label = "?";
			button.name = "?";
			button.addEventListener(Event.TRIGGERED, button_triggered);
			addChild(button);
			return button;
		}
		
		private function button_triggered(e:Event):void
		{
			_dropManager.close();
			var button:Button = e.target as Button;
			if (button.name == "Home")
			{
				_app.setScreen(_homeScreen);
			} 
			else if (button.name == "Brag")
			{
				popBrag();
			}
			else if (button.name == "SDonat")
			{
				popCharity();
			}
			else if (button.name == "Set")
			{
				popSettings();
			}
			else if (button.name == "?")
			{
				popHelp();
			}
			else if (button.name == "Char")
			{
				_app.setScreen(_charitiesScreen);
			}
		}
		
		private function popSettings():void
		{
			var popContent:SettingsDropDown = new SettingsDropDown(_dropManager);
			 _dropManager.open(popContent, _settingsButton);
		}
		
		private function popCharity():void
		{
			var popContent:CharityDropDown = new CharityDropDown(_dropManager);
			 _dropManager.open(popContent, _donationButton);
		}
		
		private function popBrag():void
		{
			var popContent:BraggingDropDown = new BraggingDropDown(_dropManager);
			 _dropManager.open(popContent, _braggingButton);
		}
		
		private function popHelp():void
		{
			var popContent:HelpDropDown = new HelpDropDown(_dropManager);
			 _dropManager.open(popContent, _helpButton);
		}
		
	}
}
