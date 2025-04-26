import UIKit
import SideMenu

final class TabBarViewController: UITabBarController {

    private var customTabBar: UIStackView!
    private var viewControllersForTabBar: [UIViewController]!
    var menu: SideMenuNavigationController?
    lazy var menuVC: MenuViewController = {
        let viewController = MenuViewController()
        return viewController
    }()
    
    let actionHandler = TabBarActionHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if !isViewLoaded {
            print("Error: view is not loaded")
            return
        }

        setupTabBar()
        setupViewControllers()
        configureSideMenu()

        guard customTabBar != nil else {
            print("Error: customTabBar is nil")
            return
        }
        // Проверяем, что кнопки получили action
        if let stackView = customTabBar {
            actionHandler.customTabBar = stackView  // Важно: связываем handler с TabBar
            stackView.arrangedSubviews.forEach { view in
                if let button = view as? UIButton {
                    button.addAction(actionHandler.action, for: .touchUpInside)
                    print("Кнопка \(button.tag) готова к нажатию")
                }
            }
        }
        
        tabBar.isHidden = true
        setViewControllers(viewControllersForTabBar, animated: true)
        view.addSubview(customTabBar)
        setupTabBarLayout()
    }

    private func setupTabBar() {
        customTabBar = TabBarFactory.createTabBar(actionHandler: actionHandler)
    }

    private func setupViewControllers() {
        let viewControllers = ViewControllerFactory.createViewControllers()
        viewControllersForTabBar = viewControllers.map { CustomNavigationController(rootViewController: $0) }
    }

    private func configureSideMenu() {
        menu = SideMenuConfigurator.configure(menuVC: menuVC)
        SideMenuManager.default.leftMenuNavigationController = menu
    }

    private func setupTabBarLayout() {
        TabBarLayoutConfigurator.configureLayout(for: customTabBar, in: view)
    }
}
