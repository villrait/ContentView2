import UIKit

class ViewControllerFactory {
    static func createViewControllers() -> [UIViewController] {
        let cartVC = CartViewController()
        let heartVC = HeartViewController()
        let creditCardVC = CreditcardViewController()

        cartVC.tabBarItem = UITabBarItem(
            title: "Cart",
            image: UIImage(systemName: "cart"),
            selectedImage: UIImage(systemName: "cart.fill")
        )
        
        heartVC.tabBarItem = UITabBarItem(
            title: "Favorites",
            image: UIImage(systemName: "heart"),
            selectedImage: UIImage(systemName: "heart.fill")
        )
        
        creditCardVC.tabBarItem = UITabBarItem(
            title: "Payments",
            image: UIImage(systemName: "creditcard"),
            selectedImage: UIImage(systemName: "creditcard.fill")
        )
        
        return [
            NavigationConfigurator.createNavigationController(for: cartVC),
            NavigationConfigurator.createNavigationController(for: heartVC),
            NavigationConfigurator.createNavigationController(for: creditCardVC)
        ]
    }
}
