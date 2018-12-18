import UIKit
import Swinject

class ProfileCoordinator: NavigationCoordinator {

  private var resolver: Resolver
  var navigationController: UINavigationController
  var presentingViewController: UIViewController!

  var onFinish: (() -> Void)?

  init(resolver: Resolver) {
    navigationController = UINavigationController()
    self.resolver = resolver
  }

  func start() {
    let profileVC = resolver.resolve(ProfileViewController.self)!
    profileVC.viewModel.dismissOnTouched = { [unowned self] in
      self.navigationController.dismiss(animated: true, completion: nil)
      self.onFinish?()
    }
    navigationController.pushViewController(profileVC, animated: true)
    presentingViewController.present(navigationController, animated: true, completion: nil)
  }

}
