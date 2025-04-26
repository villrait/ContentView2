import UIKit
import SideMenu

class CustomNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.backgroundColor = .white
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationBar.isTranslucent = false
        navigationBar.shadowImage = UIImage()
        
        
        let menuButton = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(openMenu))
        menuButton.tintColor = .black
        topViewController?.navigationItem.leftBarButtonItem = menuButton
    }
    
    @objc func openMenu() {
        present(SideMenuManager.default.leftMenuNavigationController!, animated: true, completion: nil)
    }
}
