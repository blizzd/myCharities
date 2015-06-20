package Screens {
	import feathers.data.ListCollection;
	import feathers.controls.List;
	import starling.display.Image;
	import starling.textures.Texture;
	import flash.display.Bitmap;
	import starling.text.TextFieldAutoSize;
	import starling.text.TextField;
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
	
	[Embed(source="../Graphics/king.png")]
	public static const King:Class;

		private var _myStage:Stage;
		private var _root:LayoutGroup;
		private var _header:LayoutGroup;
		private var _topOffset:Number = 35;
			
		public override function init(stage:Stage):void
		{
			_myStage = stage;
			_root = new LayoutGroup();
			_header = new LayoutGroup();
			
			var layout:VerticalLayout = new VerticalLayout();
			layout.horizontalAlign = VerticalLayout.HORIZONTAL_ALIGN_LEFT;
			layout.verticalAlign = VerticalLayout.VERTICAL_ALIGN_TOP;
			_header.width = _myStage.stageWidth;
			_header.layout = layout;
			_header.y += _topOffset;
			generateHeader();	
			
			addChild(_root);
			addChild(_header);	
			addIcon();
			addList();
		}
		
		private function generateHeader():void
		{
			
			
			var headerHeight:Number = _myStage.stageHeight/5;
			var layout:VerticalLayout = new VerticalLayout();
			layout.horizontalAlign = VerticalLayout.HORIZONTAL_ALIGN_CENTER;
			layout.verticalAlign = VerticalLayout.VERTICAL_ALIGN_TOP;
			_root.layout = layout;
			_root.width = _myStage.stageWidth;
			_root.y += _topOffset;
			var bg:Quad = new Quad( _myStage.stageWidth -84, headerHeight, 0x7eff8c );
			var text:String = "Hello " + UserDataModel.currentUser + " !\n" +
			"Rank: King Giving\n" +
			"Donated X Times. X donations needed for next rank.";
			 var textField:TextField = new TextField(100, 100, "");
			 textField.autoSize = TextFieldAutoSize.BOTH_DIRECTIONS;
			 textField.text = text;
			 textField.pivotX -= 50;
			 
			 
			
			 
			_root.addChild(bg);
            _header.addChild(textField);
			
			
		}	
		
		private function addIcon():void
		{
			var container:LayoutGroup = new LayoutGroup();
			var texture:Texture = Texture.fromBitmap(new King());
 			var image:Image = new Image(texture);
			image.scaleX = image.scaleY = 0.5;
			container.addChild(image);
			container.y = 10;
			container.x = _myStage.stageWidth -84;
			addChild(container);
		}
		
		private function addList():void
		{
			 var textField:TextField = new TextField(100, 100, "");
			 textField.autoSize = TextFieldAutoSize.BOTH_DIRECTIONS;
			 textField.text = "Recent Donations:";
			 textField.pivotY -= 5;
			 _root.addChild(textField);
			 
			var list:List = new List();
			var recentDonations:ListCollection = new ListCollection(
			[
  			  { text: "Ebay " + "0,30 Euro" },
  			  { text: "SteamApp " + "1 Euro" },
    		  { text: "Google Play " + "0,42 Euro"  },
  			  { text: "battle.net " + "0,33 Euro" },
			]);
			list.dataProvider = recentDonations;
			list.pivotY -= 20;
			list.itemRendererProperties.labelField = "text";
			list.isSelectable =false;
			_root.addChild(list);
		}
	}
}
