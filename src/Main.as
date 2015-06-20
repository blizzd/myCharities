package {

import com.pnwrain.flashsocket.FlashSocket;
import com.pnwrain.flashsocket.events.FlashSocketEvent;

import feathers.controls.Alert;

import flash.display.Sprite;
import flash.text.TextField;

public class Main extends Sprite {

    public var socket:FlashSocket;
    public var textField:TextField;

    public function Main() {
        textField = new TextField();
        socket = new FlashSocket("localhost:8080");
        socket.addEventListener(FlashSocketEvent.CONNECT, onConnect);
        socket.addEventListener(FlashSocketEvent.MESSAGE, onMessage);
        socket.addEventListener(FlashSocketEvent.IO_ERROR, onError);
        socket.addEventListener(FlashSocketEvent.SECURITY_ERROR, onError);

        socket.addEventListener("my other event", myCustomMessageHandler);
    }

    protected function myCustomMessageHandler(event:FlashSocketEvent):void{
        Alert.show('we got a custom event!');
    }

    protected function onConnect(event:FlashSocketEvent):void {

        clearStatus();

    }

    protected function onError(event:FlashSocketEvent):void {

        setStatus("something went wrong");

    }

    protected function setStatus(msg:String):void{

        textField.text = msg;
        addChild(textField);

    }
    protected function clearStatus():void{

        textField.text = "";
    }

    protected function onMessage(event:FlashSocketEvent):void{

        trace('we got message: ' + event.data);
        socket.send({msgdata: event.data},"my other event");

    }



}
}
