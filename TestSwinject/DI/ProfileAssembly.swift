import Swinject

class ProfileAssembly: Assembly {
  func assemble(container: Container) {
    container.register(ProfileViewModel.self) { (r) in
      ProfileViewModel(userInfoInteractor: r.resolve(UserInfoInteractor.self)!)
    }
    container.register(ProfileViewController.self) { (_) in ProfileViewController() }
      .initCompleted { (r, vc) in
        vc.viewModel = r.resolve(ProfileViewModel.self)!
      }
  }
}
