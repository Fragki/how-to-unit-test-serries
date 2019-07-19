import UIKit

protocol NotificationCenterObserverProtocol {
    func addObserver(_ observer: Any, selector aSelector: Selector, name aName: Notification.Name?, object anObject: Any?)
    func removeObserver(_ observer: Any)
}

extension NotificationCenter: NotificationCenterObserverProtocol {}

class ViewController: UIViewController {

    var notificationCenter: NotificationCenterObserverProtocol? = NotificationCenter.default //The object which is responsible for creating the viewController should set the NotificationCenter.default.
    
    var weatherForcast = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationCenter?.addObserver(self, selector: #selector(updateWeatherForcast), name: Notification.Name(rawValue: "WeatherUpdate"), object: nil)
    }
    
    deinit {
        notificationCenter?.removeObserver(self)
    }

    @objc func updateWeatherForcast(notification : Notification) {
        guard notification.name ==  Notification.Name(rawValue: "WeatherUpdate")else {
            return
        }
        guard let userInfo = notification.userInfo else {
            return
        }
        guard let weatherForcast = userInfo["weatherForcast"] as? String else {
            return
        }
        self.weatherForcast = weatherForcast
        print(self.weatherForcast)
    }

}

