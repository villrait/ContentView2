import UIKit

class FavoritesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Избранное"
        view.backgroundColor = .systemIndigo
        
        let favoritesVC = FavoritesCollectionViewController()
        
        addChild(favoritesVC)
        view.addSubview(favoritesVC.view)
        favoritesVC.didMove(toParent: self)
        
        favoritesVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoritesVC.view.topAnchor.constraint(equalTo: view.topAnchor),
            favoritesVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            favoritesVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            favoritesVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension FavoritesViewController: SettingsButtonSupportable {
    func setupSettingButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "gearshape"),
            style: .plain,
            target: self,
            action: #selector(openSettings)
        )
    }
}

extension FavoritesViewController: SettingsPresentable {
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
    
    @objc func dismissSettings() {
        dismiss(animated: true)
    }
}
