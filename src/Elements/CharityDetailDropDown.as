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
		
		public function CharityDetailDropDown(man:DropDownPopUpContentManager, parent:ManageCharitiesScreen, data:Object)
		{
			
			_parent = parent;
			super();
			manager = man;
			_root = new LayoutGroup();
			_root.width = parent.
			
			slider = new Slider();
     		slider.minimum = 0;
   			slider.maximum = 100;
    		slider.step = 1;
     		slider.page = 1;
     		slider.value = data.percent;
     		slider.addEventListener( Event.CHANGE, onSlide );
     		this.addChild( slider );
			
		}
		
		private function onSlide (e:Event):void
		{
			
		}
		

		
	}
}
