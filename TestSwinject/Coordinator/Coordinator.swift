import Swinject
import UIKit

protocol Coordinator: class {
  func start()
}

protocol NavigationCoordinator: Coordinator {
  var navigationController: UINavigationController { get }
}

protocol TabBarCoordinator: Coordinator {
  var tabBar: UITabBarController { get }
}
