import UIKit

struct NavigationConfigurator {
    static func createNavigationController(for rootVC: UIViewController) -> UINavigationController {
        
        let navController = UINavigationController(rootViewController: rootVC)
        navController.navigationBar.prefersLargeTitles = false
        navController.navigationBar.tintColor = .systemBlue
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.white.withAlphaComponent(0.50)
        appearance.backgroundEffect = UIBlurEffect(style: .regular)
        
        navController.navigationBar.standardAppearance = appearance
        navController.navigationBar.scrollEdgeAppearance = appearance
        
        // экрано-зависимая настройка, выполнять непосредственно в контроллере, чтобы тут не разрасталась портянка условий
        if let settableVC = rootVC as? (SettingsButtonSupportable & SettingsPresentable) {
            settableVC.setupSettingButton()
        }
        
        return navController
    }
}

// Слшком общий класс, всем контрлллерам необязательно знать и уметь открывать натсройки, лучше зайти через своим базовые классы-наследники, или через протокол.

//extension UIViewController {...}
