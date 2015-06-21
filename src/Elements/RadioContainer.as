package Elements {
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	import starling.display.Image;
	import feathers.layout.HorizontalLayout;
	import Screens.ManageDonationsScreen;
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
	public class RadioContainer extends LayoutGroup
	{
		[Embed(source="../Graphics/Checked.png")]
	public static const Check:Class;
		
		[Embed(source="../Graphics/unChecked.png")]
	public static const Uncheck:Class;
		
		[Embed(source="../Graphics/CheckedNone.png")]
	public static const Boo:Class;
		
		
		private var _parent:ManageDonationsScreen;
		private var check:Image;
		private var uncheck:Image;
		private var boo:Image;
			
		public var option:String;
		
		
		public function RadioContainer(parent:ManageDonationsScreen,thename:String)
		{
			option = thename;
			_parent = parent;
			super();
			layout = new HorizontalLayout();
			
			var checkContainer:LayoutGroup =new LayoutGroup();
			
			var texture:Texture = Texture.fromBitmap(new Uncheck());
 			uncheck = new Image(texture);
			uncheck.scaleX = uncheck.scaleY = 0.5;
			
			var texture2:Texture = Texture.fromBitmap(new Check());
 			check = new Image(texture2);
			check.scaleX = check.scaleY = 0.5;
			
			var texture3:Texture = Texture.fromBitmap(new Boo());
 			boo = new Image(texture3);
			boo.scaleX = boo.scaleY = 0.5;
			
			uncheck.addEventListener(TouchEvent.TOUCH, onTouch);
			
			checkContainer.addChild(check);
			checkContainer.addChild(boo);
			checkContainer.addChild(uncheck);
			checkContainer.height = boo.height*2;
			addChild(checkContainer);
		}
		
		public function setCheck(value: Boolean):void
		{
			if (value)
			{
				check.visible = option != "boo";
				boo.visible = option == "boo";
			} 
			else
			{
				check.visible = boo.visible = false;
			}
			
			this.invalidate();
		}
		
		private function onTouch(e:TouchEvent):void
		{
			if (e.touches[0].phase == TouchPhase.ENDED)
			_parent.select(option);
		}
		
	}
}
