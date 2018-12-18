import Swinject

class ItemAssembly: Assembly {
  func assemble(container: Container) {
    container.register(ItemDetailsViewModel.self) { (r) in
      ItemDetailsViewModel(itemInteractor: r.resolve(ItemInteractor.self)!)
    }
    container.register(ItemDetailsViewController.self) { (_) in ItemDetailsViewController() }
      .initCompleted { (r, vc) in
        vc.viewModel = r.resolve(ItemDetailsViewModel.self)!
      }
  }
}
