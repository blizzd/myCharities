package Elements {
	import feathers.layout.VerticalLayout;
	import feathers.controls.ScrollContainer;
	import feathers.controls.renderers.DefaultListItemRenderer;
	/**
	 * @author Bronko
	 */
	public class ButtonItemRenderer extends DefaultListItemRenderer 
	{
		override protected function initialize():void
		{
   		 super.initialize();
 		
		 height = ListButton.ItemHeight;
		}
	
	/* OVERRIDE */
		override public function set data(value:Object):void
		{
			super.data = value;
			addChild(value.field as ListButton);
			invalidate();
			
		}
	}
}
