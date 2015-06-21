package Elements {
	import Screens.ManageCharitiesScreen;
	import feathers.controls.Slider;
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
	public class CharityDetailDropDown extends LayoutGroup
	{
		private var _root:LayoutGroup;
		private var manager:DropDownPopUpContentManager;
		private var _parent:ManageCharitiesScreen;
		private var slider:Slider;
		
		private var _oldValue:int;
		private var _step:int;
		
		
		public function CharityDetailDropDown(man:DropDownPopUpContentManager, parent:ManageCharitiesScreen, data:Object, stepval:int)
		{
			_step = stepval;
			_parent = parent;
			super();
			manager = man;
			_root = new LayoutGroup();
			_root.width = parent.MyStage.stageWidth/2;
			_root.x = parent.MyStage.stageWidth/4;
			var bg:Quad = new Quad(_root.width, _root.width/1.3, 0x77bbff);
			_root.addChild(bg);
			this.slider = new Slider();
			
     		slider.minimum = _oldValue % stepval;
   			slider.maximum = 100 - (_oldValue % stepval);
			slider.value = data.percent;
			_oldValue = data.percent;
    		slider.step = stepval;
     		
     		slider.addEventListener( Event.CHANGE, onSlide );
			slider.width = _root.width - 10;
			slider.y = bg.height - slider.height - 25;
     		_root.addChild( slider );
			addChild(_root);
			
		}
		
		private function onSlide (e:Event):void
		{
		
		
			_parent.changeSelectedValue(slider.value);
		}
		

		
	}
}
