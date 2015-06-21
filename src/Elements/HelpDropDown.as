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
	public class HelpDropDown extends LayoutGroup
	{
		private var _root:LayoutGroup;
		private var manager:DropDownPopUpContentManager;
		
		public function HelpDropDown(man:DropDownPopUpContentManager)
		{
			super();
			layout = new VerticalLayout();
			manager = man;
			
			var tour:Button = new Button();
			tour.label = "Take tour";
			tour.name = "tour";
			tour.addEventListener(Event.TRIGGERED, buttonListener);
			tour.width = 120;
			
			var about:Button = new Button();
			about.label = "About us";
			about.name = "about";
			about.addEventListener(Event.TRIGGERED, buttonListener);
			about.width = 120;

			addChild(tour);
			addChild(about);
		}
		
		private function buttonListener(e:Event):void
		{
			manager.close();
			var buttonText:String = (e.target as Button).name;
		}
		
	}
}
