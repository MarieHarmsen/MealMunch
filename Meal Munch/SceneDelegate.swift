import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let navController = UINavigationController()
            let viewController = HomeViewController(viewModel: HomeViewModel())
            
            navController.viewControllers = [viewController]
            window.rootViewController = navController
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
