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
	public class CharityDropDown extends LayoutGroup
	{
		private var _root:LayoutGroup;
		private var manager:DropDownPopUpContentManager;
		
		public function CharityDropDown(man:DropDownPopUpContentManager)
		{
			super();
			layout = new VerticalLayout();
			manager = man;
			
			var chars:Button = new Button();
			chars.label = "Your charities";
			chars.name = "chars";
			chars.addEventListener(Event.TRIGGERED, buttonListener);
			chars.width = 120;
			
			var don:Button = new Button();
			don.label = "Donation settings";
			don.name = "don";
			don.addEventListener(Event.TRIGGERED, buttonListener);
			don.width = 120;

			addChild(chars);
			addChild(don);
		}
		
		private function buttonListener(e:Event):void
		{
			manager.close();
			var buttonText:String = (e.target as Button).name;
		}
		
	}
}
