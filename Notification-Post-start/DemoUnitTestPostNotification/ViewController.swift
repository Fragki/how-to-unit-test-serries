import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.post(Notification(name: Notification.Name("aNotification"), object: nil, userInfo: ["key": "value"]))
    }

}
