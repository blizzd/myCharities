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
	public class BraggingDropDown extends LayoutGroup
	{
		private var _root:LayoutGroup;
		private var manager:DropDownPopUpContentManager;
	   private var _parent:OptionsBar;
		
		public function BraggingDropDown(man:DropDownPopUpContentManager, parent:OptionsBar)
		{
			_parent = parent;
			super();
			layout = new VerticalLayout();
			manager = man;
			
			var pub:Button = new Button();
			pub.label = "Publishing settings";
			pub.name = "tour";
			pub.addEventListener(Event.TRIGGERED, buttonListener);
			pub.width = _parent.width / 3;
			
			var social:Button = new Button();
			social.label = "Manage social \n" +
			"networks";
			social.name = "social";
			social.addEventListener(Event.TRIGGERED, buttonListener);
			social.width = _parent.width / 3;

			addChild(pub);
			addChild(social);
		}
		
		private function buttonListener(e:Event):void
		{
			manager.close();
			var buttonText:String = (e.target as Button).name;
		}
		
	}
}
