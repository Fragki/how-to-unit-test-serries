import UIKit

protocol NotificationCenterPostProtocol {
    func post(name aName: NSNotification.Name, object anObject: Any?, userInfo aUserInfo: [AnyHashable : Any]?)
}

extension NotificationCenter: NotificationCenterPostProtocol {}

class ViewController: UIViewController {

     var notificationCenter: NotificationCenterPostProtocol? = NotificationCenter.default //The object which is responsible for creating the viewController should set the NotificationCenter.default.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationCenter?.post(name: Notification.Name("aNotification"), object: nil, userInfo: ["key": "value"])
    }

}
