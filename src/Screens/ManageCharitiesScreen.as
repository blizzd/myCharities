package Screens {
	import Elements.CharityDetailDropDown;
	import feathers.controls.popups.DropDownPopUpContentManager;
	import Elements.ButtonItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.data.ListCollection;
	import feathers.controls.List;
	import Elements.ListButton;
	import feathers.controls.ScrollContainer;
	
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
	public class ManageCharitiesScreen extends AppScreen
	{
	
		private var _dropManager:DropDownPopUpContentManager;	
		public var MyStage:Stage;
		private var _charityList:Vector.<Object>;
		private var _charityButtonList:List;
		private var _selected:int;
			
		public override function init(stage:Stage):void
		{
			_charityList = new Vector.<Object>();
			MyStage = stage;
			_dropManager = new DropDownPopUpContentManager();
			
			_charityButtonList = new List();
			var layout:VerticalLayout = new VerticalLayout();
			layout.horizontalAlign = VerticalLayout.HORIZONTAL_ALIGN_LEFT;
			layout.verticalAlign = VerticalLayout.VERTICAL_ALIGN_TOP;
			this.layout = layout;
			_charityButtonList.layout = layout;
			
			_charityButtonList.width = MyStage.width;
			_charityButtonList.height = MyStage.stageHeight/2.5;
			
			var charities:Vector.<Object> = new Vector.<Object>();
			charities.push(  {text:"Unicef", percent:25});
			charities.push(  {text:"WWF", percent:25});
			charities.push(  {text:"Greenpeace", percent:25});
			charities.push(  {text:"Bill Gates Foundation", percent:25});
			
			
			_charityButtonList.typicalItem = new ButtonItemRenderer();
			_charityButtonList.itemRendererFactory = function():IListItemRenderer
			{
    		var renderer:ButtonItemRenderer = new ButtonItemRenderer();
    		return renderer;
			};
			initList(charities);
			
			
			addChild(_charityButtonList);

			generateHeader();
		}
		
		public function changeSelectedValue(amount:int)
		{
			var difference:int = (_charityList[_selected].percent - amount)/(_charityList.length - 1);
			var sofar:int = 0;
			for (var i:int = 0; i < _charityList.length; i++)
			{
				
				if (_selected == i)
				{
					_charityList[i].percent = amount;
					sofar += amount;
				} else if (i == _charityList.length - 1)
				{
					100 - sofar;
				}
				{
					_charityList[i].percent = Math.min(100,(Math.max(0,_charityList[i].percent + difference)));
					sofar += _charityList[i].percent;
				}
			}
			initList(_charityList);
		}
		
		public function initList(entries:Vector.<Object>)
		{
			_charityList = entries;
			_charityButtonList.removeEventListener(Event.CHANGE, selectListener);
			var charities:ListCollection = new ListCollection();
			for each (var obj : Object in entries) 
			{
				charities.push(new ListButton(MyStage, obj.text + " " + obj.percent + "%"));
			}
			_charityButtonList.dataProvider = charities;
			_charityButtonList.addEventListener(Event.CHANGE, selectListener);
		}
		
		private function selectListener(e:Event):void
		{
			var target:List = (e.currentTarget as List);
			target.removeEventListener(Event.CHANGE, selectListener);
			var test:Object = _charityButtonList.selectedItem;
			_selected = _charityButtonList.selectedIndex;
			var selected:Object = _charityList[_selected];
			
		}
		
		private function generateHeader():void
		{
			var textField:TextField = new TextField(100,100,"");
            textField.autoScale = true;
            textField.text = "Set up your charities";

            addChild(textField);
		}	
	}
}
