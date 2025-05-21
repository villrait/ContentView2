import UIKit

final class MainTabBarController: UITabBarController { // Тоже лучще переимоновать в маинСкринКонтейнер или типо того
    override func viewDidLoad() {
        super.viewDidLoad()
        TabBarConfigurator.configure(self)
        
    }
}
