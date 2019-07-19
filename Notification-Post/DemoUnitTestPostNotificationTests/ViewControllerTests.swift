import XCTest
@testable import DemoUnitTestPostNotification

class ViewControllerTests: XCTestCase {

    func test_viewDidLoad_postNotification() {
        let sut = ViewController()
        let spyNotificationCenterPost = SpyNotificationCenterPost()
        sut.notificationCenter = spyNotificationCenterPost
        
        _ = sut.view
        
        XCTAssertEqual(Notification.Name("aNotification"), spyNotificationCenterPost.notificationName)
        XCTAssertNil(spyNotificationCenterPost.object)
        XCTAssertEqual(["key": "value"], spyNotificationCenterPost.userInfo as! [String : String])
    }

}

extension ViewControllerTests {
    
    class SpyNotificationCenterPost: NotificationCenterPostProtocol {
        
        var notificationName: NSNotification.Name?
        var object: Any?
        var userInfo: [AnyHashable : Any]?
        
        func post(name aName: NSNotification.Name, object anObject: Any?, userInfo aUserInfo: [AnyHashable : Any]?) {
            self.notificationName = aName
            self.object = anObject
            self.userInfo = aUserInfo
        }
    }

}
