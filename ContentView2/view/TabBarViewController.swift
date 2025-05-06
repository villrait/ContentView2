import UIKit

final class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        TabBarConfigurator.configure(self)
        
    }
}
