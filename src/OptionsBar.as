package {
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
				private var _homeButton:Button;
				private var _donationButton:Button;
				private var _settingsButton:Button;
				private var _braggingButton:Button;
				private var _helpButton:Button;
				private var _myStage:Stage;
				
		public function init(stage:Stage, optionsHeight:Number):void
		{
			_myStage = stage;
			
			var layout:HorizontalLayout = new HorizontalLayout();
			width = _myStage.stageWidth;
			height = optionsHeight;
			layout.horizontalAlign = HorizontalLayout.HORIZONTAL_ALIGN_CENTER;
			layout.verticalAlign = HorizontalLayout.VERTICAL_ALIGN_MIDDLE;
			this.layout = layout;

			generateButtons();

			
		}
		
		private function generateButtons():void
		{
			_homeButton = generateHome();
			_donationButton = generateDonation();
			_settingsButton = generateBragging();
			_braggingButton = generateSettings();
			_helpButton = generateHelp();
		}
		
		private function generateHome():Button
		{
			var button:Button = new Button();
			button.label = "Home";
			button.addEventListener(Event.TRIGGERED, button_triggered);
			addChild(button);
			return button;
			
		}
		
		private function generateDonation():Button
		{
			var button:Button = new Button();
			button.label = "SDonat";
			button.addEventListener(Event.TRIGGERED, button_triggered);
			addChild(button);
			return button;
		}
		
		private function generateBragging():Button
		{
			var button:Button = new Button();
			button.label = "Brag";
			button.addEventListener(Event.TRIGGERED, button_triggered);
			addChild(button);
			return button;
		}
		
		private function generateSettings():Button
		{
			var button:Button = new Button();
			button.label = "Set";
			button.addEventListener(Event.TRIGGERED, button_triggered);
			addChild(button);
			return button;
		}
		
		private function generateHelp():Button
		{
			var button:Button = new Button();
			button.label = "?";
			button.addEventListener(Event.TRIGGERED, button_triggered);
			addChild(button);
			return button;
		}
		
		private function button_triggered(e:Event):void
		{
			Trace(e.data);
		}
	}
}
