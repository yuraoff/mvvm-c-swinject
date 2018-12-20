import Swinject
import SwinjectAutoregistration
import UIKit

class CommonAssembly: Assembly {
  func assemble(container: Container) {
    container.register(ItemRepository.self) { _ in ItemRepository() }
      .inObjectScope(.container)
    container.autoregister(ItemInteractor.self, initializer: ItemInteractor.init)
      .inObjectScope(.container)
    container.register(UserRepository.self) { (r) in UserRepository() }
      .inObjectScope(.container)
    container.autoregister(UserInfoInteractor.self, initializer: UserInfoInteractor.init)
      .inObjectScope(.container)
  }
}
