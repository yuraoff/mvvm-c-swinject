import Swinject
import SwinjectAutoregistration

class ProfileAssembly: Assembly {
  func assemble(container: Container) {
    container.autoregister(ProfileViewModel.self, initializer: ProfileViewModel.init)
    container.register(ProfileViewController.self) { (_) in ProfileViewController() }
      .initCompleted { (r, vc) in
        vc.viewModel = r.resolve(ProfileViewModel.self)!
      }
  }
}
