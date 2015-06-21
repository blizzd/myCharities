package Elements {
	import starling.text.TextFieldAutoSize;
	import starling.text.TextField;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	import starling.display.Image;
	import feathers.layout.HorizontalLayout;
	import Screens.ManageDonationsScreen;
	import starling.events.Event;
	import feathers.controls.Button;
	import feathers.layout.VerticalLayout;
	import feathers.controls.popups.DropDownPopUpContentManager;
	import starling.events.TouchEvent;
	import starling.display.Stage;
	import starling.display.Quad;
	import feathers.controls.LayoutGroup;
	import starling.display.DisplayObjectContainer;
	/**
	 * @author Bronko
	 */
	public class ListButton extends LayoutGroup
	{		
		
		public var text:String;
			
		
		private var _hOffset:Number;
		public static var ItemHeight:Number;
		
		public function ListButton(stage:Stage, text:String)
		{
			ItemHeight = stage.stageHeight/11;
			_hOffset = stage.stageWidth/6;
			this.text = text;
			var bg1:Quad = new Quad(stage.stageWidth - _hOffset, ItemHeight, 0xa0a0a0);
			var bg2:Quad = new Quad(stage.stageWidth - _hOffset - 10, ItemHeight - 10, 0xd7d7d7);
			bg1.x = _hOffset/2;
			bg2.x = _hOffset/2 + 5;
			bg2.y = 5;
			addChild(bg1);
			addChild(bg2);
			
			var label:TextField = new TextField(1,ItemHeight,text);
			label.autoSize = TextFieldAutoSize.HORIZONTAL;
			label.pivotX -= _hOffset;
			addChild(label);
			
		}		
	}
}
