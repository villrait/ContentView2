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
        
        if rootVC is HomeViewController ||
            rootVC is FavoritesViewController ||
            rootVC is CartViewController {
            rootVC.navigationItem.leftBarButtonItem = UIBarButtonItem(
                image: UIImage(systemName: "gearshape"),
                style: .plain,
                target: rootVC,
                action: #selector(rootVC.openSettings)
            )
        }
        
        return navController
    }
}

extension UIViewController {
    @objc func openSettings() {
        let settingsVC = SettingsViewController()
        
        settingsVC.navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Закрыть",
            style: .done,
            target: self,
            action: #selector(dismissSettings)
        )
        
        let navVC = UINavigationController(rootViewController: settingsVC)
        
        navVC.modalPresentationStyle = .pageSheet
        
        if let sheet = navVC.sheetPresentationController {
            sheet.detents = [.large()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 20
        }
        present(navVC, animated: true)
    }
    
    @objc private func dismissSettings() {
        dismiss(animated: true)
    }
}
