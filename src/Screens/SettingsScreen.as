package Screens {
	import starling.display.DisplayObject;
	import starling.text.TextFieldAutoSize;
	import flash.trace.Trace;
	
	import blizz.serverCommLayer.models.UserDataModel;
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
	public class SettingsScreen extends AppScreen
	{
	
		private var _myStage:Stage;
		private var _root:LayoutGroup;
			
		public override function init(stage:Stage):void
		{
			_myStage = stage;
		    _root = new LayoutGroup();
			_root.y += 20;		
			_root.width = _myStage.width;		
			var layout:VerticalLayout = new VerticalLayout();
			layout.horizontalAlign = VerticalLayout.HORIZONTAL_ALIGN_CENTER;
			layout.verticalAlign = VerticalLayout.VERTICAL_ALIGN_TOP;
			_root.layout = layout;

			super.addChild(_root);
			generateHeader();

			
		}
		
		public override function addChild(child:DisplayObject):DisplayObject
		{
			return _root.addChild(child)
		}
		
		private function generateHeader():void
		{
			var textField:TextField = new TextField(100,100,"");
            textField.autoSize = TextFieldAutoSize.BOTH_DIRECTIONS;
            textField.text = "Set me up:";

            addChild(textField);
			
			var logOut:Button = new Button();
			logOut.label = "Log out";
			logOut.addEventListener(Event.TRIGGERED, function():void{})
			addChild(logOut);
			
		}	
	}
}
