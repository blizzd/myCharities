package Screens {
	import Elements.RadioContainer;
	import starling.text.TextFieldAutoSize;
	
	import starling.display.Stage;
  

	import feathers.controls.LayoutGroup;

	import starling.text.TextField;
	
	import feathers.layout.VerticalLayout;
	
	
	/**
	 * @author Bronko
	 */
	public class ManageDonationsScreen extends AppScreen
	{
	
		private var _myStage:Stage;
		private var _root:LayoutGroup;
		private var _options: Vector.<RadioContainer>;
		private var _current:String;	
			
		public override function init(stage:Stage):void
		{
			_options = new Vector.<RadioContainer>();
			_myStage = stage;
		    _root = new LayoutGroup();
			_root.y += 20;		
			_root.width = _myStage.width;		
			var layout:VerticalLayout = new VerticalLayout();
			layout.horizontalAlign = VerticalLayout.HORIZONTAL_ALIGN_CENTER;
			layout.verticalAlign = VerticalLayout.VERTICAL_ALIGN_TOP;
			this.layout = layout;

			super.addChild(_root);
			generateHeader();

			
		}
		
		private function generateHeader():void
		{
			var textField:TextField = new TextField(100,100,"");
            textField.autoSize = TextFieldAutoSize.BOTH_DIRECTIONS;
            textField.text = "Donate for each transaction:";

            addChild(textField);
			
			var fixedVal:RadioContainer = new RadioContainer(this, "fixed");
			var percentVal:RadioContainer = new RadioContainer(this, "percent");
			var roundedVal:RadioContainer = new RadioContainer(this, "rounded");
			var noVal:RadioContainer = new RadioContainer(this, "boo");
			
			_options.push(fixedVal);
			fixedVal.addChild(new TextField(300, 30, "1 Euro"));
			_options.push(percentVal);
			percentVal.addChild(new TextField(300, 30, "10%"));
			_options.push(roundedVal);
			roundedVal.addChild(new TextField(300, 30, "Round to next 10 Euros"));
			_options.push(noVal);
			noVal.addChild(new TextField(300, 30, "Don't donate"));
			
			addChild(fixedVal);
			addChild(percentVal);
			addChild(roundedVal);
			addChild(noVal);
			
			select("boo");
		}	
		
		public function select(selected:String):void
		{
			if (_current != selected)
			{
				_current = selected;
				for each (var option : RadioContainer in _options) 
				{				
					option.setCheck(option.option == selected);				
				}
			}
		}
	}
}
