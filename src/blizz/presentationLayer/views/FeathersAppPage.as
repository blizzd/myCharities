/**
 * Created by Catlin on 20/06/2015.
 */
package blizz.presentationLayer.views {
import feathers.core.FeathersControl;

import flash.net.URLLoader;
import flash.net.URLRequest;

public class FeathersAppPage extends FeathersControl {

    public var reusableRequest:URLRequest;
    public var reusableLoader:URLLoader;

    public function FeathersAppPage( user:String) {
        super();
        getCharitiesForUser(user);
    }

    private function getCharitiesForUser(user:String):void {

    }
}
}
