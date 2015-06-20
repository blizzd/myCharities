package {


import com.adobe.serialization.json;
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

public class Main extends Sprite {

    public var textField:TextField;

    public function Main() {
        textField = new TextField();
        var request:URLRequest = new URLRequest();
        request.url = "";
        request.requestHeaders = [new URLRequestHeader("Content-Type", "application/json")];
        request.method = URLRequestMethod.GET;
        var loader:URLLoader = new URLLoader();
        loader.addEventListener(Event.COMPLETE, receive);
        loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, notAllowed);
        loader.addEventListener(IOErrorEvent.IO_ERROR, notFound);
        clearStatus();
        loader.load(request);
    }

    private function notFound(event:IOErrorEvent):void {
        textField.text = event.toString();
        addChild(textField);
    }

    private function notAllowed(event:SecurityErrorEvent):void {
        textField.text = event.toString();
        addChild(textField);
    }
    protected function receive(event:Event):void
    {
        var myResults:Array=com.adobe.serialization.json.JSON.decode(event.target.data);
    }

    protected function setStatus(msg:String):void{

        textField.text = msg;
        addChild(textField);

    }
    protected function clearStatus():void{
        textField.text = "";
    }




}
}
