import UIKit

struct TabBarConfigurator {
    static func configure(_ tabBarController: UITabBarController) {
        tabBarController.viewControllers = MainTabControllersFactory.makeTabControllers()
        
        let appearance = UITabBarAppearance()
        
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.white.withAlphaComponent(0.50)
        appearance.backgroundEffect = UIBlurEffect(style: .regular)
        
        let itemAppearance = UITabBarItemAppearance()
        
        itemAppearance.normal.iconColor = .black
        itemAppearance.selected.iconColor = .systemBlue

        appearance.stackedLayoutAppearance = itemAppearance
        
        tabBarController.tabBar.standardAppearance = appearance
        tabBarController.tabBar.scrollEdgeAppearance = appearance
        
    }
}

