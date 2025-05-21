import UIKit

final class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Главная"
        view.backgroundColor = .systemGray5

        let homeVC = FlowersCollectionView()

        addChild(homeVC)
        view.addSubview(homeVC.view)
        homeVC.didMove(toParent: self)

        homeVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            homeVC.view.topAnchor.constraint(equalTo: view.topAnchor),
            homeVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            homeVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension HomeViewController: SettingsButtonSupportable {
    func setupSettingButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "gearshape"),
            style: .plain,
            target: self,
            action: #selector(openSettings)
        )
    }
}

extension HomeViewController: SettingsPresentable {
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
        
        let contentHeight = settingsVC.calculateContentHeight()
        
        if let sheet = navVC.sheetPresentationController {
            sheet.detents = [ .custom { context in contentHeight },
                              .medium(),
                              .large()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 20
        }
        
        present(navVC, animated: true)
    }
    
    @objc func dismissSettings() {
        dismiss(animated: true)
    }
}
