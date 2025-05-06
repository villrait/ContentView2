import UIKit

class CartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cart"
        view.backgroundColor = .systemBackground
        
        let testButton = UIButton(type: .system)
        testButton.setTitle("Перейти на тест", for: .normal)
        testButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        testButton.center = view.center
        testButton.addTarget(self, action: #selector(openTestScreen), for: .touchUpInside)
        view.addSubview(testButton)
    }
    
    @objc private func openTestScreen() {
        let testVC = TestViewController()
        navigationController?.pushViewController(testVC, animated: true)
    }
}
