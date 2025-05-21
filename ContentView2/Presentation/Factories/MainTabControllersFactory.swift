import UIKit

class MainTabControllersFactory { // по названию не понятно, что делает. Надо переделать в более точное название (маинСкринТабКонтроллерсФАктории)
    static func makeTabControllers() -> [UIViewController] { // createViewControllers так же над названием поработать надо
        let homeVC = HomeViewController()
        let favoritesVC = FavoritesViewController()
        let cartVC = CartViewController()

        homeVC.tabBarItem = UITabBarItem(
            title: "Главная",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        favoritesVC.tabBarItem = UITabBarItem(
            title: "Избранное",
            image: UIImage(systemName: "heart"),
            selectedImage: UIImage(systemName: "heart.fill")
        )
        
        cartVC.tabBarItem = UITabBarItem(
            title: "Корзина",
            image: UIImage(systemName: "cart"),
            selectedImage: UIImage(systemName: "cart.fill")
        )
        
        return [
            NavigationConfigurator.createNavigationController(for: homeVC),
            NavigationConfigurator.createNavigationController(for: favoritesVC),
            NavigationConfigurator.createNavigationController(for: cartVC)
        ]
    }
}
