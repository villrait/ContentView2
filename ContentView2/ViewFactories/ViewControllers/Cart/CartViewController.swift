import UIKit

final class CartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Каталог"
        view.backgroundColor = .systemGray5

        let flowersVC = FlowersCollectionView()

        addChild(flowersVC)
        view.addSubview(flowersVC.view)
        flowersVC.didMove(toParent: self)

        flowersVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            flowersVC.view.topAnchor.constraint(equalTo: view.topAnchor),
            flowersVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            flowersVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            flowersVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
