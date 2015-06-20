package {



import blizz.presentationLayer.signals.UserEvent;
import blizz.presentationLayer.views.FeathersAppPage;

import com.adobe.serialization.json.JSON;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.net.URLRequestHeader;
import flash.net.URLRequestMethod;
import flash.text.TextField;


import starling.core.Starling;


public class Main extends Sprite {

    public var textField:TextField;
	private var _starling:Starling;
	public var reusableRequest:URLRequest;
    public var reusableLoader:URLLoader;

    public function Main() {
		_starling = new Starling(App, stage);
        initPaypal();
	}

    protected function initPaypal():void {
        reusableRequest = new URLRequest();
        reusableRequest.url = "https://my-charities-server.herokuapp.com/";
        reusableRequest.requestHeaders = [new URLRequestHeader("Content-Type", "application/json")];
        reusableRequest.method = URLRequestMethod.GET;
        reusableLoader = new URLLoader();
        reusableLoader.addEventListener(Event.COMPLETE, initPaypalComplete);
        reusableLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, notAllowed);
        reusableLoader.addEventListener(IOErrorEvent.IO_ERROR, notFound);
        clearStatus();
        reusableLoader.load(reusableRequest);
    }

    private function notFound(event:IOErrorEvent):void {
        textField.text = event.toString();
        addChild(textField);
    }

    private function notAllowed(event:SecurityErrorEvent):void {
        textField.text = event.toString();
        addChild(textField);
    }

    protected function initPaypalComplete(event:Event):void
    {
        var myResults:Array=com.adobe.serialization.json.JSON.decode(event.target.data);
        setStatus(myResults.join());

        if (myResults[0] == "new")
        {
           showPaypalLoginPage();
        }
        else
        if (myResults[0] == "existing")
        {
           showAppForUser(myResults[1] as String);
        }
    }

    private function showAppForUser(myResult:String):void {
        _starling.start();
        //Set the userName in the Model
    }

    private function showPaypalLoginPage():void {
        //show WebView, and then wait for results there
    }

    protected function setStatus(msg:String):void{

        textField.text = msg;
        addChild(textField);

    }
    protected function clearStatus():void{
        textField = new TextField();
        textField.text = "";
    }


}
}
