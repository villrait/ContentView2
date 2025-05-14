import UIKit

class FavoritesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Избранное"
        view.backgroundColor = .systemIndigo
        
        let favoritesVC = HeartCollectionViewController()
        
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
