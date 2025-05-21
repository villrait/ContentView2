import UIKit

class CartViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Корзина"
        view.backgroundColor = .systemGray
    }
}

extension CartViewController: SettingsButtonSupportable {
    func setupSettingButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "gearshape"),
            style: .plain,
            target: self,
            action: #selector(openSettings)
        )
    }
}

extension CartViewController: SettingsPresentable {
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
