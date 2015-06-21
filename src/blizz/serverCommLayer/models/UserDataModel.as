/**
 * Created by Catlin on 20/06/2015.
 */
package blizz.serverCommLayer.models {

public class UserDataModel{

    private static var _currentUser:String;
    private static var _currentUserID:String;
    private static var _currentTransactions:Vector.<Object>;

    public function UserDataModel() {

    }

    public static function get currentUser():String {
        return _currentUser;
    }

    public static function set currentUser(value:String):void {
        _currentUser = value;
    }

    public static function get currentUserID():String {
        return _currentUserID;
    }

    public static function set currentUserID(value:String):void {
        _currentUserID = value;
    }

    public static function get currentTransactions():Vector.<Object> {
        return _currentTransactions;
    }

    public static function set currentTransactions(value:Vector.<Object>):void {
        _currentTransactions = value;
    }
}
}
