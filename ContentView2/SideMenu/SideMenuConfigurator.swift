import UIKit
import SideMenu

class SideMenuConfigurator {
    static func configure(menuVC: MenuViewController) -> SideMenuNavigationController {
        let menu = SideMenuNavigationController(rootViewController: menuVC)
        menu.leftSide = true
        menu.setNavigationBarHidden(false, animated: false)

        menu.presentationStyle = .menuSlideIn
        menu.presentationStyle.backgroundColor = .darkGray
        menu.presentationStyle.presentingEndAlpha = 0.5

        let screenWidth = UIScreen.main.bounds.width
        menu.menuWidth = screenWidth * 0.75

        return menu
    }
}
