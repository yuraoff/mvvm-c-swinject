import Swinject

class ItemsAssembly: Assembly {
  func assemble(container: Container) {
    container.register(ItemsViewModel.self) { (r) in
      ItemsViewModel(itemInteractor: r.resolve(ItemInteractor.self)!)
    }
    container.register(ItemsViewController.self) { (r) in
      ItemsViewController()
    }.initCompleted { (r, vc) in
      vc.viewModel = r.resolve(ItemsViewModel.self)!
    }
  }
}
