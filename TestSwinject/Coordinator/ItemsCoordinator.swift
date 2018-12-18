import UIKit
import Swinject

class ItemsCoordinator: NavigationCoordinator {

  private var childCoordinators = [ChildCoordinator: Coordinator]()

  let window: UIWindow
  let navigationController: UINavigationController
  let resolver: Resolver

  init(resolver: Resolver, window: UIWindow) {
    self.resolver = resolver
    self.window = window
    navigationController = UINavigationController()
    window.rootViewController = navigationController
  }

  func start() {
    let selectedCategory = Item.Category.first
    showItems(category: selectedCategory)
  }

  private func showItems(category: Item.Category) {
    let vc = resolver.resolve(ItemsViewController.self)!
    vc.viewModel.category = category
    vc.viewModel.onItemSelected = { [unowned self] (item) in
      self.showDetail(for: item)
    }
    vc.viewModel.onProfileTouched = { [unowned self] in
      self.showProfile()
    }
    navigationController.pushViewController(vc, animated: false)
  }

  private func showDetail(for item: Item) {
    let itemVC = resolver.resolve(ItemDetailsViewController.self)!
    itemVC.viewModel.item = item
    navigationController.pushViewController(itemVC, animated: true)
  }

  private func showProfile() {
    let profileCoordinator = ProfileCoordinator(resolver: resolver)
    profileCoordinator.presentingViewController = navigationController
    childCoordinators[.profile] = profileCoordinator
    profileCoordinator.onFinish = { [unowned self] in
      self.childCoordinators.removeValue(forKey: .profile)
    }
    profileCoordinator.start()
  }

  enum ChildCoordinator {
    case profile
  }
}
