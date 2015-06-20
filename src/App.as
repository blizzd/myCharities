package {
	import flashx.textLayout.formats.VerticalAlign;
	import com.adobe.utils.NumberFormatter;
	import org.osmf.layout.HorizontalAlign;
  
	import feathers.layout.AnchorLayoutData;
	import feathers.layout.AnchorLayout;
	import feathers.layout.HorizontalLayoutData;
	import feathers.layout.HorizontalLayout;
	import feathers.controls.renderers.LayoutGroupGroupedListHeaderOrFooterRenderer;
	import feathers.controls.LayoutGroup;
	import starling.display.Sprite;
	import starling.display.Quad;
	import starling.text.TextField;
	import feathers.controls.Button;
	import feathers.controls.Callout;
	import feathers.controls.Label;
	import feathers.themes.MinimalMobileTheme;
	import feathers.layout.VerticalLayout;

	import starling.events.Event;
	
	/**
	 * @author Bronko
	 */
	public class App extends Sprite
	{
		public function App()
		{
			this.addEventListener( Event.ADDED_TO_STAGE, addedToStageHandler );
		}
		

		private var optionsHeight:Number;
		private var optionsBar:OptionsBar;
 
		protected function addedToStageHandler( event:Event ):void
		{
			new MinimalMobileTheme();
			optionsHeight = stage.stageHeight/10;
			setBackground();
			optionsBar = new OptionsBar();
			optionsBar.init(stage, optionsHeight);
			
			this.addChild( optionsBar );	
			//addChild(container);
			
			
			
		}
		
		private function setBackground():void
		{
			var quad:Quad = new Quad( stage.stageWidth, optionsHeight, 0x7eff8c );
			var quad2:Quad = new Quad( stage.stageWidth, stage.stageHeight - optionsHeight, 0xc0c0c0 );
			quad2.y = optionsHeight;
   			addChild( quad );
			addChild( quad2 );
		}
		
		
	}
}
