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
				private var _helpButton:Button;
				private var _myStage:Stage;
				
				public var app:App;
				
				public var homeScreen:HomeScreen;
				public var donationScreen:ManageDonationsScreen;
				public var charitiesScreen:ManageCharitiesScreen;
				public var settingsScreen:SettingsScreen;
				public var helpScreen:HelpScreen;
				public var bragScreen:BragScreen;
				
		public function init(application:App, optionsHeight:Number):void
		{
			_dropManager = new DropDownPopUpContentManager();
			_myStage = application.stage;
			app = application;
			
			var layout:HorizontalLayout = new HorizontalLayout();
			width = _myStage.stageWidth;
			height = optionsHeight;
			layout.horizontalAlign = HorizontalLayout.HORIZONTAL_ALIGN_CENTER;
			layout.verticalAlign = HorizontalLayout.VERTICAL_ALIGN_MIDDLE;
			this.layout = layout;

			generateButtons();
			initScreens();
			app.setScreen(homeScreen);

			
		}
		
		private function initScreens():void
		{
			homeScreen = new HomeScreen();
			homeScreen.init(_myStage);
			settingsScreen = new SettingsScreen();
			settingsScreen.init(_myStage);
			donationScreen = new ManageDonationsScreen();
			donationScreen.init(_myStage);
			bragScreen = new BragScreen();
			bragScreen.init(_myStage);
			charitiesScreen = new ManageCharitiesScreen();
			charitiesScreen.init(_myStage);
			helpScreen = new HelpScreen();	
			helpScreen.init(_myStage);
		}
		
		private function generateButtons():void
		{
			_homeButton = generateHome();
			_donationButton = generateDonation();
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
				app.setScreen(homeScreen);
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
		}
		
		private function popSettings():void
		{
			var popContent:SettingsDropDown = new SettingsDropDown(_dropManager, this);
			 _dropManager.open(popContent, _settingsButton);
		}
		
		private function popCharity():void
		{
			var popContent:CharityDropDown = new CharityDropDown(_dropManager, this);
			 _dropManager.open(popContent, _donationButton);
		}
		
		private function popBrag():void
		{
			var popContent:BraggingDropDown = new BraggingDropDown(_dropManager, this);
			 _dropManager.open(popContent, _braggingButton);
		}
		
		private function popHelp():void
		{
			var popContent:HelpDropDown = new HelpDropDown(_dropManager, this);
			 _dropManager.open(popContent, _helpButton);
		}
		
	}
}
