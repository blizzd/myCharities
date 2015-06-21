package {


import blizz.serverCommLayer.models.UserDataModel;

import com.adobe.serialization.json.JSON;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.LocationChangeEvent;
import flash.events.SecurityErrorEvent;
import flash.geom.Rectangle;
import flash.media.StageWebView;
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
    public var ppLoginPageView:StageWebView;

    public function Main() {

        var screenWidth:int  = stage.fullScreenWidth;
        var screenHeight:int = stage.fullScreenHeight;
        var viewPort:Rectangle = new Rectangle(0, 0, screenWidth, screenHeight);

        _starling = new Starling(App, stage, viewPort);
        _starling.stage.stageHeight *= screenWidth / _starling.stage.stageWidth;
        _starling.stage.stageWidth  = screenWidth ;

        showPaypalLoginPage();
    }

    private function showAppForUser(myResult:String):void {
        _starling.start();
        UserDataModel.currentUser = myResult;
    }

    private function showPaypalLoginPage(resultPage:String = null):void {
        ppLoginPageView = new StageWebView();
        ppLoginPageView.viewPort = new Rectangle(0, 0, _starling.stage.stageWidth, _starling.stage.stageHeight);
        ppLoginPageView.stage = this.stage;
        ppLoginPageView.addEventListener(LocationChangeEvent.LOCATION_CHANGE, onUserLoginAttempt);
        if (resultPage) {
            ppLoginPageView.loadString(resultPage, "text/html");
        }
        else {
            showAppForUser("Mister Fab");
            ppLoginPageView.loadURL("http://my-charities-server.herokuapp.com/authenticate");
        }
    }


    private function onUserLoginAttempt(event:LocationChangeEvent):void {
        handlePPLoginParams(event.location);
    }

    private function handlePPLoginParams(location:String):void {
        trace(location);
        ppLoginPageView.viewPort = new Rectangle(0, 0, this.stage.stageWidth, this.stage.stageHeight);
        ppLoginPageView.stage = this.stage;

         if (location.search("/users/") > -1) {
             getHtmlSource(location);
             ppLoginPageView.stop();
             ppLoginPageView.stage = null;
             ppLoginPageView = null;
            getTransaction( UserDataModel.currentUserID);
         }
    }

    private function getHtmlSource(location:String):void
    {
        var i:int = (location.search("/users/"));
        var userID:String = location.substring(i, location.length);
        trace("JSON with userID is "+userID);
        UserDataModel.currentUserID = userID;
    }

    protected function getTransaction(userID:String):void {
        reusableRequest = new URLRequest();
        reusableRequest.url = "http://my-charities-server.herokuapp.com/transactions/"+ userID+ "";
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

    protected function initPaypalComplete(event:Event):void {
        if ((event.target.data as String).indexOf("<") == 0) {
            showPaypalLoginPage(event.target.data);
        }
        else {
            var myResults:Array = com.adobe.serialization.json.JSON.decode(event.target.data);
            trace(myResults);
            setStatus(myResults.join());
            //sendResults to List
        }
    }

    protected function setStatus(msg:String):void {

        textField.text = msg;
        addChild(textField);

    }

    protected function clearStatus():void {
        textField = new TextField();
        textField.text = "";
    }


}
}
