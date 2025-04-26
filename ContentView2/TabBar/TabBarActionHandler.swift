import UIKit

final class TabBarActionHandler {
    weak var customTabBar: UIStackView?  // weak, чтобы не было retain cycle
    
    lazy var action = UIAction { [weak self] sender in
        guard let button = sender.sender as? UIButton,
              let self = self else { return }
        
        print("Кнопка нажата, tag = \(button.tag)")
        
        if let tabBarController = button.findViewController() as? TabBarViewController {
            tabBarController.selectedIndex = button.tag
            self.updateOpacity(selectedTag: button.tag)
        }
    }
    
    private func updateOpacity(selectedTag: Int) {
        guard let customTabBar = customTabBar else {
            print("⚠️ customTabBar не установлен!")
            return
        }
        
        customTabBar.arrangedSubviews.forEach { view in
            guard let button = view as? UIButton else { return }
            button.alpha = (button.tag == selectedTag) ? 1.0 : 0.5
        }
    }
}
// MARK: - findViewController
extension UIView {
    func findViewController() -> UIViewController? {
        var responder: UIResponder? = self
        while responder != nil {
            if let viewController = responder as? UIViewController {
                return viewController
            }
            responder = responder?.next
        }
        return nil
    }
}
