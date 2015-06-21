package {
	import starling.events.TouchPhase;
	import starling.events.TouchEvent;
	import starling.display.Image;
	import starling.textures.Texture;
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
				[Embed(source="Graphics/icon.png")]
				public static const Icon:Class;
				
				[Embed(source="Graphics/Chariset.png")]
				public static const Chariset:Class;
				
				[Embed(source="Graphics/Settings.png")]
				public static const Setting:Class;
				
				[Embed(source="Graphics/Brag.png")]
				public static const Brag:Class;
				
				[Embed(source="Graphics/Help.png")]
				public static const Help:Class;
		
				private var _dropManager:DropDownPopUpContentManager;
				private var _charityButton:Image;
				private var _settingsButton:Image;
				private var _braggingButton:Image;
				private var _helpButton:Image;
				private var _myStage:Stage;
				
				public var app:App;
				
				public var homeScreen:HomeScreen;
				public var donationScreen:ManageDonationsScreen;
				public var charitiesScreen:ManageCharitiesScreen;
				public var settingsScreen:SettingsScreen;
				public var helpScreen:HelpScreen;
				public var bragScreen:BragScreen;
				
				private var _optionsheight:int;
				
		public function init(application:App, optionsHeight:Number):void
		{
			_optionsheight = optionsHeight / 2;
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
			 generateHome();
			 _charityButton = generateDonation();
			 _settingsButton = generateSettings();
			_braggingButton = generateBragging();
			 _helpButton = generateHelp();
		}
		
		private function generateHome():void
		{
		    var texture:Texture = Texture.fromBitmap(new Icon());
 			var homeButton:Image = new Image(texture);
			homeButton.width = homeButton.height = _optionsheight;
			homeButton.addEventListener(TouchEvent.TOUCH, function (e:TouchEvent){
			if (e.touches[0].phase == TouchPhase.ENDED)
			{
				app.setScreen(homeScreen);
			}
			});
			addChild(homeButton);
		}
		
		
		private function generateDonation():Image
		{
			var texture:Texture = Texture.fromBitmap(new Chariset());
 			var button:Image = new Image(texture);
			button.width = button.height = _myStage.stageWidth/5;
			button.addEventListener(TouchEvent.TOUCH, function (e:TouchEvent){
			if (e.touches[0].phase == TouchPhase.ENDED)
			{
				popCharity();
			}
			});
			addChild(button);
			return button;
		}
		
		private function generateBragging():Image
		{
			var texture:Texture = Texture.fromBitmap(new Brag());
 			var button:Image = new Image(texture);
			button.width = button.height = _myStage.stageWidth/5;
			button.addEventListener(TouchEvent.TOUCH, function (e:TouchEvent){
			if (e.touches[0].phase == TouchPhase.ENDED)
			{
				popBrag();
			}
			});
			addChild(button);
			return button;
		}
		
		private function generateSettings():Image
		{
			var texture:Texture = Texture.fromBitmap(new Setting());
 			var button:Image = new Image(texture);
			button.width = button.height = _myStage.stageWidth/5;
			button.addEventListener(TouchEvent.TOUCH, function (e:TouchEvent){
			if (e.touches[0].phase == TouchPhase.ENDED)
			{
				popSettings();
			}
			});
			addChild(button);
			return button;
		}
		
		private function generateHelp():Image
		{
			var texture:Texture = Texture.fromBitmap(new Help());
 			var button:Image = new Image(texture);
			button.width = button.height = _myStage.stageWidth/5;
			button.addEventListener(TouchEvent.TOUCH, function (e:TouchEvent){
			if (e.touches[0].phase == TouchPhase.ENDED)
			{
				popHelp();
			}
			});
			addChild(button);
			return button;
			
		}
		
		private function popSettings():void
		{
			_dropManager.close();
			var popContent:SettingsDropDown = new SettingsDropDown(_dropManager, this);
			 _dropManager.open(popContent, _settingsButton);
		}
		
		private function popCharity():void
		{
				_dropManager.close();
			var popContent:CharityDropDown = new CharityDropDown(_dropManager, this);
			 _dropManager.open(popContent, _charityButton);
		}
		
		private function popBrag():void
		{
				_dropManager.close();
			var popContent:BraggingDropDown = new BraggingDropDown(_dropManager, this);
			 _dropManager.open(popContent, _braggingButton);
		}
		
		private function popHelp():void
		{
				_dropManager.close();
			var popContent:HelpDropDown = new HelpDropDown(_dropManager, this);
			 _dropManager.open(popContent, _helpButton);
		}
		
	}
}
