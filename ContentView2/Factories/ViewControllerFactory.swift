import UIKit

class ViewControllerFactory {
    static func createViewControllers() -> [UIViewController] {
        let cartVC = CartViewController()
        let heartVC = HeartViewController()
        let creditCardVC = CreditcardViewController()

        return [cartVC, heartVC, creditCardVC]
    }
}
