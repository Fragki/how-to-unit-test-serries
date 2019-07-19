import UIKit

class ViewController: UIViewController {

    var weatherForcast = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateWeatherForcast), name: NSNotification.Name(rawValue: "WeatherUpdate"), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func updateWeatherForcast(notification : Notification) {
        guard notification.name ==  NSNotification.Name(rawValue: "WeatherUpdate")else {
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

