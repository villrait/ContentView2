import UIKit
import SideMenu

class CartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        title = "Магазин"
        
        let menuImageName = "line.horizontal.3"
        let menuButton = UIBarButtonItem(image: UIImage(systemName: menuImageName),
                                         style: .plain,
                                         target: self,
                                         action: #selector(showMenu))

        navigationItem.leftBarButtonItem = menuButton
    }

    @objc func showMenu() {
        guard let tabBarController = tabBarController as? TabBarViewController,
              let menu = tabBarController.menu else { return }

        present(menu, animated: true, completion: nil)
    }
}
