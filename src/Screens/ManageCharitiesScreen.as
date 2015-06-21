package Screens {
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
	
		private var _myStage:Stage;
			
		public override function init(stage:Stage):void
		{
			_myStage = stage;
			
			var container:List = new List();
			var layout:VerticalLayout = new VerticalLayout();
			layout.horizontalAlign = VerticalLayout.HORIZONTAL_ALIGN_LEFT;
			layout.verticalAlign = VerticalLayout.VERTICAL_ALIGN_TOP;
			this.layout = layout;
			container.layout = layout;
			
			container.width = _myStage.width;
			container.height = _myStage.stageHeight/2;
			
			var charities:ListCollection = new ListCollection(
			[
  			  { field: new ListButton(_myStage, "test" + " " + "5%") },
  			  { field: new ListButton(_myStage, "test" + " " + "5%") },
    		  { field: new ListButton(_myStage, "test" + " " + "5%") },
  			  { field: new ListButton(_myStage, "test" + " " + "5%") },
			    { field: new ListButton(_myStage, "sgdgdst" + " " + "5%") },
  			  { field: new ListButton(_myStage, "test" + " " + "5%") },
    		  { field: new ListButton(_myStage, "test" + " " + "5%") },
  			  { field: new ListButton(_myStage, "test" + " " + "5%") },
			    { field: new ListButton(_myStage, "test" + " " + "5%") },
  			  { field: new ListButton(_myStage, "test" + " " + "5%") },
    		  { field: new ListButton(_myStage, "test" + " " + "5%") },
  			  { field: new ListButton(_myStage, "tsfffs" + " " + "5%") }
			]);
			
			container.addEventListener(Event.CHANGE, selectListener);
			container.typicalItem = new ButtonItemRenderer();
			container.itemRendererFactory = function():IListItemRenderer
			{
    		var renderer:ButtonItemRenderer = new ButtonItemRenderer();
			renderer.labelField = "field";
    		return renderer;
			};
			container.dataProvider = charities;
			
			addChild(container);

			generateHeader();
		}
		
		private function selectListener(e:Event):void
		{
			var target:List = (e.currentTarget as List);
			target.removeEventListener(Event.CHANGE, selectListener);
			var selected:String = (target.selectedItem.field as ListButton).text;
			target.selectedIndex = -1;
			target.addEventListener(Event.CHANGE, selectListener);
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
