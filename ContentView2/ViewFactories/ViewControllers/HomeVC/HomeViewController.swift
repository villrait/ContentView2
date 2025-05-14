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
