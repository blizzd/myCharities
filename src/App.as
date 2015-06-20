package {
	import starling.display.Sprite;
	import starling.text.TextField;
	/**
	 * @author Bronko
	 */
	public class App extends Sprite
	{
		public function App()
		{
			 var textField:TextField = new TextField(400, 300, "Welcome to Starling!");
        	addChild(textField);
		}
	}
}
