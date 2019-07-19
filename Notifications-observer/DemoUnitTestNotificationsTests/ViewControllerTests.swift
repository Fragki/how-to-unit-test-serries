import XCTest
@testable import DemoUnitTestNotifications

class ViewControllerTests: XCTestCase {
    
    func test_viewDidLoad_addObserverForWeatherUpdate() {
        let sut = ViewController()
        let spyNotificationCenter = SpyNotificationCenterObserver()
        
        sut.notificationCenter = spyNotificationCenter
        
        _ = sut.view
        
        XCTAssertEqual(Notification.Name("WeatherUpdate"), spyNotificationCenter.didAddObserverWithName)
    }

    func test_deinit_removeObserver() {
        let sut = ViewController()
        let spyNotificationCenter = SpyNotificationCenterObserver()
        
        sut.notificationCenter = spyNotificationCenter
        
        _ = sut.view
        
        addTeardownBlock {
            XCTAssertTrue(spyNotificationCenter.didCallRemoveObserver)
        }
    }
    
    func test_updateWeatherForcast_doesNotUpdateWeatherForcast_whenNotificationIsNotNamedWeatherUpdate() {
        
        let sut = ViewController()
        
        let notification = Notification(name: Notification.Name(rawValue: "aNotifcation"), object: nil, userInfo: nil)
        
        
        sut.updateWeatherForcast(notification: notification)
        
        XCTAssertEqual("", sut.weatherForcast)
    }
    
     func test_updateWeatherForcast_doesNotUpdateWeatherForcast_whenUserInfoIsNil() {
        let sut = ViewController()
        
        let notification = Notification(name: Notification.Name(rawValue: "WeatherUpdate"), object: nil, userInfo: nil)
        
        sut.updateWeatherForcast(notification: notification)
        
        XCTAssertEqual("", sut.weatherForcast)
    }
    
    func test_updateWeatherForcast_doesNotUpdateWeatherForcast_whenUserInfoDoesNotContainWeatherForcast() {
        let sut = ViewController()
        
        let notification = Notification(name: Notification.Name(rawValue: "WeatherUpdate"), object: nil, userInfo: ["someKey" : "someInfo"])
        
        sut.updateWeatherForcast(notification: notification)
        
        XCTAssertEqual("", sut.weatherForcast)
    }
    
    func test_updateWeatherForcast_updatesWeatherForcast() {
        let sut = ViewController()
        
        let notification = Notification(name: Notification.Name(rawValue: "WeatherUpdate"), object: nil, userInfo: ["weatherForcast" : "someForcast"])
        
        sut.updateWeatherForcast(notification: notification)
        
        XCTAssertEqual("someForcast", sut.weatherForcast)
    }
    
}


extension ViewControllerTests {
    
    class SpyNotificationCenterObserver: NotificationCenterObserverProtocol {
        
        var didAddObserverWithName : Notification.Name?
        var didCallRemoveObserver = false

        func addObserver(_ observer: Any, selector aSelector: Selector, name aName: Notification.Name?, object anObject: Any?) {
            
            didAddObserverWithName = aName
        }
        
        func removeObserver(_ observer: Any) {
            didCallRemoveObserver = true
        }
    }
}
