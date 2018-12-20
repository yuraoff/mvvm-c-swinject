import Swinject
import SwinjectAutoregistration

class ItemsAssembly: Assembly {
  func assemble(container: Container) {
    container.autoregister(ItemsViewModel.self, initializer: ItemsViewModel.init)
    container.register(ItemsViewController.self) { (r) in ItemsViewController() }
      .initCompleted { (r, vc) in
        vc.viewModel = r.resolve(ItemsViewModel.self)!
      }
  }
}
