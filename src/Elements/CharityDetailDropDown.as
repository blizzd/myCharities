package Elements {
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
		private var _parent:OptionsBar;
		
		public function CharityDetailDropDown(man:DropDownPopUpContentManager, parent:OptionsBar, data:Object)
		{
			_parent = parent;
			super();
			manager = man;
			
			
		}
		

		
	}
}
