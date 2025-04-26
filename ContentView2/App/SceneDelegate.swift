import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)

        // Создаем TabBarViewController
        let tabBarVC = TabBarViewController()

        // Устанавливаем TabBarViewController как корневой view controller окна
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
    }
}
