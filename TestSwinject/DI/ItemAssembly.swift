import Swinject
import SwinjectAutoregistration

class ItemAssembly: Assembly {
  func assemble(container: Container) {
    container.autoregister(ItemDetailsViewModel.self, initializer: ItemDetailsViewModel.init)
    container.register(ItemDetailsViewController.self) { (_) in ItemDetailsViewController() }
      .initCompleted { (r, vc) in
        vc.viewModel = r.resolve(ItemDetailsViewModel.self)!
      }
  }
}
