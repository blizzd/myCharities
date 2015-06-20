package Screens {
	import blizz.serverCommLayer.models.UserDataModel;
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
	public class HomeScreen extends AppScreen
	{
	
		private var _myStage:Stage;
			
		public override function init(stage:Stage):void
		{
			_myStage = stage;

			var layout:VerticalLayout = new VerticalLayout();
			layout.horizontalAlign = VerticalLayout.HORIZONTAL_ALIGN_CENTER;
			layout.verticalAlign = VerticalLayout.VERTICAL_ALIGN_MIDDLE;
			this.layout = layout;
			generateHeader();	
		}
		
		private function generateHeader():void
		{
			 var textField:TextField = new TextField(100,100,"");
            textField.autoScale = true;
            textField.text = "Hello " + UserDataModel.currentUser + " !";

            addChild(textField);
		}	
	}
}
