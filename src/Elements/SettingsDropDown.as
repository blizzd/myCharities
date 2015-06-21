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
	public class SettingsDropDown extends LayoutGroup
	{
		private var _root:LayoutGroup;
		private var manager:DropDownPopUpContentManager;
		private var _parent:OptionsBar;
		
		public function SettingsDropDown(man:DropDownPopUpContentManager, parent:OptionsBar)
		{
			_parent = parent;
			super();
			layout = new VerticalLayout();
			manager = man;
			
			var logOut:Button = new Button();
			logOut.label = "Log out";
			logOut.name = "logout";
			logOut.addEventListener(Event.TRIGGERED, buttonListener);
			logOut.width = 120;
			
			var switchAcc:Button = new Button();
			switchAcc.label = "Switch PayPal account";
			switchAcc.name = "switch";
			switchAcc.addEventListener(Event.TRIGGERED, buttonListener);
			switchAcc.width = 120;
			
			var remove:Button = new Button();
			remove.label = "Remove your Paypal\n from MyPay Karma :(";
			remove.name = "remove";
			remove.addEventListener(Event.TRIGGERED, buttonListener);
			remove.width = 120;
			
			
			
			addChild(logOut);
			addChild(switchAcc);
			addChild(remove);
		}
		
		private function buttonListener(e:Event):void
		{
			manager.close();
			var buttonText:String = (e.target as Button).name;
		}
		
	}
}
