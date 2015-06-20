/**
 * Created by Catlin on 20/06/2015.
 */
package blizz.presentationLayer.signals {

import starling.display.Sprite;
import starling.events.Event;
import starling.events.EventDispatcher;

public class UserEvent extends Event {

    public static const USER_LOADED:String = "user-loaded";

    private var _target:Sprite;

    public function UserEvent(type:String, target:Sprite,  bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable);
        _target = target;
    }

    override public function get target():EventDispatcher {
        return _target;
    }
}
}
