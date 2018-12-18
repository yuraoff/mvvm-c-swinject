import UIKit
import Swinject

class AppCoordinator: Coordinator {

  private let window: UIWindow
  private var childCoordinators = [ChildCoordinator: Coordinator]()
  let resolver: Resolver

  init(window: UIWindow, resolver: Resolver) {
    self.window = window
    self.resolver = resolver
  }

  func start() {
    showItems()
  }

  private func showItems() {
    let itemsCoordinator = ItemsCoordinator(resolver: resolver, window: window)
    childCoordinators[.items] = itemsCoordinator
    itemsCoordinator.start()
  }

  enum ChildCoordinator {
    case items
  }
}
